//
//  choose&add-main.h
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/5/2.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface choose_add_main : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableview1;
@property (weak, nonatomic) IBOutlet UITableView *tableview2;
@property(nonatomic,retain) NSDictionary *listData1;
@property(nonatomic,retain) NSDictionary *listData2;

@end
