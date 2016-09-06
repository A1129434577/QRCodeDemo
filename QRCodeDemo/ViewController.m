//
//  ViewController.m
//  QRCodeDemo
//
//  Created by 刘彬 on 16/8/19.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import "ViewController.h"
#import "QRViewController.h"
#import "QRScanViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-120)/2, 200, 120, 40)];
    btn.backgroundColor = [UIColor cyanColor];
    [btn setTitle:@"生成二维码" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(qrCodecreate) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-120)/2, CGRectGetMaxY(btn.frame)+20, 120, 40)];
    btn1.backgroundColor = [UIColor cyanColor];
    [btn1 setTitle:@"扫一扫" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(qrCodeScan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}

-(void)qrCodecreate
{
    [self presentViewController:[[QRViewController alloc] init] animated:YES completion:NULL];
}



-(void)qrCodeScan{
    [self presentViewController:[[QRScanViewController alloc] init] animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
