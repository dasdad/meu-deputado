//
//  RankingViewController.h
//  MeuDeputado
//
//  Created by rafael almeida on 19/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deputado.h"
#import "Ranking.h"

@interface RankingViewController : UITableViewController

@property (strong, nonatomic) NSArray *arrayDeputadosMelhores;
@property (strong, nonatomic) NSArray *arrayDeputadosPiores;

@end
