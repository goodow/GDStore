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
{
    GDRDocument *doc;
    GDRModel *mod;
    GDRCollaborativeMap *root;
    GDRCollaborativeList *list;
    NSIndexPath *selectedIndexPath;
}
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
    [GDRRealtime load:@"@tmp/ios/test" onLoaded:[self onLoadedBlock] opt_initializer:[self initializerBlock] opt_error:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collaborative List
- (GDRModelInitializerBlock) initializerBlock{
    GDRModelInitializerBlock initializer = ^(GDRModel *model) {
        mod = model;
        root = [mod getRoot];
        [self initializeList];
    };
    return initializer;
}
- (GDRDocumentLoadedBlock) onLoadedBlock{
    GDRDocumentLoadedBlock onLoaded = ^(GDRDocument *document) {
        doc = document;
        mod = [doc getModel];
        root = [mod getRoot];
        
        [self connectList];
    };
    return onLoaded;
}

- (void) initializeList {
    GDRCollaborativeList *arr = [mod createList:[NSArray arrayWithObjects:@"aa",@"bbb",@"cccc", nil]];
    [root set:LIST_KEY value:arr];
}
- (void) connectList {
    list = [root get:LIST_KEY];
    
    for (int i = 0; i<list.length; i++) {
        NSLog(@"list content:%@",[list get:i]);
        [self.tableView reloadData];
    }
    id block = ^(GDRBaseModelEvent *event) {
        [self.tableView reloadData];
    };
    
    [list addValuesAddedListener:block];
    [list addValuesRemovedListener:block];
    [list addValuesSetListener:block];
    
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
    return [list length];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CollaborativeListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text =[list get:indexPath.row];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [list remove:indexPath.row];
        // Delete the row from the data source.
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
    selectedIndexPath = indexPath;
}
#pragma mark -IBAction
-(IBAction)addItemByString:(id)sender{
    if (![self.addItemTextField.text isEqualToString:@""])
        [list insert:[list length] value:self.addItemTextField.text];
}
-(IBAction)clearList:(id)sender{
    
    [list clear];
    selectedIndexPath = nil;
    
}
-(IBAction)changeSelectedItemValue:(id)sender{
    if (selectedIndexPath) {
        [list set:selectedIndexPath.row value:self.selectedValueOfItemTextField.text];
    }
}

@end
