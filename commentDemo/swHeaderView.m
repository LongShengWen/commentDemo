//
//  swHeaderView.m
//  commentDemo
//
//  Created by 粟黄 on 24/5/18.
//  Copyright © 2018年 LongShengWen. All rights reserved.
//

#import "swHeaderView.h"
#import <Masonry/Masonry.h>
#import <objc/runtime.h>

@implementation swHeaderView
{
    UIImageView *userImage;
    UILabel *lb_name;
    UILabel *lb_comment;
    UILabel *lb_open;
    UILabel *lb_reply;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self build];
    }
    return self;
}

- (void)build
{

    userImage = [[UIImageView alloc]init];
    [self addSubview:userImage];
    [userImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40,40));
        make.left.top.mas_equalTo(10);
    }];
    userImage.image = [UIImage imageNamed:@"head"];
    
    lb_name = [[UILabel alloc]init];
    [self addSubview:lb_name];
    [lb_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userImage.mas_right).mas_offset(10);
        make.top.mas_equalTo(self).mas_offset(10);
        make.height.mas_equalTo(20);
        make.right.mas_equalTo(self).mas_offset(-40);
    }];
    lb_name.text = @"谁是傻逼";
    
    lb_comment = [[UILabel alloc]init];
    [self addSubview:lb_comment];
    [lb_comment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).mas_offset(40);
        make.left.mas_equalTo(self).mas_offset(60);
        make.right.mas_equalTo(self).mas_offset(-20);
    }];
    lb_comment.numberOfLines = 0;
    [lb_comment sizeToFit];
    lb_comment.font = [UIFont systemFontOfSize:32/2];
    
    lb_reply = [[UILabel alloc]init];
    [self addSubview:lb_reply];
    [lb_reply mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70,20));
        make.left.mas_equalTo(self).mas_offset(60);
        make.top.mas_equalTo(lb_comment.mas_bottom).mas_offset(10);
    }];
    lb_reply.text = @"回复";
    UITapGestureRecognizer *replyTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchReply)];
    [lb_reply addGestureRecognizer:replyTap];
    [lb_reply setUserInteractionEnabled:YES];
    
    lb_open = [[UILabel alloc]init];
    [self addSubview:lb_open];
    [lb_open mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70,20));
        make.top.mas_equalTo(lb_comment.mas_bottom).mas_offset(10);
        make.right.mas_equalTo(self).mas_offset(-10);
        make.bottom.mas_equalTo(self).mas_offset(-10);
    }];
    lb_open.text = @"展开评论";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchOpen)];
    [lb_open addGestureRecognizer:tap];
    [lb_open setUserInteractionEnabled:YES];
    
}
- (void)setModel:(swCommentModel *)model
{
    self.baseModel = model;
    lb_comment.text = model.comment;
    lb_name.text = model.userName;
    NSLog(@"%@",lb_comment);
    CGSize size = [lb_comment sizeThatFits:CGSizeMake([UIScreen mainScreen].bounds.size.width - 80, CGFLOAT_MAX)];
    
    if (model.isOpen == YES || size.height < 60) {
        
        lb_open.text = @"收起评论";
        [lb_comment mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(size.height);
        }];
        
    }else {
        lb_open.text = @"展开评论";
        [lb_comment mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(60);
        }];
    }
}
- (void)touchReply
{
    if (self.callBackDelegate) {
        [self.callBackDelegate touchReplyComment:self.baseModel];
    }
}
- (void)touchOpen
{
    
    if (self.callBackDelegate ) {
        
        [self.callBackDelegate touchOpenComment:self.baseModel];
    }
}

@end
