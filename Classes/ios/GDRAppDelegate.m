#import "GDRAppDelegate.h"
#import "GTLDevice.h"
#import "GTMHTTPFetcher/GTMHTTPFetcherLogging.h"
#import "com/goodow/realtime/channel/RealtimeChannelDemuxer.h"

@implementation GDRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [[ UIApplication sharedApplication] registerForRemoteNotificationTypes:UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound];
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  NSString *token = [ deviceToken description ];
  token = [ token stringByTrimmingCharactersInSet:[ NSCharacterSet characterSetWithCharactersInString:@"<>"]];
  token = [ token stringByReplacingOccurrencesOfString:@" " withString:@"" ];
  static GTLServiceDevice *service = nil;
  if(!service) {
    service = [[GTLServiceDevice alloc] init];
    service.retryEnabled = YES;
    [GTMHTTPFetcher setLoggingEnabled:YES];
  }
  GTLDeviceInfo *device = [GTLDeviceInfo object];
  device.deviceRegistrationID = token;
  UIDevice *currentDevice = [UIDevice currentDevice];
  device.deviceInformation = [currentDevice description];
//  device.timestamp = @([[NSDate date] timeIntervalSince1970]);
  GTLQueryDevice *query;
  GTLServiceTicket *ticket;
  query = [GTLQueryDevice queryForInsertOrUpdateDeviceInfoWithDeviceRegistrationID:token deviceInformation:@"cd"];
  query.timestamp = 1234;
  ticket = [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, id object, NSError *error) {
    if(error){
      
    }
  }];
//  query = [GTLQueryDevice queryForListDeviceInfo];
//  query.limit = 3;
//  ticket = [service executeQuery:query completionHandler:^(GTLServiceTicket *ticket, GTLDeviceCollectionResponseDeviceInfo *object, NSError *error) {
//    if(error){
//      
//    } else {
//      GTLDeviceInfo *d = object.items[0];
//    }
//  }];
  NSString *log = ticket.objectFetcher.log;
}

-(void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
  NSString * msg = userInfo[@"0"];
  [[ComGoodowRealtimeChannelRealtimeChannelDemuxer get] onMessageWithNSString:msg];
}

@end
