//
//  ViewController.m
//  CAKeyframeAnimation（图标抖动动画）
//
//  Created by apple on 2016/11/23.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark ————— 点击“开始”按钮 —————
- (IBAction)start:(id)sender
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"transform.rotation";
    animation.duration = 0.25;
    animation.repeatCount = MAXFLOAT;
    animation.values = [NSArray arrayWithObjects:[NSNumber numberWithFloat:(-M_PI_4)], [NSNumber numberWithFloat:M_PI_4], [NSNumber numberWithFloat:(-M_PI_4)], nil];  //先向左倾斜45°，再向右倾斜45°
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    //方法中的"key"参数是自己命名的。
    [self.imageView.layer addAnimation:animation forKey:@"shake"];
}

#pragma mark ————— 点击“结束”按钮 —————
- (IBAction)stop:(id)sender
{
    //方法中的key参数要和上面方法中的一样。
    [self.imageView.layer removeAnimationForKey:@"shake"];
}

@end
