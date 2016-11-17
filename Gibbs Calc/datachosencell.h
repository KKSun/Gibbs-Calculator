//
//  datachosencell.h
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/5/5.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface datachosencell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *chosenmattername;
@property (weak, nonatomic) IBOutlet UILabel *chosenmatterstate;
@property (weak, nonatomic) IBOutlet UILabel *chosenmatternum;

@property(copy,nonatomic) NSString * chosenmatternamestring;
@property(copy,nonatomic) NSString * chosenmatterstatestring;
@property(copy,nonatomic) NSString * chosenmatternumstring;


@end
