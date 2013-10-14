#import <UIKit/UIKit.h>
@class GDRModel;

@interface GDRCollaborativeMapViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate>

+(void)initializerWithModel:(GDRModel *)model;

@end
