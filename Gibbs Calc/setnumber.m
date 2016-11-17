//
//  setnumber.m
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/5/5.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import "setnumber.h"
#import "AppDelegate.h"

@interface setnumber()
{
    NSArray *mattergroupaddnum;
    NSString *numtext;
    NSString *matterchosenname;
    NSString *matterchosenstate;
    NSString *matterchosenH;
    NSString *matterchosenS;
    NSString *matterchosenG;
}
@end



@implementation setnumber

@synthesize stepper;
@synthesize number;
@synthesize statelabel;
@synthesize matternamelabel;


- (void)viewDidLoad{
    
    stepper.maximumValue = 20;
    stepper.minimumValue = 0.5;
    stepper.stepValue = 0.5;
    stepper.wraps = YES;
    stepper.continuous =YES;
    stepper.value = 1;
    stepper.autorepeat = YES;
    number.text = [NSString stringWithFormat:@"1.0"];
    AppDelegate *myDelegate1 = [[UIApplication sharedApplication] delegate];
    
    
    NSArray *getStringValue = myDelegate1.matterchosenin1;
    statelabel.text = [getStringValue objectAtIndex:1];
    matternamelabel.text = [getStringValue objectAtIndex:0];
}


- (IBAction)valueofstepper:(UIStepper *)sender {
    number.text = [NSString stringWithFormat:@"%1.1f",stepper.value];
    numtext = [NSString stringWithFormat:@"%1.1f",stepper.value];
    AppDelegate *myDelegate1 = [[UIApplication sharedApplication] delegate];
    
    
    
    NSArray *getStringValue = myDelegate1.matterchosenin1;
    matterchosenname =  [getStringValue objectAtIndex:0];
    matterchosenstate = [getStringValue objectAtIndex:1];
    matterchosenH = [getStringValue objectAtIndex:2];
    matterchosenS = [getStringValue objectAtIndex:3];
    matterchosenG = [getStringValue objectAtIndex:4];
    mattergroupaddnum = @[matterchosenname,matterchosenstate,matterchosenH,matterchosenS,matterchosenG,numtext];
    
    AppDelegate *myDelegate11 = [[UIApplication sharedApplication] delegate];
    myDelegate11.matterchosenin1 = mattergroupaddnum;
    
    NSLog(@"%@",myDelegate11.matterchosenin1);
}



@end
