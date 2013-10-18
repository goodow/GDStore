//
//  GDRCollaborativeMapViewController.h
//  GDRealtime
//
//  Created by 大黄 on 13-10-15.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GDRModel;

@interface GDRCollaborativeMapViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate>

+(void)initializerWithModel:(GDRModel *)model;


@end
