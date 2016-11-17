//
//  datasearchcell.m
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/4/22.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import "datasearchcell.h"

@implementation datasearchcell

@synthesize matterstring;
@synthesize Sstring;
@synthesize Hstring;
@synthesize Gstring;
@synthesize statestring;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setMatterstring:(NSString *)m{
    if (![m isEqualToString:matterstring]) {
        matterstring = [m copy];
        self.matter.text = matterstring;
    }
}
- (void)setHstring:(NSString *)h{
    if (![h isEqualToString:Hstring]) {
        Hstring = [h copy];
        self.H.text = Hstring;
    }
}
- (void)setSstring:(NSString *)s{
    if (![s isEqualToString:Sstring]) {
        Sstring = [s copy];
        self.S.text = Sstring;
    }
}

- (void)setGstring:(NSString *)g{
    if (![g isEqualToString:Gstring]) {
        Gstring = [g copy];
        self.G.text = Gstring;
    }
}
- (void)setStatestring:(NSString *)st{
    if (![st isEqualToString:statestring]) {
        statestring = [st copy];
        self.state.text = statestring;
    }
}

@end
