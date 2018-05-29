//
//  swCommentCell.m
//  commentDemo
//
//  Created by 粟黄 on 24/5/18.
//  Copyright © 2018年 LongShengWen. All rights reserved.
//

#import "swCommentCell.h"
#import <Masonry/Masonry.h>

@implementation swCommentCell
{
    UILabel *lb_comment;
    UIView *viewBack;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    viewBack = [[UIView alloc]init];
    [self addSubview:viewBack];
    [viewBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40);
        make.edges.mas_equalTo(self).mas_offset(UIEdgeInsetsMake(0,60,0,10));
    }];
    viewBack.backgroundColor = [UIColor grayColor];
    
    lb_comment = [[UILabel alloc]init];
    [viewBack addSubview:lb_comment];
    [lb_comment mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(viewBack).mas_offset(UIEdgeInsetsMake(10,10,10,10));
        make.height.mas_equalTo(20);
    }];
    lb_comment.text = @"我评论了你";
}

@end
