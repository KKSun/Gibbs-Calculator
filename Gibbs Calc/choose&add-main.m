//
//  choose&add-main.m
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/5/2.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import "choose&add-main.h"
#import "datachosencell.h"
#import "AppDelegate.h"


@interface choose_add_main ()
{
    NSMutableDictionary *dict1;
    NSMutableDictionary *dict2;
}

@end


@implementation choose_add_main

@synthesize tableview1;
@synthesize tableview2;
@synthesize listData1;
@synthesize listData2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate *myDelegate1 = [[UIApplication sharedApplication] delegate];
    AppDelegate *myDelegate2 = [[UIApplication sharedApplication] delegate];
    
    NSArray *getStringValue2  = myDelegate2.matterchosenin2;
    NSArray *getStringValue1  = myDelegate1.matterchosenin1;
    
    if(getStringValue1 != 0 && getStringValue2 != 0){
    NSString *m1name =  [getStringValue1 objectAtIndex:0];
    NSString *m1st  = [getStringValue1 objectAtIndex:1];
    NSString *m1H = [getStringValue1 objectAtIndex:2];
    NSString *m1S = [getStringValue1 objectAtIndex:3];
    NSString *m1G = [getStringValue1 objectAtIndex:4];
    NSString *m1num =  [getStringValue1 objectAtIndex:5];
    
    NSString *m2name =  [getStringValue2 objectAtIndex:0];
    NSString *m2st  = [getStringValue2 objectAtIndex:1];
    NSString *m2H = [getStringValue2 objectAtIndex:2];
    NSString *m2S = [getStringValue2 objectAtIndex:3];
    NSString *m2G = [getStringValue2 objectAtIndex:4];
    NSString *m2num =  [getStringValue2 objectAtIndex:5];
    
    NSArray *m1 = @[m1name,m1st,m1H,m1S,m1G,m1num];
    NSArray *m2 = @[m2name,m2st,m2H,m2S,m2G,m2num];
    
    NSLog(@"%@",m1);
    NSLog(@"%@",m2);
    }
    /*
    if (!dict1){
        [dict1 setValue:m1 forKey:@"key1"];
    }else {
        NSUInteger i1;
        i1 = dict1.count;
        NSString *i1string = [NSString stringWithFormat: @"%lu", (unsigned long)i1];
        NSLog(@"%@",i1string);
    }

    for(id key in dict1) {
        NSLog(@"key :%@  value :%@", key, [dict1 objectForKey:key]);
    }
    
    
    
    NSUInteger i1;
    i1 = dict1.count;
    if ([[[dict1 objectForKey:i1] objectAtIndex:0] isEqualToString:m1name]){
        listData1 = dict1;
    }else {
        NSUInteger j1 = i1 + 1;
        NSString *j1string = [NSString stringWithFormat: @"%lu", (unsigned long)j1];
        [dict1 setValue:m1 forKey:j1string];
    }
    */
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    self.listData1 = nil;
    self.listData2 = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual:self.tableview1]) {
        return [self.listData1 count];
    } else if ([tableView isEqual:self.tableview2]) {
        return [self.listData2 count];
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([tableView isEqual:self.tableview1]) {
       
    }
    
    else if ([tableView isEqual:self.tableview2]) {
        
    }
    return nil;
}


@end
