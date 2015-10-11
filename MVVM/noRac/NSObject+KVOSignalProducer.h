//
//  NSObject+KVOSignalProducer.h
//  OCUsing
//
//  Created by 江钧龙 on 15/10/11.
//  Copyright © 2015年 Jincc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVOSignalProducer)
- (void)observe:(id)object keyPath:(NSString *)keyPath block:(void (^)(id newValue))block;
- (void)observe:(id)object keyPaths:(NSArray *)keyPaths block:(void (^)(id newVlaue))block;
- (void)unobserve:(id)object keyPath:(NSString *)keyPath;
- (void)unobserve:(id)object;
- (void)unobserveAll;
@end
