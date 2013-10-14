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

+(void)initializerWithModel:(GDRModel *)model{
  GDRCollaborativeMap *root = [model getRoot];
  GDRCollaborativeString *string = [model createString:@"Edit Me!"];
  [root set:STR_KEY value:string];
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
    __weak GDRCollaborativeStringViewController *weakSelf = self;
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
    
    [self connectString];
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

- (void) connectString {
  self.str = [self.root get:STR_KEY];
  self.textView.text = [self.str getText];
  id block = ^(GDRBaseModelEvent *event) {
    self.textView.text = [self.str getText];
  };
  [self.str addObjectChangedListener:block];
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
