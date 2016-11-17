//
//  datachosencell.m
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/5/5.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import "datachosencell.h"

@implementation datachosencell


@synthesize chosenmatternamestring;
@synthesize chosenmatterstatestring;
@synthesize chosenmatternumstring;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setname:(NSString *)m{
    if (![m isEqualToString:chosenmatternamestring]) {
        chosenmatternamestring = [m copy];
        self.chosenmattername.text = chosenmatterstatestring;
    }
}
- (void)setstate:(NSString *)st{
    if (![st isEqualToString:chosenmatterstatestring]) {
        chosenmatterstatestring = [st copy];
        self.chosenmatterstate.text = chosenmatterstatestring;
    }
}
- (void)setnum:(NSString *)num{
    if (![num isEqualToString:chosenmatternumstring]) {
        chosenmatternumstring = [num copy];
        self.chosenmatternum.text = chosenmatternumstring;
    }
}





@end
