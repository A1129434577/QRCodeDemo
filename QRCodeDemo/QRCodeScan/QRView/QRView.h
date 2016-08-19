//
//  QRView.h
//  test
//
//  Created by 刘彬 on 16/7/25.
//  Copyright © 2016年 刘彬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface QRView : UIView

@property(nonatomic,strong)AVCaptureSession *session;
- (instancetype)initWithFrame:(CGRect)frame delegate:(id<AVCaptureMetadataOutputObjectsDelegate> )delegate;

@end
