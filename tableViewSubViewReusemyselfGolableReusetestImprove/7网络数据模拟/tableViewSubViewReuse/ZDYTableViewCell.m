//
//  ZDYTableViewCell.m
//  tableViewSubViewReuse
//
//  Created by 何兵 on 11/17/16.
//  Copyright © 2016 何兵. All rights reserved.
//

#import "ZDYTableViewCell.h"

//控件高度
#define subViewHeight 80
//控件间隙
#define  padding  15
//控件每行个数
#define  linenum  2
@implementation ZDYTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSLog(@"%s",__func__);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundView.backgroundColor = [UIColor whiteColor];
        [self setBackgroundColor:[UIColor whiteColor]];
        self.contentView.backgroundColor = [self randomColor];
    }
    return self;
}

-(void)setImgCount:(NSInteger)num andWithCCObjecgCacheAry:(CCObjecgCacheAry *)reuseCache
{
    //固定行高布局
//    CGFloat padding = 15;
//    NSInteger linenum = num;
//    CGFloat btnWidth = ([UIScreen mainScreen].bounds.size.width-padding*(linenum+1))/linenum;
//    CGFloat btnHeight = self.contentView.bounds.size.height-30;
    //控件大小固定,计算行高
    
    
    CGFloat btnWidth = ([UIScreen mainScreen].bounds.size.width-padding*(linenum+1))/linenum;
    CGFloat btnHeight = subViewHeight;
    for (int i = 0; i<num; i++) {
        
        NSInteger type = arc4random()%7;
        UIView* view;
        if (type == 0) {
            //添加视图的时候
            SEL sel = @selector(buttonWithType:);
            view = (UIButton *)[reuseCache getViewWithClass:[UIButton class] and:sel andParameter:UIButtonTypeContactAdd];
            UIButton* btn = (UIButton *)view;
            //针对只能在初始化的时候设置的属性,KVC
            //            [btn setValue:@(UIButtonTypeContactAdd) forKey:@"buttonType"];
            [btn setTitle:[NSString stringWithFormat:@"UIBut%zd",type] forState:UIControlStateNormal]; ;
            view.backgroundColor = [UIColor blueColor];
        }else if (type ==1){
            //添加视图的时候
            SEL sel = @selector( initWithImage:);
            view = (UIImageView *)[reuseCache getViewWithInstanceClass:[UIImageView class] andInstanceMethod:sel andParameter:(__bridge void *)([UIImage imageNamed:@"1.jpg"])];
            view.backgroundColor = [UIColor purpleColor];
        }else if(type == 2){
            //添加视图的时候
            view = (UILabel *)[reuseCache getViewWithClass:[UILabel class]];
            UILabel* lab = (UILabel *)view;
            lab.layer.cornerRadius = 15;
            lab.layer.masksToBounds = YES;
            lab.text = [NSString stringWithFormat:@"lab %zd",type];
            view.backgroundColor = [UIColor purpleColor];
        }else if (type == 3){
            //添加视图的时候
            view = (UIButton *)[reuseCache getViewWithClass:[UIButton class]];
            UIButton* btn = (UIButton *)view;
            //针对只能在初始化的时候设置的属性,KVC
            //            [btn setValue:@(UIButtonTypeDetailDisclosure) forKey:@"buttonType"];
            [btn setTitle:[NSString stringWithFormat:@"UIBut%zd",type] forState:UIControlStateNormal];
            view.backgroundColor = [UIColor yellowColor];
        }else if (type == 4){
            //添加视图的时候
            view = (UILabel *)[reuseCache getViewWithClass:[UILabel class]];
            UILabel* lab = (UILabel *)view;
            lab.text = [NSString stringWithFormat:@"lab%zd",type];
            view.backgroundColor = [UIColor darkGrayColor];
            
        }else if(type == 5){
            //添加视图的时候
            SEL sel = @selector( initWithFrame:style:);
            void *p_enum = (void *)UITableViewStyleGrouped;
            CGRect rect = CGRectMake(5, 5, 20, 20);
            void **rect_ptr = &rect;
            view = (UITableView *)[reuseCache getViewWithInstanceClass:[UITableView class] andInstanceMethod:sel andParameter:*rect_ptr,UITableViewStyleGrouped];
            
            UITableView *view2 = (UITableView *)view;
//            NSLog(@"%@ ,>>>>>>>>>>>>>%ld",view,view2.style);
            view.backgroundColor = [UIColor redColor];
            
        }else{
            
            void *p_enum = (void *)UIButtonTypeContactAdd;
            SEL sel = @selector(buttonWithType:);
            view = (UIButton *)[reuseCache getViewWithClass:[UIButton class] and:sel andIdParameter:p_enum];
            UIButton* btn = (UIButton *)view;
            [btn setTitle:[NSString stringWithFormat:@"IDBut%zd",type] forState:UIControlStateNormal]; ;
            view.backgroundColor = [UIColor blueColor];
            
            
        }
        
        [self.contentView addSubview:view];
         //固定行高布局
         //控件大小固定,计算行高
        view.frame = CGRectMake(padding+(btnWidth+padding)*(i%linenum), padding+(btnHeight+padding)*(i/linenum), btnWidth, btnHeight);
    }
}

+(CGFloat)getHightWithData:(NSInteger)num{
    NSInteger row = (1+(num-1)/linenum);
    return row*subViewHeight + (row+1) * padding  ;
}

-(UIColor*)randomColor{
    return [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1];
}


@end
