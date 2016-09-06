//
//  QRView.m
//  test
//
//  Created by 刘彬 on 16/7/25.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import "QRScanView.h"

#define BOX_WIDTH 300


@implementation QRScanView
- (instancetype)initWithFrame:(CGRect)frame delegate:(id<AVCaptureMetadataOutputObjectsDelegate> )delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        CGRect BOX_FRAME = CGRectMake((CGRectGetWidth(self.bounds)-BOX_WIDTH)/2, (CGRectGetHeight(self.bounds)/4*3-BOX_WIDTH)/2, BOX_WIDTH, BOX_WIDTH);
        if (CGRectGetMinY(BOX_FRAME)<20) {
            BOX_FRAME.origin.y = 20;;
        }
        
        // 1. 实例化拍摄设备
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        // 2. 设置输入设备
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
        
        // 3. 设置元数据输出
        // 3.1 实例化拍摄元数据输出
        AVCaptureMetadataOutput *output = [[AVCaptureMetadataOutput alloc] init];
        //设置扫描区域
//        output.rectOfInterest = CGRectMake(CGRectGetMinX(BOX_FRAME)/CGRectGetWidth(frame), CGRectGetMinY(BOX_FRAME)/CGRectGetHeight(frame), CGRectGetMaxX(BOX_FRAME)/CGRectGetWidth(frame),CGRectGetMaxY(BOX_FRAME)/CGRectGetHeight(frame));
        // 3.3 设置输出数据代理
        [output setMetadataObjectsDelegate:delegate queue:dispatch_get_main_queue()];
        
        // 4. 添加拍摄会话
        // 4.1 实例化拍摄会话
        _session = [[AVCaptureSession alloc] init];
        
        // 4.2 添加会话输入
        [_session addInput:input];
        
        // 4.3 添加会话输出
        [_session addOutput:output];
        
        // 4.3 设置输出数据类型，需要将元数据输出添加到会话后，才能指定元数据类型，否则会报错
        [output setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
        
        // 5. 视频预览图层
        // 5.1 实例化预览图层, 传递_session是为了告诉图层将来显示什么内容
        AVCaptureVideoPreviewLayer *preview = [AVCaptureVideoPreviewLayer layerWithSession:_session];
        preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
        preview.frame = self.bounds;
        
        // 5.2 将图层插入当前视图
        [self.layer addSublayer:preview];
        // 6. 启动会话
        [_session startRunning];
        
        UIView *boxView = [[UIView alloc] initWithFrame:BOX_FRAME];
        boxView.clipsToBounds = YES;
        boxView.layer.cornerRadius = 5;
        [self addSubview:boxView];
        
        //边框画线*******************************************
        CGFloat lineLenth = 20,radius = 5;
        CGPoint point1 = CGPointMake(0, radius);//左上角左边的点(一下点逆时针排列)
        CGPoint point1_1 = CGPointMake(0, lineLenth);
        CGPoint point2 = CGPointMake(0, CGRectGetHeight(BOX_FRAME)-lineLenth);
        CGPoint point2_1 = CGPointMake(0, CGRectGetHeight(BOX_FRAME)-radius);
        CGPoint point3 = CGPointMake(radius, CGRectGetHeight(BOX_FRAME));
        CGPoint point3_1 = CGPointMake(lineLenth, CGRectGetHeight(BOX_FRAME));
        CGPoint point4 = CGPointMake(CGRectGetWidth(BOX_FRAME)-lineLenth, CGRectGetHeight(BOX_FRAME));
        CGPoint point4_1 = CGPointMake(CGRectGetWidth(BOX_FRAME)-radius, CGRectGetHeight(BOX_FRAME));
        CGPoint point5 = CGPointMake(CGRectGetWidth(BOX_FRAME), CGRectGetHeight(BOX_FRAME)-radius);
        CGPoint point5_1 = CGPointMake(CGRectGetWidth(BOX_FRAME), CGRectGetHeight(BOX_FRAME)-lineLenth);
        
        CGPoint point6 = CGPointMake(CGRectGetWidth(BOX_FRAME), lineLenth);
        CGPoint point6_1 = CGPointMake(CGRectGetWidth(BOX_FRAME), radius);
        
        CGPoint point7 = CGPointMake(CGRectGetWidth(BOX_FRAME)-radius, 0);
        CGPoint point7_1 = CGPointMake(CGRectGetWidth(BOX_FRAME)-lineLenth, 0);
        
        CGPoint point8 = CGPointMake(lineLenth, 0);
        CGPoint point8_1 = CGPointMake(radius, 0);
        
        CGPoint controlPoint1 = CGPointMake(0, 0);
        CGPoint controlPoint2 = CGPointMake(CGRectGetWidth(BOX_FRAME), 0);
        CGPoint controlPoint3 = CGPointMake(CGRectGetWidth(BOX_FRAME), CGRectGetHeight(BOX_FRAME));
        CGPoint controlPoint4 = CGPointMake(0, CGRectGetHeight(BOX_FRAME));
        
        
        UIBezierPath *path =  [[UIBezierPath alloc] init];
        [path moveToPoint:point1_1];
        [path addLineToPoint:point2];
        
        [path moveToPoint:point3_1];
        [path addLineToPoint:point4];
        
        [path moveToPoint:point5_1];
        [path addLineToPoint:point6];
        
        [path moveToPoint:point7_1];
        [path addLineToPoint:point8];
        
        
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.strokeColor = [UIColor whiteColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.lineWidth = 1;
        shapeLayer.path = path.CGPath;
        [boxView.layer addSublayer:shapeLayer];
        
        
        UIBezierPath *path2 =  [[UIBezierPath alloc] init];
        [path2 moveToPoint:point1_1];
        [path2 addLineToPoint:point1];
        [path2 addQuadCurveToPoint:point8_1 controlPoint:controlPoint1];
        [path2 addLineToPoint:point8];
        
        [path2 moveToPoint:point7_1];
        [path2 addLineToPoint:point7];
        [path2 addQuadCurveToPoint:point6_1 controlPoint:controlPoint2];
        [path2 addLineToPoint:point6];
        
        
        [path2 moveToPoint:point5_1];
        [path2 addLineToPoint:point5];
        [path2 addQuadCurveToPoint:point4_1 controlPoint:controlPoint3];
        [path2 addLineToPoint:point4];
        
        
        [path2 moveToPoint:point3_1];
        [path2 addLineToPoint:point3];
        [path2 addQuadCurveToPoint:point2_1 controlPoint:controlPoint4];
        [path2 addLineToPoint:point2];
        
        CAShapeLayer *shapeLayer2 = [CAShapeLayer layer];
        shapeLayer2.strokeColor = [UIColor orangeColor].CGColor;
        shapeLayer2.fillColor = [UIColor clearColor].CGColor;
        shapeLayer2.lineWidth = 4;
        shapeLayer2.path = path2.CGPath;
        [boxView.layer addSublayer:shapeLayer2];
        
        
        UIBezierPath *path3 =  [[UIBezierPath alloc] init];
        
        [path3 moveToPoint:CGPointMake(0, 0)];
        [path3 addLineToPoint:CGPointMake(0, CGRectGetHeight(self.frame))];
        [path3 addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        [path3 addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), 0)];
        [path3 addLineToPoint:CGPointMake(0, 0)];
        
        
        [path3 moveToPoint:[self convertPoint:point1 fromView:boxView]];
        [path3 addLineToPoint:[self convertPoint:point2_1 fromView:boxView]];
        [path3 addQuadCurveToPoint:[self convertPoint:point3 fromView:boxView] controlPoint:[self convertPoint:controlPoint4 fromView:boxView]];
        
        [path3 addLineToPoint:[self convertPoint:point4_1 fromView:boxView]];
        [path3 addQuadCurveToPoint:[self convertPoint:point5 fromView:boxView] controlPoint:[self convertPoint:controlPoint3 fromView:boxView]];
        
        [path3 addLineToPoint:[self convertPoint:point6_1 fromView:boxView]];
        [path3 addQuadCurveToPoint:[self convertPoint:point7 fromView:boxView] controlPoint:[self convertPoint:controlPoint2 fromView:boxView]];
        
        [path3 addLineToPoint:[self convertPoint:point8_1 fromView:boxView]];
        [path3 addQuadCurveToPoint:[self convertPoint:point1 fromView:boxView] controlPoint:[self convertPoint:controlPoint1 fromView:boxView]];
        
        
        
        CAShapeLayer *shapeLayer3 = [CAShapeLayer layer];
        shapeLayer3.strokeColor = [UIColor clearColor].CGColor;
        shapeLayer3.fillColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5].CGColor;
        shapeLayer3.fillRule = kCAFillRuleEvenOdd;
        shapeLayer3.path = path3.CGPath;
        [self.layer addSublayer:shapeLayer3];
        //*******************************************
        
        
