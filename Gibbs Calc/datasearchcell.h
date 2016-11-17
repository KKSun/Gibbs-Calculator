//
//  datasearchcell.h
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/4/22.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface datasearchcell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *matter;
@property (weak, nonatomic) IBOutlet UILabel *H;
@property (weak, nonatomic) IBOutlet UILabel *S;
@property (weak, nonatomic) IBOutlet UILabel *G;
@property (weak, nonatomic) IBOutlet UILabel *state;

@property(copy,nonatomic) NSString * matterstring;
@property(copy,nonatomic) NSString * Hstring;
@property(copy,nonatomic) NSString * Sstring;
@property(copy,nonatomic) NSString * Gstring;
@property(copy,nonatomic) NSString * statestring;

@end
