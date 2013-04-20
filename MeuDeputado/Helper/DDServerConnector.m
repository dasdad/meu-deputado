//
//  DDServerConnector.m
//  MeuDeputado
//
//  Created by vitor navarro on 20/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import "DDServerConnector.h"

@implementation DDServerConnector

static DDServerConnector *_sharedInstance = nil;
static dispatch_once_t onceToken;

+ (DDServerConnector *)sharedInstance {
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[DDServerConnector alloc] init];
    });
    
    return _sharedInstance;
}

+(void)test{
    NSURL *url = [NSURL URLWithString:@"http://httpbin.org/ip"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSDictionary *dic = [NSDictionary dictionaryWithDictionary:JSON];
        NSLog(@"IP Address: %@ %@", [JSON valueForKeyPath:@"origin"],dic);
    } failure:nil];
    
    [operation start];
}

+(void)requestRankingsWithCompletion:(void (^)(NSDictionary * JSON))onCompletion onError:(void (^)(NSError *error, id JSON))onError{
    [DDServerConnector requestWithURL:@"http://httpbin.org/ip" onCompletion:onCompletion onError:onError];
}

+(void)requestDeputadosWithCompletion:(void (^)(NSDictionary * JSON))onCompletion onError:(void (^)(NSError *error, id JSON))onError{
    [DDServerConnector requestWithURL:@"http://httpbin.org/ip" onCompletion:onCompletion onError:onError];
}

+(void)requestWithURL:(NSString *)urlName onCompletion:(void (^)(NSDictionary * JSON))onCompletion onError:(void (^)(NSError *error, id JSON))onError{
    NSURL *url = [NSURL URLWithString:urlName];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        onCompletion([NSDictionary dictionaryWithDictionary:JSON]);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        onError(error,JSON);
    }];
    
    [operation start];
}

@end
