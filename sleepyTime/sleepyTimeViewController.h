//
//  sleepyTimeViewController.h
//  sleepyTime
//
//  Created by Raymond Chen on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sleepyTimeViewController : UIViewController

- (NSDate *) sleepback: (NSDate *)inputTime;
- (NSArray *) knockout:(NSDate *)now;
- (IBAction)whenToWakeUp:(id)sender;

@end
