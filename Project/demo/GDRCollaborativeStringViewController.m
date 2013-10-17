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
@property (nonatomic, strong) GDRDocument *doc;
@property (nonatomic, strong) GDRModel *mod;
@property (nonatomic, strong) GDRCollaborativeMap *root;
@property (nonatomic, strong) GDRCollaborativeString *str;

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
        self.mod = [self.doc getModel];
        self.root = [self.mod getRoot];
        
        [self connectString];
    };

    return onLoaded;
}
- (void) connectString {
    self.str = [self.root get:STR_KEY];
    self.textView.text = [self.str getText];
    id block = ^(GDRBaseModelEvent *event) {
        if(!event.isLocal) {
            self.textView.text = [self.str getText];
        }
    };
    [self.str addTextDeletedListener: block];
    [self.str addTextInsertedListener:block];
}

#pragma mark -UITextViewDelegate
- (void)textViewDidChange:(UITextView *)aTextView {
    NSLog(@"---%@0----",aTextView.text);
    [self.str setText:aTextView.text];
}

@end
