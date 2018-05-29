//
//  swCommentController.m
//  commentDemo
//
//  Created by 粟黄 on 24/5/18.
//  Copyright © 2018年 LongShengWen. All rights reserved.
//

#import "swCommentController.h"
#import <Masonry/Masonry.h>
#import "swTableHeaderView.h"
#import "swCommentCell.h"
#import "swHeaderView.h"
#import "swCommentModel.h"

@interface swCommentController ()<UITableViewDelegate,UITableViewDataSource,headerDelegate>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation swCommentController
{
    NSMutableArray<swCommentModel *> *commentArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self build];
}
- (void)build
{
    [self initData];
    self.tableView.hidden = NO;
    
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]init];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view).mas_offset(UIEdgeInsetsMake(30, 0, 0, 0));
        }];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.estimatedRowHeight = 60;
        _tableView.estimatedSectionHeaderHeight = 20.0f;
        _tableView.estimatedSectionFooterHeight = 0;
        
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerClass:[swCommentCell class] forCellReuseIdentifier:NSStringFromClass([swCommentCell class])];
        [_tableView registerClass:[swHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([swHeaderView class])];
    }
    
    return _tableView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return commentArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    swCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([swCommentCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    swHeaderView *headerView = (swHeaderView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([swHeaderView class])];
    headerView.callBackDelegate = self;
    [headerView setModel:commentArray[section]];
    
    return headerView;
}
- (void)touchOpenComment:(swCommentModel *)model
{
    swCommentModel *cModel = commentArray[model.commentID];
    
    if (model.isOpen == YES) {
        cModel.isOpen = NO;
    }
    else {
        cModel.isOpen = YES;
    }
    [self.tableView reloadData];
}

- (void)initData
{
    commentArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < 4; i ++) {
        
        swCommentModel *model = [[swCommentModel alloc]init];
        model.userName = @"SB";
        model.comment = @"论评论我是评论我是评论评论我是评论我是评论评论我是评论我论评论我是评论我是评论评论我是评论我是评论评论我是评论我论评论我是评论我是评论评论我是评论我是评论评论我是评论我是评论";
        model.commentID = i;
        [commentArray addObject:model];
    }
}
@end

