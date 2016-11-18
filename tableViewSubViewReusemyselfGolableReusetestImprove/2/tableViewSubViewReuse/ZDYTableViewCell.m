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
        
        NSInteger type = arc4random()%5;
        UIView* view;
        if (type == 0) {
            //添加视图的时候
//            view = (UIButton *)[reuseCache getViewWithClass:[UIButton class]];
//            SEL sel = NSSelectorFromString(@"buttonWithType:");
//            void *p_enum = (void *)UIButtonTypeContactAdd;
//            SEL sel = @selector(buttonWithType:);
//           view = (UIButton *)[reuseCache getViewWithClass:[UIButton class] and:sel andIdParameter:(__bridge id)p_enum];
            
//            void *p_enum = (void *)UIButtonTypeContactAdd;
//            (__bridge id)p_enum
            SEL sel = @selector(buttonWithType:);
            view = (UIButton *)[reuseCache getViewWithClass:[UIButton class] and:sel andParameter:UIButtonTypeContactAdd];
            
//            [reuseCache getViewWithClass:[UIButton class] and:sel andParameter:(id), ...

            UIButton* btn = (UIButton *)view;
            //针对只能在初始化的时候设置的属性,KVC
//            [btn setValue:@(UIButtonTypeContactAdd) forKey:@"buttonType"];
            
            [btn setTitle:[NSString stringWithFormat:@"UIBut%zd",type] forState:UIControlStateNormal]; ;
            view.backgroundColor = [UIColor blueColor];
        }else if (type ==1){
            //添加视图的时候
            SEL sel = @selector( initWithImage:);
            view = (UIImageView *)[reuseCache getViewWithInstanceClass:[UIImageView class] andInstanceMethod:sel andParameter:[UIImage imageNamed:@"1.jpg"]];
            view.backgroundColor = [UIColor redColor];
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

        }else {
            //添加视图的时候
//            SEL sel = @selector( initWithFrame:style:);
//            - (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style NS_DESIGNATED_INITIALIZER; // must specify style at creation. -initWithFrame: calls this with UITableViewStylePlain

//            void *p_enum = (void *)UITableViewStylePlain;
//            CGRect rect = CGRectMake(5, 5, 50, 50);
//            void **rect_ptr = &rect;
//            view = (UITableView *)[reuseCache getViewWithInstanceClass:[UITableView class] andInstanceMethod:sel andParameter:(__bridge id)*rect_ptr,(__bridge id)p_enum];
//            view.backgroundColor = [UIColor redColor];
            
        }
      
        [self.contentView addSubview:view];
        
        view.frame = CGRectMake(padding+(btnWidth+padding)*(i%linenum), padding+(btnHeight+padding)*(i/linenum), btnWidth, btnHeight);
    }
}






@end
