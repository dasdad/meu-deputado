//
//  DDListDeputadosViewController.m
//  MeuDeputado
//
//  Created by rafael almeida on 19/04/13.
//  Copyright (c) 2013 rafael almeida. All rights reserved.
//

#import "DDListDeputadosViewController.h"

@interface DDListDeputadosViewController ()

@end

@implementation DDListDeputadosViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayDeputados = [Deputado MR_findAllSortedBy:@"nome" ascending:true];
    [tblDeputados reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return [arrayDeputados count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Deputado *deputado = [arrayDeputados objectAtIndex:indexPath.row];
    
    cell.textLabel.text = deputado.nome;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%@)",deputado.partido,deputado.estado];
    [cell.imageView setContentMode:UIViewContentModeScaleToFill];
    [cell.imageView setImageWithURL:[NSURL URLWithString:deputado.foto] placeholderImage:[UIImage imageNamed:@"first.png"]];
    
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%d", [tableView cellForRowAtIndexPath:indexPath].imageView.contentMode);
    // Navigation logic may go here. Create and push another view controller.
   DDDetalheViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DetalheView"];
   
    
    detailViewController.objDeputado = ((Deputado*)[arrayDeputados objectAtIndex:indexPath.row]);
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     
}

@end
