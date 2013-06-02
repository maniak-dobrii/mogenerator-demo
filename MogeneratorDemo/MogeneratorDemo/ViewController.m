//
//  ViewController.m
//  MogeneratorDemo
//
//  Created by MD on 6/2/13.
//  Copyright (c) 2013 MDC. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()
@property (nonatomic, strong, readwrite) NSFetchedResultsController* frcPlace;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Init CD stack, it's better to init it BEFORE anything that uses data appears.
    // It is here only for a demo.
    [CoreDataManager initCoreDataStack];
    
    // Generate some data to show
    [[CoreDataManager sharedInstance] generateSomePlaces];
    
    // Assign a fetch request controller
    self.frcPlace = [CoreDataManager frcForCDPlace];
    
    // In a real app you don't want to ignore error
    [self.frcPlace performFetch:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    id sectionInfo = [[_frcPlace sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell*) tableView: (UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"PlaceCell" forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void) configureCell: (UITableViewCell*)cell atIndexPath: (NSIndexPath*)indexPath {
    CDPlace* cdPlace = [_frcPlace objectAtIndexPath:indexPath];
    cell.textLabel.text = cdPlace.title;
}


#pragma mark NSFetchedResultsControllerDelegate
- (void) controllerWillChangeContent: (NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void) controller: (NSFetchedResultsController *)controller
    didChangeObject: (id)anObject
        atIndexPath: (NSIndexPath *)indexPath
      forChangeType: (NSFetchedResultsChangeType)type
       newIndexPath: (NSIndexPath *)newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type)
    {
        case NSFetchedResultsChangeInsert:
        {
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
            
        case NSFetchedResultsChangeDelete:
        {
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
            
        case NSFetchedResultsChangeUpdate:
        {
            [self configureCell:[self tableView:self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            
            break;
        }
            
        case NSFetchedResultsChangeMove:
        {
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type)
    {
            
        case NSFetchedResultsChangeInsert:
        {
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
            
        case NSFetchedResultsChangeDelete:
        {
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            
            break;
        }
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CDPlace* cdPlace = nil;
    NSIndexPath* indexPath = [self.tableView indexPathForCell:(UITableViewCell*)sender];
    if(indexPath != nil)
    {
        cdPlace = [_frcPlace objectAtIndexPath:indexPath];
    }
    [(DetailViewController*)(segue.destinationViewController) setCdPlace:cdPlace];
}

@end
