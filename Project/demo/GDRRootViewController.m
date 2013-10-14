#import "GDRRootViewController.h"
#import "GTMHTTPFetcher/GTMHTTPFetcherLogViewController.h"
#import "GDR.h"
#import "GDRCollaborativeStringViewController.h"

@interface GDRRootViewController ()

@end

@implementation GDRRootViewController {
  
}




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
  [GDRRealtime authorize:@"688185492143008835447" token:@"68c8f4141821bdcc7a43f4233a2b732d3ed956b5"];
 
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
    }else if (indexPath.section == 5){
        NSLog(@"edit the collaborative string");
        GDRCollaborativeStringViewController *collaborativeStringViewController = [[GDRCollaborativeStringViewController alloc]initWithNibName:@"GDRCollaborativeStringViewController" bundle:nil];
        [self.navigationController pushViewController:collaborativeStringViewController animated:YES];
    }
    

}

@end
