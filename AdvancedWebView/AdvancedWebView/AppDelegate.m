//
//  AppDelegate.m
//  AdvancedWebView
//
//  Created by Colin Teahan on 5/15/24.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <AVFAudio/AVFAudio.h>

@interface AppDelegate ()

@property (strong, nonatomic) ViewController *vc;

@end

@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //UIScreen *screen = [UIScreen mainScreen];
    //UIWindow *window = [[UIWindow alloc] initWithFrame:screen.bounds];
    //UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.vc = [[ViewController alloc] init];
    window.rootViewController = self.vc;
    [window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey,id> *)launchOptions
{
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"[delegate] application will resign active!");
    [self.vc playInBackground];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
    [self.vc playInBackground]; // trigger js to keep playing
}


#pragma mark - UISceneSession lifecycle


// fuck all that scene shit
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}

//
//#pragma mark - Core Data stack
//
//@synthesize persistentContainer = _persistentContainer;
//
//- (NSPersistentContainer *)persistentContainer {
//    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
//    @synchronized (self) {
//        if (_persistentContainer == nil) {
//            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"AdvancedWebView"];
//            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
//                if (error != nil) {
//                    // Replace this implementation with code to handle the error appropriately.
//                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                    
//                    /*
//                     Typical reasons for an error here include:
//                     * The parent directory does not exist, cannot be created, or disallows writing.
//                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                     * The device is out of space.
//                     * The store could not be migrated to the current model version.
//                     Check the error message to determine what the actual problem was.
//                    */
//                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//                    abort();
//                }
//            }];
//        }
//    }
//    
//    return _persistentContainer;
//}
//
//#pragma mark - Core Data Saving support
//
//- (void)saveContext {
//    NSManagedObjectContext *context = self.persistentContainer.viewContext;
//    NSError *error = nil;
//    if ([context hasChanges] && ![context save:&error]) {
//        // Replace this implementation with code to handle the error appropriately.
//        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
//        abort();
//    }
//}

@end
