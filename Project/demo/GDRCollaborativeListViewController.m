//
//  GDRCollaborativeListViewController.m
//  GDRealtime
//
//  Created by 大黄 on 13-10-14.
//  Copyright (c) 2013年 Larry Tin. All rights reserved.
//

#import "GDRCollaborativeListViewController.h"
#import "GDR.h"

@interface GDRCollaborativeListViewController ()

@property (nonatomic, weak) IBOutlet UITextField *addItemTextField;
@property (nonatomic, weak) IBOutlet UITextField *selectedValueOfItemTextField;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicatorView;

@property (nonatomic, strong) GDRDocument *doc;
@property (nonatomic, strong) GDRModel *mod;
@property (nonatomic, strong) GDRCollaborativeMap *root;
@property (nonatomic, strong) GDRCollaborativeList *list;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;

-(IBAction)addItemByString:(id)sender;
-(IBAction)clearList:(id)sender;
-(IBAction)changeSelectedItemValue:(id)sender;
@end


static NSString * LIST_KEY = @"demo_list";

@implementation GDRCollaborativeListViewController

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Load" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    [GDRRealtime load:[dictionary objectForKey:@"load"] onLoaded:[self onLoadedBlock] opt_initializer:nil opt_error:nil];
    [self.activityIndicatorView startAnimating];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collaborative List
+(void)initializerWithModel:(GDRModel *)model{
    
    GDRCollaborativeMap *root = [model getRoot];
    GDRCollaborativeList *arr = [model createList:[NSArray arrayWithObjects:@"aa",@"bbb",@"cccc", nil]];
    [root set:LIST_KEY value:arr];
    
}

- (GDRDocumentLoadedBlock) onLoadedBlock{
    GDRDocumentLoadedBlock onLoaded = ^(GDRDocument *document) {
        self.doc = document;
        __weak GDRCollaborativeListViewController *weakSelf = self;
        [self.doc addDocumentSaveStateListener:^(GDRDocumentSaveStateChangedEvent *event) {
            if ([event isSaving]) {
                [weakSelf.activityIndicatorView stopAnimating];
            }
            
        }];
        self.mod = [self.doc getModel];
        self.root = [self.mod getRoot];
        
        [self connectList];
    };
    return onLoaded;
}

- (void) connectList {
    self.list = [self.root get:LIST_KEY];
    [self.tableView reloadData];
    [self.activityIndicatorView stopAnimating];
    id block = ^(GDRBaseModelEvent *event) {
        [self.activityIndicatorView startAnimating];
        [self.tableView reloadData];
    };
    
    [self.list addValuesAddedListener:block];
    [self.list addValuesRemovedListener:block];
    [self.list addValuesSetListener:block];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.list length];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CollaborativeListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text =[self.list get:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [self.list remove:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.selectedIndexPath = indexPath;
}

#pragma mark -IBAction
-(IBAction)addItemByString:(id)sender{
    if (![self.addItemTextField.text isEqualToString:@""])
        [self.list insert:[self.list length] value:self.addItemTextField.text];
}
-(IBAction)clearList:(id)sender{
    
    [self.list clear];
    self.selectedIndexPath = nil;
    
}
-(IBAction)changeSelectedItemValue:(id)sender{
    if (self.selectedIndexPath) {
        [self.list set:self.selectedIndexPath.row value:self.selectedValueOfItemTextField.text];
    }
}

@end
