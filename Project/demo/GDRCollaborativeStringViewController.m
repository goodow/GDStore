//
//  GDRCollaborativeStringViewController.m
//  GDRealtime
//
//  Created by 大黄 on 13-10-14.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//
#import "GDR.h"
#import "GDRCollaborativeStringViewController.h"


@interface GDRCollaborativeStringViewController ()

@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, weak) IBOutlet UIButton *undoBtn;
@property (nonatomic, weak) IBOutlet UIButton *redoBtn;

@property (nonatomic, strong) GDRDocument *doc;
@property (nonatomic, strong) GDRModel *mod;
@property (nonatomic, strong) GDRCollaborativeMap *root;
@property (nonatomic, strong) GDRCollaborativeString *str;

-(IBAction)undoEvent:(id)sender;
-(IBAction)redoEvent:(id)sender;

@end

static NSString * STR_KEY = @"demo_string";

@implementation GDRCollaborativeStringViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Load" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    [GDRRealtime load:[dictionary objectForKey:@"load"] onLoaded:[self onLoadedBlock] opt_initializer:nil opt_error:nil];
    [self.activityIndicatorView startAnimating];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Collaborative strings
+(void)initializerWithModel:(GDRModel *)model{
    
    GDRCollaborativeMap *root = [model getRoot];
    GDRCollaborativeString *string = [model createString:@"Edit Me!"];
    [root set:STR_KEY value:string];
    
}

- (GDRDocumentLoadedBlock) onLoadedBlock{
    GDRDocumentLoadedBlock onLoaded = ^(GDRDocument *document) {
        self.doc = document;
        __weak GDRCollaborativeStringViewController *weakSelf = self;
        [self.doc addDocumentSaveStateListener:^(GDRDocumentSaveStateChangedEvent *event) {
            if (![event isSaving] && ![event isPending]) {
                [weakSelf.activityIndicatorView stopAnimating];                
            }

        }];
        self.mod = [self.doc getModel];
        [self.mod addUndoRedoStateChangedListener:^(GDRUndoRedoStateChangedEvent *event) {
            
            if ([event canUndo]) {
                [weakSelf.undoBtn setEnabled:YES];
            }else{
                [weakSelf.undoBtn setEnabled:NO];
            }
            
            if ([event canRedo]) {
                [weakSelf.redoBtn setEnabled:YES];
            }else{
                [weakSelf.redoBtn setEnabled:NO];
            }
            
        }];
        self.root = [self.mod getRoot];
        [self connectString];
    };

    return onLoaded;
}
- (void) connectString {
    self.str = [self.root get:STR_KEY];
    self.textView.text = [self.str getText];
    [self.activityIndicatorView stopAnimating];
    id block = ^(GDRBaseModelEvent *event) {
        self.textView.text = [self.str getText];
        [self.activityIndicatorView startAnimating];
    };
    [self.str addTextDeletedListener: block];
    [self.str addTextInsertedListener:block];
}

#pragma mark -UITextViewDelegate
- (void)textViewDidChange:(UITextView *)aTextView {
    [self.str setText:aTextView.text];
}

#pragma mark -IBAction
-(IBAction)undoEvent:(id)sender{
    [self.mod undo];
}
-(IBAction)redoEvent:(id)sender{
    [self.mod redo];
}
@end
