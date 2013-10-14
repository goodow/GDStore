#import <UIKit/UIKit.h>
@class GDRModel;

@interface GDRCollaborativeListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

+(void)initializerWithModel:(GDRModel *)model;

@end
