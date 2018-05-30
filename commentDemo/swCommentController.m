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
#import "swEditView.h"

@interface swCommentController ()<UITableViewDelegate,UITableViewDataSource,headerDelegate,swEditViewDelegate>

@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) swEditView *editView;

@end

@implementation swCommentController
{
    NSMutableArray<swCommentModel *> *commentArray;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
    
    [self build];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
    swCommentModel *model = commentArray[section];
    return model.subCommentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    swCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([swCommentCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    swCommentModel *model = commentArray[indexPath.section];
    [cell setDataModel:model.subCommentArray[indexPath.row]];
    
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
- (void)touchReplyComment:(swCommentModel *)model
{
    self.editView.hidden = NO;
}
- (void)touchEndEditView
{
    self.editView.hidden = YES;
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
        [model buildCommentModel:nil];
        model.commentID = i;
        [commentArray addObject:model];
    }
}
- (void)keyboardWillShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    CGRect keyboradFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat hight = keyboradFrame.size.height;
    NSTimeInterval time = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:time animations:^{
        [weakSelf.editView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(weakSelf.view).mas_offset(-hight);
        }];
    }];
    
}
- (void)keyboardWillHidden:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSTimeInterval time = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]floatValue];
    __weak typeof(self)weaKSelf = self;
    [UIView animateWithDuration:time animations:^{
        [weaKSelf.editView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(weaKSelf.view);
        }];
    } completion:^(BOOL finished) {
        if (finished == YES) {
            weaKSelf.editView.hidden = YES;
        }
    }];
}
- (swEditView *)editView
{
    if (_editView == nil) {
        _editView = [[swEditView alloc]init];
        [self.view addSubview:_editView];
        [self.view bringSubviewToFront:_editView];
        [_editView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.view);
        }];
        _editView.callbackDelegate = self;
    }
    return _editView;
}
@end

