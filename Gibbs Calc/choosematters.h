//
//  choosematters.h
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/5/2.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface choosematters : UITableViewController<UISearchBarDelegate, UISearchDisplayDelegate>

// 搜索栏
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;


@property (strong, nonatomic) NSArray *list;
@property (strong, nonatomic) NSArray *dataList;


@end
