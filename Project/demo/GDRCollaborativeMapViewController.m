//
//  GDRCollaborativeMapViewController.m
//  GDRealtime
//
//  Created by 大黄 on 13-10-15.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import "GDRCollaborativeMapViewController.h"
#import "GDR.h"

@interface GDRCollaborativeMapViewController ()

@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, weak) IBOutlet UIPickerView *pickerView;
@property (nonatomic, weak) IBOutlet UITextField *keyTextField;
@property (nonatomic, weak) IBOutlet UITextField *valueTextField;
@property (nonatomic, weak) IBOutlet UIButton *undoBtn;
@property (nonatomic, weak) IBOutlet UIButton *redoBtn;


@property (nonatomic, strong) GDRDocument *doc;
@property (nonatomic, strong) GDRModel *mod;
@property (nonatomic, strong) GDRCollaborativeMap *root;
@property (nonatomic, strong) GDRCollaborativeMap *map;


-(IBAction)undoEvent:(id)sender;
-(IBAction)redoEvent:(id)sender;


@end

static NSString * MAP_KEY = @"demo_map";

@implementation GDRCollaborativeMapViewController

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
#pragma mark - Collaborative map
+(void)initializerWithModel:(GDRModel *)model{
    
    GDRCollaborativeMap *root = [model getRoot];
    
    GDRCollaborativeMap *map = [model createMap:
                                [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"value 1",@"value 2",@"value 3",@"value 4",@"value 5", nil]
                                                            forKeys:[NSArray arrayWithObjects:@"key 1",@"key 2",@"key 3",@"key 4",@"key 5", nil]]];
    [root set:MAP_KEY value:map];
    
}
- (GDRDocumentLoadedBlock) onLoadedBlock{
    GDRDocumentLoadedBlock onLoaded = ^(GDRDocument *document) {
        self.doc = document;
        __weak GDRCollaborativeMapViewController *weakSelf = self;
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

    self.map = [self.root get:MAP_KEY];
    [self.pickerView reloadAllComponents];
    [self.activityIndicatorView stopAnimating];
    
    [self.pickerView selectRow:[self lastIndexOfMap] inComponent:0 animated:YES];
    [self.pickerView selectRow:[self lastIndexOfMap] inComponent:1 animated:YES];
    self.keyTextField.text = [[self.map keys]objectAtIndex:[self lastIndexOfMap]];
    self.valueTextField.text = [[self.map values]objectAtIndex:[self lastIndexOfMap]];
    
    __weak GDRCollaborativeMapViewController *weakSelf = self;

    [self.map addValueChangedListener:^(GDRValueChangedEvent *event) {
        [weakSelf.activityIndicatorView startAnimating];
        [weakSelf.pickerView reloadAllComponents];
        [weakSelf.pickerView selectRow:[weakSelf lastIndexOfMap] inComponent:0 animated:YES];
        [weakSelf.pickerView selectRow:[weakSelf lastIndexOfMap] inComponent:1 animated:YES];
    }];
    
}
-(NSInteger)lastIndexOfMap{
    if (self.map.size >0) {
        return self.map.size - 1;
    }else{
        return 0;
    }
}

#pragma mark dataSouce Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return  2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0){
        return [[self.map keys] count];
    }else{
        return [[self.map values]count];
    }
}
#pragma mark delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  
    if (component == 0){
        return [[self.map keys] objectAtIndex:row];
    }else{
        return  [[self.map values] objectAtIndex:row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if(component == 0){
        [self.pickerView selectRow:row inComponent:1 animated:YES];
    }else{
        [self.pickerView selectRow:row inComponent:0 animated:YES];
    }
    
    self.keyTextField.text =[[self.map keys] objectAtIndex:row];
    self.valueTextField.text = [[self.map values] objectAtIndex:row];
    
    
}

#pragma mark -IBAction
-(IBAction)clearTheMap:(id)sender{
    [self.map clear];
}
-(IBAction)removeSelectedItem:(id)sender{
    int selectedRow = [self.pickerView  selectedRowInComponent:0 ];
    [self.map remove:[[self.map keys] objectAtIndex:selectedRow]];
}

-(IBAction)putKeyValuePair:(id)sender{
    if (self.keyTextField.text && self.valueTextField.text) {
        [self.map set:self.keyTextField.text value:self.valueTextField.text];
    }
}
-(IBAction)undoEvent:(id)sender{
    [self.mod undo];
}
-(IBAction)redoEvent:(id)sender{
    [self.mod redo];
}

@end
