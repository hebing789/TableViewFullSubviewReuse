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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self.tableView registerClass:[ZDYTableViewCell class] forCellReuseIdentifier:reuseID];
    
    self.tableView.rowHeight=80;

    if (!_reuseCache) {
        self.reuseCache = [CCObjecgCacheAry new];
        
    }
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 100;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZDYTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    static int i =0;
    i++;
    NSInteger num = i%20+1;
    //将要展示的时候从缓存池中获取可以重用的子控件
    [cell setImgCount:num andWithCCObjecgCacheAry:self.reuseCache];
    return  cell;
}


-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //结束的时候将这个tableView的cell的子控件放入缓冲池
    [self.reuseCache addObjectWithSuperView:cell.contentView];
}


@end
