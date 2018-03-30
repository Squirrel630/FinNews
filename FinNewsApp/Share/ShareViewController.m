//
//  ShareViewController.m
//  FinNewsApp
//
//  Created by lusonglin on 2018/3/30.
//  Copyright © 2018年 lusonglin. All rights reserved.
//

#import "ShareViewController.h"
@interface ShareViewController()
@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:arc4random()%256/255.0] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

