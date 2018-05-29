//
//  swEditView.m
//  commentDemo
//
//  Created by 粟黄 on 29/5/18.
//  Copyright © 2018年 LongShengWen. All rights reserved.
//

#import "swEditView.h"
#import <Masonry/Masonry.h>

@implementation swEditView
{
    UIView *backgroundView;
    UIView *editView;
    UITextField *textField;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI
{
    backgroundView = [[UIView alloc]init];
    [self addSubview:backgroundView];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self);
    }];
    backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    editView = [UIView new];
    [backgroundView addSubview:editView];
    [editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(backgroundView);
        make.height.mas_equalTo(40);
    }];
    editView.backgroundColor = [UIColor whiteColor];
    
    textField = [[UITextField alloc]init];
    [editView addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(editView).mas_offset(UIEdgeInsetsMake(5, 10,5,10));
    }];
    textField.placeholder = @"请输入";
    textField.backgroundColor = [UIColor grayColor];
}

@end
