//
//  QRViewController.m
//  mbp_purse
//
//  Created by 刘彬 on 16/7/26.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import "QRViewController.h"
#import "QRView.h"
@interface QRViewController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    QRView *_qrView;
}
@end

@implementation QRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"二维码";
    
    _qrView = [[QRView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) delegate:self];
    [self.view addSubview:_qrView];
}

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    
    // 1. 如果扫描完成，停止会话
    [_qrView.session stopRunning];

    if (metadataObjects.count > 0)
    {
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        NSLog(@"%@",obj.stringValue);
        
    }
    
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
