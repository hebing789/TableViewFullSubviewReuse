//
//  ViewController.m
//  tableViewSubViewReuse
//
//  Created by 何兵 on 11/17/16.
//  Copyright © 2016 何兵. All rights reserved.
//

#import "ViewController.h"
#import "ZDYTableViewCell.h"

static NSString* reuseID = @"ZDYTableViewCell";
@interface ViewController ()

@property(nonatomic,strong)NSMutableArray* dataAry;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //模拟加载网络数据
    [self getData];
    [self.tableView registerClass:[ZDYTableViewCell class] forCellReuseIdentifier:reuseID];
    
//    self.tableView.rowHeight=80;

    if (!_reuseCache) {
        self.reuseCache = [CCObjecgCacheAry new];

    }
    
  
}

-(void)setDataAry:(NSMutableArray *)dataAry{
    _dataAry = dataAry;
    [self.tableView reloadData];
    
}
-(void)getData{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [NSThread sleepForTimeInterval:1];
        NSMutableArray*tem = [NSMutableArray new];
        for (int i =0;  i<100;i++) {
//            NSInteger num = arc4random()%20+1;
//            [tem addObject:@(num)];
            [tem addObject:@(i%20+1)];
            
        }
 
       dispatch_sync(dispatch_get_main_queue(), ^{
           self.dataAry = tem;
       });
    });
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataAry?self.dataAry.count : 5;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZDYTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
//    self.dataNum++;
//    self.dataNum = self.dataNum%20+1;
    
    //将要展示的时候从缓存池中获取可以重用的子控件
    NSInteger num = [self.dataAry?self.dataAry[indexPath.row]:@1 integerValue];
    
    [cell setImgCount:num  andWithCCObjecgCacheAry:self.reuseCache];
    return  cell;
}


-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //结束的时候将这个tableView的cell的子控件放入缓冲池
    [self.reuseCache addObjectWithSuperView:cell.contentView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger num = [self.dataAry?self.dataAry[indexPath.row]:@1 integerValue];
  return   [ZDYTableViewCell getHightWithData:num];
    
}

@end
