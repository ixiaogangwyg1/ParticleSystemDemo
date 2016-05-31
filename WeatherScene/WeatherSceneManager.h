//
//  WeatherSceneManager.h
//  ParticleSystemDemo
//
//  Created by terrywang on 16/1/6.
//  Copyright © 2016年 iTerry.com All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseWeatherSceneView.h"

@interface WeatherSceneManager : NSObject

+ (WeatherSceneManager *)sharedSceneManager;

/**
  @description 创建天气动画场景视图
  @param frame 天气动画背景大小
  @param 天气类型
  @return 天气动画视图
  */
- (BaseWeatherSceneView *)showWeatherSceneWithFrame:(CGRect)frame weatherType:(WeatherSceneType)type;

/**
 @description 开始天气动画
 */
- (void)startWeatherSceneAnimation;

/**
 @description 停止 天气动画
 */
- (void)stopWeatherSceneAnimation;

@end
