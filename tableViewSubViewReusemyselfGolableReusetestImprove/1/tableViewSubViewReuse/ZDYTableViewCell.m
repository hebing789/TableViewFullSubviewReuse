//
//  ZDYTableViewCell.m
//  tableViewSubViewReuse
//
//  Created by 何兵 on 11/17/16.
//  Copyright © 2016 何兵. All rights reserved.
//

#import "ZDYTableViewCell.h"


@implementation ZDYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         NSLog(@"%s",__func__);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundView.backgroundColor = [UIColor whiteColor];
        [self setBackgroundColor:[UIColor whiteColor]];
        
    }
    return self;
}

-(void)setImgCount:(NSInteger)num andWithCCObjecgCacheAry:(CCObjecgCacheAry *)reuseCache
{
    CGFloat padding = 15;
    NSInteger linenum = num;
    CGFloat btnWidth = ([UIScreen mainScreen].bounds.size.width-padding*(linenum+1))/linenum;
    CGFloat btnHeight = self.contentView.bounds.size.height-30;
    for (int i = 0; i<num; i++) {
        //添加视图的时候
        UIImageView *view = (UIImageView *)[reuseCache getViewWithClass:[UIImageView class]];
        [self.contentView addSubview:view];
        view.backgroundColor = [UIColor blueColor];
        view.frame = CGRectMake(padding+(btnWidth+padding)*(i%linenum), padding+(btnHeight+padding)*(i/linenum), btnWidth, btnHeight);
    }
}






@end
