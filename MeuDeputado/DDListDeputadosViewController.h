//
//  DDListDeputadosViewController.h
//  MeuDeputado
//
//  Created by rafael almeida on 19/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDDetalheViewController.h"
#import "Deputado.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DDListDeputadosViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tblDeputados;
    NSArray *arrayDeputados;
    
}


@end
