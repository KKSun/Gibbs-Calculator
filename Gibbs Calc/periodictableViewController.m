//
//  periodictableViewController.m
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/4/21.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import "periodictableViewController.h"

@interface periodictableViewController ()

@end

@implementation periodictableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myScroll.delegate = self;
    self.myImg.image = [UIImage imageNamed:@"sample.png"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _myImg;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
