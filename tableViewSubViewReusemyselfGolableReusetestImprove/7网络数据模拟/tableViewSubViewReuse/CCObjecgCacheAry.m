//
//  CCObjecgCacheAry.m
//  CamCard
//
//  Created by 何兵 on 11/16/16.
//  Copyright © 2016 IntSig Information Co., Ltd. All rights reserved.
//

#import "CCObjecgCacheAry.h"
#import <objc/runtime.h>

int createTotalCount = 0;
@interface CCObjecgCacheAry ()

@property(nonatomic,strong)UIView* obj;

//缓存数组,保存可以重用的控件,保存tableView的数据, 是已经创建了但是没有显示在屏幕上的数据
@property(nonatomic,strong) NSMutableArray *reuseArr;

@end

@implementation CCObjecgCacheAry

-(NSMutableArray*)reuseArr
{
    if (!_reuseArr)
    {
        _reuseArr = [NSMutableArray array];
    }
    return _reuseArr;
}

/**
 添加缓存对象, 懒加载自己,传入一个父控件,将其子控件全部加入自己缓存;
 
 @param superView 父控件,cell请传入cell的contentView
 */
-(void)addObjectWithSuperView:(UIView*)superView
{
    for (UIView *v in [superView subviews])
    {
//        这个位置可以将属性复原
        [self.reuseArr addObject:v];
      
        [v removeFromSuperview];
    }
}


/**
 传入类名和父控件,直接将子类的控件加入父控件,返回该子控件对象
 
 @param cls 子控件类别
 @return 子控件对象
 */
- (UIView*)getViewWithClass:(Class)cls{

    for (UIView* obj in self.reuseArr) {
        
        if ([obj class] == cls) {
            self.obj = obj;
            [self.reuseArr removeObject:obj];
            return obj;
        }
    }
    
    UIView* subview = [[cls alloc] init];
    createTotalCount ++;
    NSLog(@">>>>>>>>>>>>>>>>>>>>%d",createTotalCount);
    return subview ;
 
}

- (UIView*)getViewWithClass:(Class)cls and:(SEL)sel andParameter:(NSInteger)parameter, ... {
    for (UIView* obj in self.reuseArr) {
        
        if ([obj class] == cls) {
            self.obj = obj;
            [self.reuseArr removeObject:obj];
            return obj;
        }
    }
    IMP imp = [cls methodForSelector:sel];
    id (*func)(id,SEL,...) = (void*)imp;
    NSObject* obj = func(cls,sel,parameter);
    UIView* subview = (UIView* )obj;
    createTotalCount ++;
    NSLog(@">>>>>>>>>>>>>>>>>>>>%d",createTotalCount);
    return subview ;
    
}

- (UIView*)getViewWithClass:(Class)cls and:(SEL)sel andIdParameter:(void*)parameter, ... {
    for (UIView* obj in self.reuseArr) {
        
        if ([obj class] == cls) {
            self.obj = obj;
            [self.reuseArr removeObject:obj];
            return obj;
        }
    }
    IMP imp = [cls methodForSelector:sel];
    id (*func)(id,SEL,...) = (void*)imp;
    NSObject* obj = func(cls,sel,parameter);
    UIView* subview = (UIView* )obj;
    createTotalCount ++;
    NSLog(@">>>>>>>>>>>>>>>>>>>>%d",createTotalCount);
    return subview ;
    
}


- (UIView*)getViewWithInstanceClass:(Class)cls andInstanceMethod:(SEL)sel andParameter:(void*)parameter, ...  {
    

    
    for (UIView* obj in self.reuseArr) {
        
        if ([obj class] == cls) {
            self.obj = obj;
            [self.reuseArr removeObject:obj];
            return obj;
        }
    }
//    IMP imp = [[cls alloc] methodForSelector:sel];
//    id instance = [cls alloc];
//    IMP imp = [cls instanceMethodForSelector:sel];
//    id (*func)(id,SEL,...) = (void*)imp;
    
//    NSLog(@"%@",(__bridge id)parameter);
    id instance = [cls alloc];
    IMP imp = [instance methodForSelector:sel];
    id (*func)(id,SEL,...) = (void*)imp;
    NSObject* obj = func(instance ,sel,parameter);
//    NSMutableArray *argsArray = [[NSMutableArray alloc] init];
//    va_list params; //定义一个指向个数可变的参数列表指针;
//    va_start(params,parameter);//va_start 得到第一个可变参数地址,
//    id arg;
//    if (parameter) {
//        //将第一个参数添加到array
//        id prev = CFBridgingRelease(parameter);
//        [argsArray addObject:prev];
//        //va_arg 指向下一个参数地址
//        //这里是问题的所在 网上的例子，没有保存第一个参数地址，后边循环，指针将不会在指向第一个参数
//        while( (arg = va_arg(params,id)) )
//        {
//            if ( arg ){
//                [argsArray addObject:arg];
//            }
//        }
//        //置空
//        va_end(params);
//        //这里循环 将看到所有参数
//        for (NSNumber *num in argsArray) {
//            NSLog(@"%d", [num intValue]);
//        }
//    }

    
    
    UIView* subview = (UIView* )obj;
    createTotalCount ++;
    NSLog(@">>>>>>>>>>>>>>>>>>>>%d",createTotalCount);
    return subview ;
}


@end
