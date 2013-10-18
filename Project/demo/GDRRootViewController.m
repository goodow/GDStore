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
    
  NSString *path = [[NSBundle mainBundle] pathForResource:@"Load" ofType:@"plist"];
  NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
  // [GDRRealtime setServerAddress:@"http://drive.retechcorp.com:8080"];
  [GDRRealtime authorize:[dictionary objectForKey:@"userId"] token:[dictionary objectForKey:@"token"]];

  [GDRRealtime load:[dictionary objectForKey:@"load"]
           onLoaded:^(GDRDocument *document) {
        
  } opt_initializer:^(GDRModel *model) {
      
      //初始化String
      [GDRCollaborativeStringViewController initializerWithModel:model];
      //初始化List
      [GDRCollaborativeListViewController initializerWithModel:model];
      //初始化Map
      [GDRCollaborativeMapViewController initializerWithModel:model];
        
  } opt_error:^(GDRError *error) {
        
  }];
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
            [self.navigationController pushViewController:logViewController
                                                 animated:YES];
        }
    }else if (indexPath.section == 3){
        if (indexPath.row == 2) {
            NSLog(@"edit the collaborative string");
            GDRCollaborativeStringViewController *collaborativeStringViewController = [[GDRCollaborativeStringViewController alloc]initWithNibName:@"GDRCollaborativeStringViewController_ipad" bundle:nil];
            [self.navigationController pushViewController:collaborativeStringViewController animated:YES];
        }else if (indexPath.row == 3){
            NSLog(@"collaborative lists");
            GDRCollaborativeListViewController *collaborativeListViewController = [[GDRCollaborativeListViewController alloc]initWithNibName:@"GDRCollaborativeListViewController_ipad" bundle:nil];
            [self.navigationController pushViewController:collaborativeListViewController animated:YES];
        }else if (indexPath.row == 4){
            NSLog(@"collaborative map");
            GDRCollaborativeMapViewController *collaborativeMapViewController = [[GDRCollaborativeMapViewController alloc]initWithNibName:@"GDRCollaborativeMapViewController_ipad" bundle:nil];
            [self.navigationController pushViewController:collaborativeMapViewController animated:YES];
        }
        
        
    }
}

@end
