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
 传入类名返回该子控件对象

 @param cls 子控件类别
 @return 子控件对象
 */
- (UIView*)getViewWithClass:(Class)cls;


/**
 传入类名,初始化方法和参数,返回该子控件对象,缓存有则从缓存中取,无则通过传入方法参数创建对象,该参数为枚举类型,数字类型参数,该方法主要用于类方法创建对象

 @param cls 类名
 @param sel 初始化方法
 @param parameter 初始化参数,该参数为枚举类型,数字类型参数
 @return 传入类名,初始化方法和参数,返回该子控件对象
 */
- (UIView*)getViewWithClass:(Class)cls and:(SEL)sel andParameter:(NSInteger)parameter, ... ;


/**
  传入类名,初始化方法和参数,返回该子控件对象,缓存有则从缓存中取,无则通过传入方法参数创建对象,该参数为void*参数,该方法主要用于类方法创建对象

 @param cls 类名
 @param sel 初始化方法
 @param parameter 初始化参数,该参数为void*参数
 @return 传入类名,初始化方法和参数,返回该子控件对象
 */
- (UIView*)getViewWithClass:(Class)cls and:(SEL)sel andIdParameter:(void*)parameter, ... ;


/**
 传入类名,初始化方法和参数,返回该子控件对象,缓存有则从缓存中取,无则通过传入方法参数创建对象,该参数为void*参数,该方法主要用于alloc,init形式的初始化方式创建对象
 
 @param cls 类名
 @param sel 初始化方法
 @param parameter 初始化参数,该参数为void*参数
 @return 传入类名,初始化方法和参数,返回该子控件对象
 */
- (UIView*)getViewWithInstanceClass:(Class)cls andInstanceMethod:(SEL)sel andParameter:(void*)parameter, ... ;

@end
