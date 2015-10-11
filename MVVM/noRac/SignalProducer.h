//
//  SignalProducer.h
//  OCUsing
//
//  Created by 江钧龙 on 15/10/10.
//  Copyright © 2015年 Jincc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SignalResult;
typedef void(^ProducerCompletionBlock)(id error, id content);

typedef void(^ProducerConsumeBlock)(id input, ProducerCompletionBlock completionHandler);
typedef void(^ProducerCancelBlock)();

@interface SignalProducer : NSObject

@property (nonatomic, readonly) BOOL executing;

@property (nonatomic, readonly) SignalResult *result;
//init
- (instancetype)initWithConsumeBlock:(ProducerConsumeBlock)consumeBlock cancleBlock:(ProducerCancelBlock)cancleBlock;
- (instancetype)initWithConsumeBlock:(ProducerConsumeBlock)consumeBlock;
/**
 *  唤醒
 */
- (void)execute : (id) input;
/**
 *  取消
 */
- (void)cancle;
@end
