//
//  DDDetalheViewController.m
//  MeuDeputado
//
//  Created by rafael almeida on 20/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import "DDDetalheViewController.h"

@interface DDDetalheViewController ()

@end

@implementation DDDetalheViewController
@synthesize objDeputado;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lblNome.text = objDeputado.nome;
    lblNomeParlamentar.text = objDeputado.nomeParlamentar;
    lblEstado.text = objDeputado.estado;
    lblTelefone.text = objDeputado.telefone;
    lblPartido.text = objDeputado.partido;
    lblGabinete.text = objDeputado.gabinete;
    lblEmail.text = objDeputado.email;
    lblSessoes.text = [NSString stringWithFormat:@"%@",objDeputado.numeDeSessoes];
    lblFaltas.text = [NSString stringWithFormat:@"%@",objDeputado.numDeFaltas];
    lblPresencas.text = [NSString stringWithFormat:@"%d", [objDeputado.numeDeSessoes intValue] - [objDeputado.numDeFaltas intValue]];
    [imgFoto setImageWithURL:[NSURL URLWithString:objDeputado.foto] placeholderImage:[UIImage imageNamed:@"first.png"]];
    [scrollDeputadoInfo setContentSize:CGSizeMake(scrollDeputadoInfo.frame.size.width, 340)];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
