//
//  DDDetalheViewController.h
//  MeuDeputado
//
//  Created by rafael almeida on 20/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deputado.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DDDetalheViewController : UIViewController{
    
    IBOutlet UILabel *lblNome, *lblNomeParlamentar, *lblEstado, *lblTelefone, *lblPartido, *lblGabinete, *lblEmail, *lblSessoes, *lblFaltas, *lblPresencas;
    IBOutlet UIImageView *imgFoto;
    IBOutlet UISwitch *switchFavorito;
    IBOutlet UIScrollView *scrollDeputadoInfo;
}

@property (nonatomic,retain) Deputado *objDeputado;

@end
