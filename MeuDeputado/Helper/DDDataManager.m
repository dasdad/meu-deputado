//
//  DDDataManager.m
//  MeuDeputado
//
//  Created by vitor navarro on 20/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import "DDDataManager.h"

@implementation DDDataManager

static DDDataManager *_sharedInstance = nil;
static dispatch_once_t onceToken;

+ (DDDataManager *)sharedInstance {
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[DDDataManager alloc] init];
    });
    
    return _sharedInstance;
}

+(void)loadRankings{
    [DDServerConnector requestRankingsWithCompletion:^(NSDictionary *JSON) {
        [DDDataManager parseRankingJSON:JSON];
    } onError:^(NSError *error, id JSON) {
        NSLog(@"Error:%@ when loading rankings from server. Server response JSON: %@",[error localizedDescription],JSON);
    }];
}

+(void)loadDeputados{
    [DDServerConnector requestDeputadosWithCompletion:^(NSDictionary *JSON) {
        [DDDataManager parseDeputadoJSON:JSON];
    } onError:^(NSError *error, id JSON) {
        NSLog(@"Error:%@ when loading rankings from server. Server response JSON: %@",[error localizedDescription],JSON);
    }];
}

+(void)parseRankingJSON:(NSDictionary *)json{
    
    [Ranking MR_truncateAll];
    NSArray *rankings = [json valueForKey:@"rankings"];
    for (NSDictionary *rankingJson in rankings) {
        
        Ranking *ranking = [Ranking MR_createEntity];
        ranking.nome        = [rankingJson valueForKey:@"nome"];
        ranking.numFaltas   = [NSNumber numberWithInteger: [[rankingJson valueForKey:@"numFaltas"] integerValue]];
        ranking.partido     = [rankingJson valueForKey:@"partido"];
        ranking.estado      = [rankingJson valueForKey:@"estado"];
        ranking.foto        = [rankingJson valueForKey:@"foto"];
        ranking.ordem       = [NSNumber numberWithInteger: [[rankingJson valueForKey:@"ordem"] integerValue]];
        ranking.rank        = [NSNumber numberWithInteger: [[rankingJson valueForKey:@"rank"] integerValue]];
    }
}

+(void)parseDeputadoJSON:(NSDictionary *)json{
    [Deputado MR_truncateAll];
    NSArray *deputados = [json objectForKey:@"deputados"];
    for(NSDictionary *deputadoJson in deputados){
        
        Deputado *deputado = [Deputado MR_createEntity];
        deputado.email          = [json objectForKey:@"email"];
        deputado.telefone       = [json objectForKey:@"telefone"];
        deputado.foto           = [json objectForKey:@"foto"];
        deputado.numDeFaltas    = [NSNumber numberWithInteger: [[json objectForKey:@"numDeFaltas"] integerValue]];
        deputado.numeDeSessoes  = [NSNumber numberWithInteger: [[json objectForKey:@"sessoes"] integerValue]];
        deputado.presenca       = [NSNumber numberWithInteger: [[json objectForKey:@"presenca"] integerValue]];
        deputado.gabinete       = [json objectForKey:@"gabinete"];
        deputado.estado         = [json objectForKey:@"estado"];
        deputado.partido        = [json objectForKey:@"partido"];
        deputado.nome           = [json objectForKey:@"nome"];
        
    }
}

@end
