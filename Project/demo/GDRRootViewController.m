#import "GDRRootViewController.h"
#import "GTMHTTPFetcher/GTMHTTPFetcherLogViewController.h"
#import "GDR.h"

@interface GDRRootViewController ()

@end

@implementation GDRRootViewController {
  GDRDocument *doc;
  GDRModel *mod;
  GDRCollaborativeMap *root;
  GDRCollaborativeString *str;
}

static NSString * STR_KEY = @"demo_string";


- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  // Step 1  Authorize
  [GDRRealtime authorize:@"fakeToken" userId:@"fakeUser"];
  
  // Step 2  Create or Open a document
  GDRDocumentLoadedBlock onLoaded = ^(GDRDocument *document) {
    doc = document;
    mod = [doc getModel];
    root = [mod getRoot];
    
    [self connectString];
  };
  GDRModelInitializerBlock initializer = ^(GDRModel *model) {
    mod = model;
    root = [mod getRoot];
    [self initializeString];
  };
  [GDRRealtime load:@"@tmp/test" onLoaded:onLoaded initializer:initializer error:nil];
}

- (void) initializeString {
  GDRCollaborativeString *string = [mod createString:@"Edit Me!"];
  [root set:STR_KEY value:string];
}
- (void) connectString {
  str = [root get:STR_KEY];
  GDRTextInsertedBlock block = ^(GDRBaseModelEvent *event) {
    self.textView.text = [str getText];
  };
  [str addTextDeletedListener: (GDRTextDeletedBlock) block];
  [str addTextInsertedListener:block];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  if(indexPath.section == [self numberOfSectionsInTableView:self.tableView] -1 &&
     indexPath.item == 0){
    GTMHTTPFetcherLogViewController *logViewController = [[GTMHTTPFetcherLogViewController alloc] init];
    [self.navigationController pushViewController:logViewController
                                         animated:YES];
  }
}

@end
