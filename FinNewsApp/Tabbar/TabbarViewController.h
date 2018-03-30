//
//  TabbarViewController.h
//  AppDemo
//
//  Created by 陆松林 on 2018/2/6.
//  Copyright © 2018年 Squirrel. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface TabbarViewController : UITabBarController

@property (nonatomic,strong) NSMutableArray *TabArr;

-(instancetype)initWithNomarImageArr:(NSArray *)nomarImageArr
                   andSelectImageArr:(NSArray *)selectImageArr;

-(void)setRedIndex:(BOOL)redIndex
andControllerIndex:(NSInteger)ControllerIndex
       andBudgeNum:(NSInteger)budgeNum;
@end

