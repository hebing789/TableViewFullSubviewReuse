//
//  CCObjecgCacheAry.m
//  CamCard
//
//  Created by 何兵 on 11/16/16.
//  Copyright © 2016 IntSig Information Co., Ltd. All rights reserved.
//

#import "CCObjecgCacheAry.h"
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
        [self.reuseArr addObject:v];
      
        [v removeFromSuperview];
    }
}


/**
 传入类名和父控件,直接将子类的控件加入父控件,返回该子控件对象
 
 @param superView 父控件,cell请传入cell的contentView
 @param cls 子控件类别
 @return 子控件对象
 */
- (UIView*)getViewWithClass:(Class)cls{

    for (UIView* obj in self.reuseArr) {
        
        if ([NSStringFromClass([obj class]) isEqualToString:NSStringFromClass(cls)]) {
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




@end
