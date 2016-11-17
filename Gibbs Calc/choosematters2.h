//
//  choosematters2.h
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/5/4.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface choosematters2 : UITableViewController<UISearchBarDelegate, UISearchDisplayDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *searchbar;

@property (strong, nonatomic) NSArray *list;
@property (strong, nonatomic) NSArray *dataList;

@end
