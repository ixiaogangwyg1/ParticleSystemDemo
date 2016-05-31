//
//  SnowSceneView.m
//  ParticleSystemDemo
//
//  Created by terrywang on 16/1/6.
//  Copyright © 2016年 iTerry.com. All rights reserved.
//

#import "SnowSceneView.h"

#define kForgroundSnowbirthRate  6
#define kBackgroundSnowbirthRate 70

@interface SnowSceneView ()
{
    NSDictionary *effect;
}


@end

@implementation SnowSceneView

- (instancetype)initEmitterWithFrame:(CGRect)frame {
    self = [super initWithFrame:CGRectMake(0.0, CGRectGetMinY(frame) - 40.0, CGRectGetWidth(frame), CGRectGetHeight(frame) + 40.0)];
    if (self) {
        //初始化粒子引擎（容器）
        self.emitter = [CAEmitterLayer layer];
        self.backgroundColor = [UIColor clearColor];
        [(CAEmitterLayer *)self.layer addSublayer:self.emitter];
        
        self.emitter.backgroundColor = [UIColor clearColor].CGColor;
        //设置发射位置
        self.emitter.emitterPosition = CGPointMake(self.bounds.size.width / 2, 20.0);
        //设置发射大小
        self.emitter.emitterSize = CGSizeMake(self.bounds.size.width, 40.0);
    }
    return self;
}

- (NSDictionary*)loadPedFile:(NSString*)fileName {
    NSString* filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
    NSData* fileData = [NSData dataWithContentsOfFile:filePath];
    NSMutableDictionary* dict = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingMutableContainers error:nil];
    return dict;
}


//更新发射源及发射器
- (void)updateSceneWithSceneType:(WeatherSceneType)type {
    
#warning 这里如果使用snow.ped方式，注意设置self.transform
//#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED)
//    //flip the view on the iPhone
//    self.transform = CGAffineTransformMake(1, 0, 0, -1, 0, self.bounds.size.height);
//#endif
//    
//    //load the file
//    effect = [self loadPedFile:@"snow.ped"];
    
    
    
    self.emitter.backgroundColor = [UIColor blueColor].CGColor;
    self.layer.masksToBounds = YES;
    
    //setup the emitter type and mode
//    NSString * const kCAEmitterLayerPoints;
//    NSString * const kCAEmitterLayerOutline;
//    NSString * const kCAEmitterLayerSurface;
//    NSString * const kCAEmitterLayerVolume;
    self.emitter.emitterMode = kCAEmitterLayerSurface;
    
    //发射源的形状：
//    NSString * const kCAEmitterLayerPoint;
//    NSString * const kCAEmitterLayerLine;
//    NSString * const kCAEmitterLayerRectangle;
//    NSString * const kCAEmitterLayerCuboid;
//    NSString * const kCAEmitterLayerCircle;
//    NSString * const kCAEmitterLayerSphere;
    self.emitter.emitterShape = kCAEmitterLayerRectangle;
    
//renderMode:渲染模式：
//    NSString * const kCAEmitterLayerUnordered;
//    NSString * const kCAEmitterLayerOldestFirst;
//    NSString * const kCAEmitterLayerOldestLast;
//    NSString * const kCAEmitterLayerBackToFront;
//    NSString * const kCAEmitterLayerAdditive; //叠加效果
    
    self.emitter.renderMode = kCAEmitterLayerUnordered;
    
    //发射源
    //背景雪
    CAEmitterCell* backgroundEmitterCell = [self snowBackgroundEmitterCell];
    //前景雪
    CAEmitterCell* forgroundEmitterCell = [self snowForgroundEmitterCell];
    
    //add the cell to the emitter layer
    self.emitter.emitterCells = @[backgroundEmitterCell, forgroundEmitterCell];
}


//雪的最前面一层，少数较大雪花效果
- (CAEmitterCell *)snowForgroundEmitterCell {
    //create new emitter cell
    CAEmitterCell* emitterCell = [CAEmitterCell emitterCell];
    //粒子图片
    emitterCell.contents = (id)[[UIImage imageNamed:@"particle"] CGImage];
    //粒子源名称
    emitterCell.name = @"forgroudsnow";
    //get the particles start color
    UIColor* color = [UIColor colorWithWhite:1.0 alpha:0.6];
    emitterCell.color = color.CGColor;
    //copy all the settings to the emitter cell
    //产生速率
    emitterCell.birthRate = kForgroundSnowbirthRate;
    
    //生命周期
    emitterCell.lifetime = 20;
    
    //生命周期范围
    emitterCell.lifetimeRange = 5;
    
    //速度
    emitterCell.velocity = 50;
    
    //速度范围
    emitterCell.velocityRange = 200;
    
    //粒子在Z轴方向的发射角度(弧度)
    emitterCell.emissionLatitude = 1.4;
    
    //xy平面的发射角度(弧度)
    emitterCell.emissionLongitude = 1.2;
    
    //粒子发射角度的范围
    emitterCell.emissionRange = 0.6;
    
    //x，y，z三个方向的加速度
    emitterCell.xAcceleration = -0.5;
    emitterCell.yAcceleration = 20;
    emitterCell.zAcceleration = 0;
    
    //透明度
    emitterCell.alphaRange = 0.2;
    //透明度变化速度
    emitterCell.alphaSpeed = 0.0;
    
    //缩放
    emitterCell.scale = 0.4;
    emitterCell.scaleRange = 0.3;
    emitterCell.scaleSpeed = 0.0;
    
    //旋转
    emitterCell.spin = 8;
    emitterCell.spinRange = 4;
    
    //粒子在rgb三个色相上的容差和透明度的容差
    emitterCell.redSpeed = 0;
    emitterCell.redRange = 0;
    
    emitterCell.greenSpeed = 0;
    emitterCell.greenRange = 0;
    
    emitterCell.blueSpeed = 0;
    emitterCell.blueRange = 0;
    return emitterCell;
}


//雪的后面一层，较小雪花效果
- (CAEmitterCell *)snowBackgroundEmitterCell {
    //create new emitter cell
    CAEmitterCell* emitterCell = [CAEmitterCell emitterCell];
    
    emitterCell.contents = (id)[[UIImage imageNamed:@"particle"] CGImage];
    
    emitterCell.name = @"backgroudsnow";
    
    //get the particles start color
    UIColor* color = [UIColor colorWithWhite:1.0 alpha:0.3];
    emitterCell.color = color.CGColor;
    
    //copy all the settings to the emitter cell
    emitterCell.birthRate = kBackgroundSnowbirthRate;
    emitterCell.lifetime = 25;
    emitterCell.lifetimeRange = 5;
    emitterCell.velocity = 100;
    emitterCell.velocityRange = 150;
    
    emitterCell.emissionLatitude = 1.0;
    emitterCell.emissionLongitude = 1.5;
    emitterCell.emissionRange = 0.2;
    
    emitterCell.xAcceleration = -1;
    emitterCell.yAcceleration = 6;
    emitterCell.zAcceleration = 200;
    emitterCell.alphaRange = 0.6;
    emitterCell.alphaSpeed = 0.0;
    
    emitterCell.scale = 0.15;
    emitterCell.scaleRange = 0.3;
    emitterCell.scaleSpeed = 0.0;
    
    emitterCell.spin = 0;
    emitterCell.spinRange = 0;
    
    emitterCell.redSpeed = 0;
    emitterCell.redRange = 0;
    
    emitterCell.greenSpeed = 0;
    emitterCell.greenRange = 0;
    
    emitterCell.blueSpeed = 0;
    emitterCell.blueRange = 0;
    return emitterCell;
}




@end
