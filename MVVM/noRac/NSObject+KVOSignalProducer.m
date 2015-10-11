//
//  NSObject+KVOSignalProducer.m
//  OCUsing
//
//  Created by 江钧龙 on 15/10/11.
//  Copyright © 2015年 Jincc. All rights reserved.
//

#import "NSObject+KVOSignalProducer.h"
#import <KVOController/FBKVOController.h>
@implementation NSObject (KVOSignalProducer)
-(void)observe:(id)object keyPath:(NSString *)keyPath block:(void (^)(id newVlaue))block{
    [self.KVOController observe:object keyPath:keyPath options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        id newValue = change[NSKeyValueChangeNewKey];
        block(newValue);
    }];
}
-(void)observe:(id)object keyPaths:(NSArray *)keyPaths block:(void (^)(id newVlaue))block{
    [self.KVOController observe:object keyPaths:keyPaths options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        id newValue = change[NSKeyValueChangeNewKey];
        block(newValue);
    }];
}
-(void)unobserve:(id)object keyPath:(NSString *)keyPath{
    [self.KVOController unobserve:object keyPath:keyPath];
}
-(void)unobserve:(id)object{
    [self.KVOController unobserve:object];
}
-(void)unobserveAll{
    [self.KVOController unobserveAll];
}
@end
