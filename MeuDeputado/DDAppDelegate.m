//
//  DDAppDelegate.m
//  MeuDeputado
//
//  Created by rafael almeida on 19/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import "DDAppDelegate.h"
#import "Deputado.h"

@implementation DDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"model.sqlite"];
    
    NSDateFormatter* myFormatter = [[NSDateFormatter alloc] init];
    [myFormatter setDateFormat:@"dd/MM/yyyy"];
    NSDate* myDate = [myFormatter dateFromString:@"25/12/1924"];
    
    Deputado *deputado = [Deputado MR_createEntity];
    deputado.nome = @"nome";
    deputado.email = @"nome@gov.com.br";
    deputado.estado = @"SAO PAULO";
    deputado.favorito = 0;
    deputado.foto = @"http://t1.gstatic.com/images?q=tbn:ANd9GcS9fMG_4SWrp_jOwYWmeFWhKpDkNbvFXH4kPIWToqNTovCJYCUTFA";
    deputado.nascimento = myDate;
    deputado.partido = @"PT";
    deputado.presenca = [[NSNumber alloc] initWithInt:114];
    deputado.telefone = @"93212-5234";
    deputado.numeDeSessoes = [[NSNumber alloc]initWithInt:500];
    deputado.nomeParlamentar = @"nome_parlamentar";
    deputado.gabinete = @"testesteste";
    deputado.numDeFaltas = [[NSNumber alloc]initWithInt:386];
    
    deputado = [Deputado MR_createEntity];
    deputado.nome = @"nome2";
    deputado.email = @"nome2@gov.com.br";
    deputado.estado = @"RJ";
    deputado.favorito = 0;
    deputado.foto = @"http://t1.gstatic.com/images?q=tbn:ANd9GcS9fMG_4SWrp_jOwYWmeFWhKpDkNbvFXH4kPIWToqNTovCJYCUTFA";
    deputado.nascimento = myDate;
    deputado.partido = @"PSDB";
    deputado.presenca = [[NSNumber alloc] initWithInt:200];
    deputado.telefone = @"93234-2434";
    deputado.numeDeSessoes = [[NSNumber alloc]initWithInt:500];
    deputado.nomeParlamentar = @"nome_parlamentar2";
    deputado.gabinete = @"testesteste2";
    deputado.numDeFaltas = [[NSNumber alloc]initWithInt:300];
    
    NSArray *deputados = [Deputado MR_findAll];
    NSLog(@"Contador %d", [deputados count]);
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
