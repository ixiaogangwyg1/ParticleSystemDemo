//
//  ViewController.m
//  ParticleSystemDemo
//
//  Created by terrywang on 16/1/4.
//  Copyright © 2016年 iTerry.com All rights reserved.
//

#import "ViewController.h"
#import "WeatherSceneManager.h"
#import "BaseWeatherSceneView.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    BaseWeatherSceneView *sceneView = [[WeatherSceneManager sharedSceneManager] showWeatherSceneWithFrame:self.view.frame weatherType:LightSnowScene];
    [self.view addSubview:sceneView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