//        CAGradientLayer *layer = [CAGradientLayer new];
//        layer.frame = CGRectMake(CGRectGetMinX(boxView.frame), CGRectGetMinY(boxView.frame), CGRectGetWidth(boxView.frame), 3);
//        layer.colors = @[(__bridge id)[UIColor clearColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor clearColor].CGColor];
//        layer.startPoint = CGPointMake(0, 1);
//        layer.endPoint = CGPointMake(1, 1);
//        [self.layer addSublayer:layer];
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -CGRectGetHeight(BOX_FRAME), CGRectGetWidth(BOX_FRAME), CGRectGetHeight(BOX_FRAME))];
        imageView.image = [UIImage imageNamed:@"scan"];
        [boxView addSubview:imageView];
        
        
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];//变化模式
        basicAnimation.fromValue = [NSNumber numberWithFloat:0];//开始
        basicAnimation.toValue = [NSNumber numberWithFloat:CGRectGetHeight(boxView.frame)+50];//结束
        basicAnimation.duration = 1.5;//变化时间
        
        basicAnimation.repeatCount = NSUIntegerMax;//重复次数
        basicAnimation.removedOnCompletion = NO;
        [imageView.layer addAnimation:basicAnimation forKey:@"labelAnimateLayer"];//可以通过KEY去找它究竟是它哪一个动画
        
        
        UILabel *promptLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(BOX_FRAME)+10, CGRectGetWidth(self.bounds), 20)];
        promptLabel.textColor = [UIColor whiteColor];
        promptLabel.text = @"将二维码放入框内，即可自动扫描";
        promptLabel.font = [UIFont systemFontOfSize:14];
        promptLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:promptLabel];
    }
    return self;
}

@end
