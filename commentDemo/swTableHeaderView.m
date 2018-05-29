//
//  swTableHeaderView.m
//  commentDemo
//
//  Created by 粟黄 on 24/5/18.
//  Copyright © 2018年 LongShengWen. All rights reserved.
//

#import "swTableHeaderView.h"
#import <Masonry/Masonry.h>

@implementation swTableHeaderView
{
    UILabel *lb_name;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self build];
    }
    return self;
}
- (void)build
{
    
    lb_name = [[UILabel alloc]init];
    [self addSubview:lb_name];
    [lb_name mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(self).mas_offset(UIEdgeInsetsMake(10,10,10,10));
        make.height.mas_equalTo(60);
        
    }];
    lb_name.text = @"测试";

}
@end
