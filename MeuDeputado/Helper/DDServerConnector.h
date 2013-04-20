//
//  DDServerConnector.h
//  MeuDeputado
//
//  Created by vitor navarro on 20/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFJSONRequestOperation.h"

@interface DDServerConnector : NSObject
+ (DDServerConnector *)sharedInstance;
+(void)test;
+(void)requestRankingsWithCompletion:(void (^)(NSDictionary * JSON))onCompletion onError:(void (^)(NSError *error, id JSON))onError;
+(void)requestDeputadosWithCompletion:(void (^)(NSDictionary * JSON))onCompletion onError:(void (^)(NSError *error, id JSON))onError;
@end
