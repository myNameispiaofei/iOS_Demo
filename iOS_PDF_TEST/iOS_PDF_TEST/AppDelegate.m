//
//  AppDelegate.m
//  iOS_PDF_TEST
//
//  Created by 母斌 on 2019/6/18.
//  Copyright © 2019年 母斌. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ITTestViewController.h"
#import "ITSelectViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>
@property (nonatomic, strong) UITabBarController *tabarCV;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    ViewController *root = [[ViewController alloc] init];
    UINavigationController *nv = [[UINavigationController alloc] initWithRootViewController:root];
    self.window.rootViewController = nv;
    return YES;
    
//    UIViewController *v1 = [[ITTestViewController alloc] init];
//    UIViewController *v2 = [[ITSelectViewController alloc] init];
//    self.tabarCV = [[UITabBarController alloc] init];
//    self.tabarCV.viewControllers = @[v1, v2];
//    self.tabarCV.delegate = self;
//    UITabBarItem * item = [UITabBarItem new];
//    item.title = @"11";
//
//    UITabBarItem * item1 = [UITabBarItem new];
//    item1.title = @"22";
//
//    self.tabarCV.tabBarItem = item;
//    self.window.rootViewController = self.tabarCV;
//    return YES;
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    CATransition *transiton = [CATransition animation];
    transiton.type = kCATransitionFade;
    [self.tabarCV.view.layer addAnimation:transiton forKey:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
   
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"iOS_PDF_TEST"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
