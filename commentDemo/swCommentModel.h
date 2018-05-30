//
//  swCommentModel.h
//  commentDemo
//
//  Created by 粟黄 on 24/5/18.
//  Copyright © 2018年 LongShengWen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface swCommentModel : NSObject

@property(nonatomic,strong) NSString *userName;
@property(nonatomic,strong) NSString *userId;
@property(nonatomic,assign) BOOL isOpen;
@property(nonatomic,strong) NSString *comment;
@property(nonatomic,assign) NSInteger commentID;
@property(nonatomic,strong) NSString *toUserName;
@property(nonatomic,strong) NSString *toUserId;

@property(nonatomic,strong) NSMutableArray *subCommentArray;

- (void)buildCommentModel:(NSDictionary *)dic;

@end

