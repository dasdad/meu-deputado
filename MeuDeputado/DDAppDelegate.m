//
//  DDAppDelegate.m
//  MeuDeputado
//
//  Created by rafael almeida on 19/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import "DDAppDelegate.h"
#import "Deputado.h"
#import "MagicalRecordShorthand.h"
#import "NSManagedObjectModel+MagicalRecord.h"
#import "Ranking.h"
#import "DDServerConnector.h"

@implementation DDAppDelegate




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"model.sqlite"];
    
    for (NSInteger i =0 ; i < 10; i++) {
        
        Deputado *deputado = [Deputado MR_createEntity];
        deputado.nome = [NSString stringWithFormat:@"Deputado %d", i];

    }
    
    for (NSInteger i =0 ; i < 20; i++) {
        
        Ranking *ranking = [Ranking MR_createEntity];
       
        ranking.nome = [NSString stringWithFormat:@"Nome %@ ", ranking.nome];
        ranking.ordem = [NSNumber numberWithInteger:i];
        ranking.rank = [NSNumber numberWithInteger:i/10];
    }
    

    NSArray *deputados = [Deputado MR_findAll];
    NSLog(@"Contador %d", [deputados count]);
    
    [DDServerConnector test];
    
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

@end
