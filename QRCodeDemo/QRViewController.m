//
//  QRViewController.m
//  QRCodeDemo
//
//  Created by 刘彬 on 16/9/6.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import "QRViewController.h"
#import "QRView.h"
@interface QRViewController ()

@end

@implementation QRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    QRView *QRV = [[QRView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-200)/2, 200, 200, 200)];
    [self.view addSubview:QRV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
