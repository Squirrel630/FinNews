//
//  TabbarViewController.m
//  AppDemo
//
//  Created by 陆松林 on 2018/2/6.
//  Copyright © 2018年 Squirrel. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TabbarViewController.h"
#import "Tabbar.h"
#import "MyViewController.h"
#import "ShareViewController.h"
#import "NewsViewController.h"

@interface TabbarViewController ()
@property(nonatomic,assign) BOOL FirstLoad ;
@property(nonatomic,retain) UIView *CustomTabBar;
@property (nonatomic, strong) Tarbar *currentButton; // 当前选中的Btn
@end

@implementation TabbarViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(_FirstLoad)
    {
        //只能写到这个方法里,要不self.viewControllers为空
        NSArray * tabBarBtns=self.tabBar.subviews;
        for (UIView * tabBarBtn in tabBarBtns)
        {
            tabBarBtn.hidden=YES;
        }
        
        CGFloat itemWidth=self.view.bounds.size.width/self.viewControllers.count;
        
        for (int i=0; i<self.viewControllers.count; i++)
        {
            UIViewController * vc=[self.viewControllers objectAtIndex:i];
//
//            Tarbar *btn =[[Tarbar alloc]initWithFrame:CGRectMake(i*itemWidth, 0, itemWidth, 50)
//                                            withUnSelectedImg:vc.tabBarItem.image
//                                              withSelectedImg:vc.tabBarItem.selectedImage
//                                                    withTitle:vc.tabBarItem.title];
            
            Tarbar *btn =[[Tarbar alloc]initWithFrame:CGRectMake(i*itemWidth, 0, itemWidth, 50)
                                    withUnSelectedImg:vc.tabBarItem.image
                                      withSelectedImg:vc.tabBarItem.selectedImage];
            btn.tag=99000+i;
            [btn setClickEventTarget:self action:@selector(tabBtnClick:)];
            [self.tabBar addSubview:btn];
            [self.TabArr addObject:btn];
        }
        Tarbar * selecedBtn=(Tarbar *)[self.tabBar viewWithTag:self.selectedIndex+99000];
        selecedBtn.selected=YES;
        
        _FirstLoad = NO;
    }
}


-(void)tabBtnClick:(Tarbar *)btn
{
    self.currentButton = (Tarbar *)[self.tabBar viewWithTag:self.selectedIndex+99000] ;
    
    //为侧滑所用
    self.tabBar.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 49, [UIScreen mainScreen].bounds.size.width, 49);
    //    [NSNotificationCenter defaultCenter] postNotificationName:@"KpzTabbarSelectNotification" object:3
    
    NSLog(@"之前点击的下标为%li",self.selectedIndex);
    
    if (self.currentButton != btn)
    {
        self.currentButton.selected = NO ;
        btn.selected = YES ;
        self.currentButton = btn;
        self.selectedIndex  =btn.tag - 99000 ;
    }
}

// 这个是在tabbar 按钮上添加徽标 以及徽标的条数
-(void)setRedIndex:(BOOL)redIndex andControllerIndex:(NSInteger)ControllerIndex andBudgeNum:(NSInteger)budgeNum
{
    
    Tarbar *btn = self.TabArr[ControllerIndex];
    [btn setRedIndex:redIndex andBudgeNum:budgeNum];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _FirstLoad = YES ;
    
}


-(instancetype)initWithNomarImageArr:(NSArray *)nomarImageArr andSelectImageArr:(NSArray *)selectImageArr
{
    
    self = [super init];
    if (self) {
        NewsViewController *oneVC = [[NewsViewController alloc]init];
        ShareViewController *twoVC = [[ShareViewController alloc]init];
        MyViewController *threeVC= [[MyViewController alloc]init];
        
        oneVC.view.backgroundColor = [UIColor redColor] ;
        twoVC.view.backgroundColor = [UIColor whiteColor] ;
        threeVC.view.backgroundColor = [UIColor blueColor];
        
        NSArray *VCArr =@[oneVC,twoVC,threeVC] ;
        
        NSMutableArray *viewControllers = [NSMutableArray array] ;
        
        
        for (NSInteger i = 0; i < 3; i++)
        {
            UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:VCArr[i]];
//            navi.navigationBar.barTintColor = [UIColor whiteColor];
            navi.edgesForExtendedLayout = UIRectEdgeNone ;
            navi.navigationController.navigationBar.translucent = NO ;
            
            // 导航栏字体的颜色
           // [navi.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor blackColor]}];
            
            navi.tabBarItem.image = [UIImage imageNamed:nomarImageArr[i]];
            navi.tabBarItem.selectedImage = [UIImage imageNamed:selectImageArr[i]];
           // navi.tabBarItem.title = titleArr[i];
            navi.modalTransitionStyle = UIModalTransitionStyleCrossDissolve ;
            [viewControllers addObject:navi];
        }
        self.viewControllers = viewControllers;
        self.TabArr = [NSMutableArray array];
    }
    return self;
}

//********************原来有title
//-(instancetype)initWithNomarImageArr:(NSArray *)nomarImageArr andSelectImageArr:(NSArray *)selectImageArr andtitleArr:(NSArray *)titleArr
//{
//    
//    self = [super init];
//    if (self) {
//        HomeViewController *oneVC = [[HomeViewController alloc]init];
//        CategoryViewController *twoVC = [[CategoryViewController alloc]init];
//        StrollViewController *threeVC= [[StrollViewController alloc]init];
//        ShopCartViewController *fourVC = [[ShopCartViewController alloc]init];
//        MyJDViewController *fiveVC = [[MyJDViewController alloc]init];
//        
//        oneVC.view.backgroundColor = [UIColor redColor] ;
//        twoVC.view.backgroundColor = [UIColor whiteColor] ;
//        threeVC.view.backgroundColor = [UIColor blueColor];
//        fourVC.view.backgroundColor  = [UIColor greenColor];
//        fiveVC.view.backgroundColor = [UIColor yellowColor];
//        
//        NSArray *VCArr =@[oneVC,twoVC,threeVC,fourVC,fiveVC] ;
//        
//        NSMutableArray *viewControllers = [NSMutableArray array] ;
//        
//        
//        for (NSInteger i = 0; i < 5; i++)
//        {
//            UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:VCArr[i]];
//            navi.navigationBar.barTintColor = [UIColor orangeColor];
//            navi.edgesForExtendedLayout = UIRectEdgeNone ;
//            navi.navigationController.navigationBar.translucent = NO ;
//            
//            // 导航栏字体的颜色
//            [navi.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor blackColor]}];
//            
//            navi.tabBarItem.image = [UIImage imageNamed:nomarImageArr[i]];
//            navi.tabBarItem.selectedImage = [UIImage imageNamed:selectImageArr[i]];
//            navi.tabBarItem.title = titleArr[i];
//            navi.modalTransitionStyle = UIModalTransitionStyleCrossDissolve ;
//            [viewControllers addObject:navi];
//        }
//        self.viewControllers = viewControllers;
//        self.TabArr = [NSMutableArray array];
//    }
//    return self;
//}


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
