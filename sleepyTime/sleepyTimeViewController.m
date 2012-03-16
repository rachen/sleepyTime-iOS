//
//  sleepyTimeViewController.m
//  sleepyTime
//
//  Created by Raymond Chen on 3/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "sleepyTimeViewController.h"

@interface sleepyTimeViewController ()

@end

@implementation sleepyTimeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// Calculates an hour and a half back
- (NSDate *) sleepback:(NSDate *)inputTime
{    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm a"];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    
    [offsetComponents setHour:-2];
    [offsetComponents setMinute:30];
    
    NSDate *hr_half_before = [gregorian dateByAddingComponents:offsetComponents toDate:inputTime options:0];
    
    return hr_half_before;
}

// NSString with wakeup times. 
// time + :14 + (multiples of 90 minutes)
- (NSArray *) knockout:(NSDate *)now
{
    // Create current time and add 14 minutes
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm a"];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMinute:14]; // avg human takes 14 minutes to fall asleep
    
    NSDate *now_plus_14 = [gregorian dateByAddingComponents:offsetComponents toDate:now options:0];
    
    [offsetComponents setMinute:90];
    
    NSMutableArray *sleep_times = [[NSMutableArray alloc] initWithCapacity:6];
    
    for (int i = 0; i < 6; i++)
    {
        NSDate *multiple = [gregorian dateByAddingComponents:offsetComponents toDate:now_plus_14 options:0];
        now_plus_14 = multiple;
        [sleep_times addObject:multiple];
        
    }
    return sleep_times;
}

- (IBAction)whenToWakeUp:(id)sender {
    NSDate *now = [NSDate date];
    NSArray *sleepTimes = [self knockout:now];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"h:mm a"];
    for (NSDate *element in sleepTimes)
    {
        NSLog(@"%@", [dateFormatter stringFromDate:element]);
    }
    
}


@end
