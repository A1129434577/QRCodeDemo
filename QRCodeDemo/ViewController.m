//
//  ViewController.m
//  QRCodeDemo
//
//  Created by 刘彬 on 16/8/19.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import "ViewController.h"
#import "QRViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-80)/2, 200, 80, 40)];
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"扫一扫" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(qrCodeScan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)qrCodeScan{
    [self presentViewController:[[QRViewController alloc] init] animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
