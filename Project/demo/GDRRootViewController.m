#import "GDRRootViewController.h"
#import "GTMHTTPFetcher/GTMHTTPFetcherLogViewController.h"
#import "GDR.h"
#import "GDRCollaborativeListViewController.h"
#import "GDRCollaborativeStringViewController.h"
#import "GDRCollaborativeMapViewController.h"

@interface GDRRootViewController ()

@end

@implementation GDRRootViewController

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
  
  NSString *path = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
  NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
  // [GDRRealtime setServerAddress:@"http://drive.retechcorp.com:8080"];
  [GDRRealtime authorize:[dictionary objectForKey:@"userId"] token:[dictionary objectForKey:@"token"]];
  
  [GDRRealtime load:[dictionary objectForKey:@"documentId"]
           onLoaded:^(GDRDocument *document) {}
    opt_initializer:^(GDRModel *model) {
      [GDRCollaborativeStringViewController initializerWithModel:model];
      [GDRCollaborativeListViewController initializerWithModel:model];
      [GDRCollaborativeMapViewController initializerWithModel:model];
    }
          opt_error:nil];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  if(indexPath.section == [self numberOfSectionsInTableView:self.tableView] -1) {
    if(indexPath.item == 0){
      GTMHTTPFetcherLogViewController *logViewController = [[GTMHTTPFetcherLogViewController alloc] init];
      [self.navigationController pushViewController:logViewController                                        animated:YES];
    }
  }else if (indexPath.section == 3){
    UIViewController *viewController;
    if (indexPath.row == 2) {
      viewController = [[GDRCollaborativeStringViewController alloc]initWithNibName:@"GDRCollaborativeStringViewController_ipad" bundle:nil];
    }else if (indexPath.row == 3){
      viewController = [[GDRCollaborativeListViewController alloc]initWithNibName:@"GDRCollaborativeListViewController_ipad" bundle:nil];
    }else if (indexPath.row == 4){
      viewController = [[GDRCollaborativeMapViewController alloc]initWithNibName:@"GDRCollaborativeMapViewController_ipad" bundle:nil];
    }
    [self.navigationController pushViewController:viewController animated:YES];
  }
}

@end
