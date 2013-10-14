//
//  GDRCollaborativeListViewController.h
//  GDRealtime
//
//  Created by 大黄 on 13-10-14.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDRCollaborativeListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *addItemTextField;
@property (nonatomic, strong) IBOutlet UITextField *selectedValueOfItemTextField;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

-(IBAction)addItemByString:(id)sender;
-(IBAction)clearList:(id)sender;
-(IBAction)changeSelectedItemValue:(id)sender;

@end
