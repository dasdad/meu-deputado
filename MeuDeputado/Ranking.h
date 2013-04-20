//
//  Ranking.h
//  MeuDeputado
//
//  Created by rafael almeida on 19/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Ranking : NSManagedObject

@property (nonatomic, retain) NSNumber * idDeputado;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * numFaltas;
@property (nonatomic, retain) NSString * partido;
@property (nonatomic, retain) NSString * estado;
@property (nonatomic, retain) NSString * foto;
@property (nonatomic, retain) NSNumber * ordem;
@property (nonatomic, retain) NSNumber * rank;

@end
