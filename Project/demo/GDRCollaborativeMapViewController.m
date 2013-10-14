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

+(void)initializerWithModel:(GDRModel *)model{
  GDRCollaborativeMap *root = [model getRoot];
  GDRCollaborativeMap *map = [model createMap:@{@"Key 1": @"Value 1", @"Key 2": @"Value 2", @"Key 3": @"Value 3", @"Key 4": @"Value 4"}];
  [root set:MAP_KEY value:map];
}

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
  GDRDocumentLoadedBlock onLoaded = ^(GDRDocument *document) {
    __weak GDRCollaborativeMapViewController *weakSelf = self;
    self.doc = document;
    self.mod = [self.doc getModel];
    self.root = [self.mod getRoot];
    [self.activityIndicatorView stopAnimating];
    
    [self.doc addDocumentSaveStateListener:^(GDRDocumentSaveStateChangedEvent *event) {
      if ([event isSaving] || [event isPending]) {
        [weakSelf.activityIndicatorView startAnimating];
      } else {
        [weakSelf.activityIndicatorView stopAnimating];
      }
    }];
    [self.mod addUndoRedoStateChangedListener:^(GDRUndoRedoStateChangedEvent *event) {
      [weakSelf.undoBtn setEnabled:[event canUndo]];
      [weakSelf.redoBtn setEnabled:[event canRedo]];
    }];
    
    [self connectMap];
  };
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
  NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
  
  [self.activityIndicatorView startAnimating];
  [GDRRealtime load:[dictionary objectForKey:@"documentId"] onLoaded:onLoaded opt_initializer:nil opt_error:nil];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Collaborative map
- (void) connectMap {
  self.map = [self.root get:MAP_KEY];
  [self connectUi];

  __weak GDRCollaborativeMapViewController *weakSelf = self;
  [self.map addValueChangedListener:^(GDRValueChangedEvent *event) {
    [weakSelf connectUi];
  }];
}

-(void) connectUi {
  [self.pickerView reloadAllComponents];
  int idx = 0;
  NSString *key = self.keyTextField.text;
  if([self.map has:key]) {
    idx = [[self.map keys] indexOfObject:key];
  }
  [self.pickerView selectRow:idx inComponent:0 animated:YES];
  [self.pickerView selectRow:idx inComponent:1 animated:YES];
}

#pragma mark dataSouce Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
  return  2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
  return [self.map size];
}

#pragma mark delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
  NSString *key = [[self.map keys] objectAtIndex:row];
  return component == 0 ? key : [self.map get:key];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
  [self.pickerView selectRow:row inComponent:component ==0 ? 1 : 0 animated:YES];
  NSString *key = [[self.map keys] objectAtIndex:row];
  self.keyTextField.text = key;
  self.valueTextField.text = [self.map get:key];
}

#pragma mark -IBAction
-(IBAction)clearTheMap:(id)sender{
  [self.map clear];
}

-(IBAction)removeSelectedItem:(id)sender{
  int selectedRow = [self.pickerView  selectedRowInComponent:0];
  NSString *key = [self pickerView:self.pickerView titleForRow:selectedRow forComponent:0];
  [self.map remove:key];
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
