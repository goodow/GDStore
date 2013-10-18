//
//  GDRCollaborativeListViewController.h
//  GDRealtime
//
//  Created by 大黄 on 13-10-14.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GDRModel;

@interface GDRCollaborativeListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


+(void)initializerWithModel:(GDRModel *)model;



@end
