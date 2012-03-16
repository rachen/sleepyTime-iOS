//
//  TimesViewController.h
//  sleepyTime
//
//  Created by Raymond Chen on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

# define NUM_ALARM_TIMES 6

@interface TimesViewController : UITableViewController

@property (strong, nonatomic) NSArray *sleepTimes;
- (NSDate *) sleepback: (NSDate *)inputTime;
- (NSArray *) knockout:(NSDate *)now;

@end
