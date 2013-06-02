//
//  ViewController.h
//  MogeneratorDemo
//
//  Created by MD on 6/2/13.
//  Copyright (c) 2013 MDC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataManager.h"

@interface ViewController : UITableViewController
{
    NSFetchedResultsController* _frcPlace;
}
@property (nonatomic, strong, readonly) NSFetchedResultsController* frcPlace;

@end
