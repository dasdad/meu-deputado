//
//  TelaQueMostraViewController.m
//  MeuDeputado
//
//  Created by Leonardo Baptista on 4/20/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import "TelaQueMostraViewController.h"

@interface TelaQueMostraViewController ()

@end

@implementation TelaQueMostraViewController

@synthesize textoNome, textoEscrito;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    textoNome.text = textoEscrito;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
