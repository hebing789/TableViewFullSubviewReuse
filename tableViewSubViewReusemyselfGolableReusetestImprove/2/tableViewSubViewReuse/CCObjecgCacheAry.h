//
//  CCObjecgCacheAry.h
//  CamCard
//
//  Created by 何兵 on 11/16/16.
//  Copyright © 2016 IntSig Information Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

///缓存池,专注传如对象的缓存
@interface CCObjecgCacheAry : NSObject

/**
 添加缓存对象, 懒加载自己,传入一个父控件,将其子控件全部加入自己缓存;

 @param superView 父控件,cell请传入cell的contentView
 */
- (void)addObjectWithSuperView:(UIView*)superView;

/**
 传入类名和父控件,直接将子类的控件加入父控件,返回该子控件对象

 @param cls 子控件类别
 @return 子控件对象
 */
- (UIView*)getViewWithClass:(Class)cls;

- (UIView*)getViewWithClass:(Class)cls and:(SEL)sel andParameter:(NSInteger)parameter, ... ;

- (UIView*)getViewWithClass:(Class)cls and:(SEL)sel andIdParameter:(id)parameter, ... ;

- (UIView*)getViewWithInstanceClass:(Class)cls andInstanceMethod:(SEL)sel andParameter:(id)parameter, ... ;

@end
