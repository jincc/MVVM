//
//  SignalProducer.m
//  OCUsing
//
//  Created by 江钧龙 on 15/10/10.
//  Copyright © 2015年 Jincc. All rights reserved.
//

#import "SignalProducer.h"
#import "SignalResult.h"
@interface SignalProducer()

@property (nonatomic ,copy) ProducerConsumeBlock consumeBlock;
@property (nonatomic ,copy) ProducerCancelBlock  cancleBlock;
@property (nonatomic ,assign ,readwrite) BOOL executing;
@property (nonatomic ,strong ,readwrite) SignalResult *result;
@property (nonatomic ,copy)ProducerCompletionBlock completion;
@end


@implementation SignalProducer
-(instancetype)initWithConsumeBlock:(ProducerConsumeBlock)consumeBlock{
    self = [super init];
    if (self) {
        self.consumeBlock = [consumeBlock copy];
        [self completion];
        self.result = [[SignalResult alloc]init];
    }
    return self;
}
-(instancetype)initWithConsumeBlock:(ProducerConsumeBlock)consumeBlock cancleBlock:(ProducerCancelBlock)cancleBlock
{
    self = [super init];
    if (self) {
        self.consumeBlock = [consumeBlock copy];
        self.cancleBlock  = [cancleBlock copy];
        [self completion];
        self.result = [[SignalResult alloc]init];
    }
    return self;
}
-(void)execute:(id)input{
    if (_consumeBlock) {
        self.executing = true;
        _consumeBlock(input,self.completion);
    }
}
-(void)cancle
{
    if (_cancleBlock) {
        self.executing = false;
        _cancleBlock();
    }
}
#pragma mark - getter
-(ProducerCompletionBlock)completion{
    if (!_completion) {
        __weak typeof(self) weakSelf = self;
        self.completion = ^(id error, id content){
            weakSelf.executing = false;
            weakSelf.result.error = error;
            weakSelf.result.result = content;
        };
    }
    return _completion;
}

@end
