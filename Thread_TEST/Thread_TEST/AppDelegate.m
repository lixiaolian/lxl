//
//  AppDelegate.m
//  Thread_TEST
//
//  Created by 3005 on 13-7-30.
//  Copyright (c) 2013年 lxl. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController=[[[ViewController alloc] init] autorelease];
    int count=2000;
    NSThread *thread1=[[NSThread alloc] initWithTarget:self selector:@selector(takeMoney:) object:[NSNumber numberWithInt:count]];
    [thread1 setName:@"爸爸"];
    [thread1 start];
    [thread1 release];
    [self performSelectorInBackground:@selector(takeMoney:) withObject:[NSNumber numberWithInt:count]];
    [NSThread detachNewThreadSelector:@selector(takeMoney:) toTarget:self withObject:[NSNumber numberWithInt:count]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
-(void)takeMoney:(NSNumber *)num
{
    static int moneys=10000;
    @synchronized(self)
    {
        NSString * thread=[[NSThread currentThread] name] ;
        if (moneys>0)
        {
            NSLog(@"账户金额：%d",moneys);
            int count=[num intValue];
            if (moneys>count)
            {
                [NSThread sleepForTimeInterval:1];
                moneys-=count;
               NSLog(@"用户%@取钱金额是：%d\n",thread,count);
            }
            else
            {
                printf("对不起，您的账户余额不足！");
            }
        
        }
    }
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

@end
