//
//  Deputado.h
//  MeuDeputado
//
//  Created by rafael almeida on 19/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Deputado : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * estado;
@property (nonatomic, retain) NSNumber * favorito;
@property (nonatomic, retain) NSString * foto;
@property (nonatomic, retain) NSDate * nascimento;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * partido;
@property (nonatomic, retain) NSNumber * presenca;
@property (nonatomic, retain) NSString * telefone;
@property (nonatomic, retain) NSNumber * numeDeSessoes;
@property (nonatomic, retain) NSString * nomeParlamentar;
@property (nonatomic, retain) NSString *  gabinete;
@property (nonatomic, retain) NSNumber * numDeFaltas;

@end
