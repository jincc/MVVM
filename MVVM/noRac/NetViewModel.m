//
//  NetViewModel.m
//  OCUsing
//
//  Created by 江钧龙 on 15/10/11.
//  Copyright © 2015年 Jincc. All rights reserved.
//

#import "NetViewModel.h"
#import <KVOController/FBKVOController.h>
@implementation NetViewModel


-(void)observeAllResultWithBlock:(void (^)(id result , NSError* error))block{
    [self.KVOController observe:self.fetchSignalProducer.result keyPaths:@[@"result",@"error"] options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        id newValue = change[NSKeyValueChangeNewKey];
        if ([newValue isKindOfClass:[NSError class]]) {
            block(nil,newValue);
        }else{
            block(newValue,nil);
        }
    }];
}
-(void)observeResultIgnoreErrorWithBlock:(void (^)(id))block{
    [self.KVOController observe:self.fetchSignalProducer.result keyPath:@"result" options:NSKeyValueObservingOptionNew block:^(id observer, id object, NSDictionary *change) {
        id newValue = change[NSKeyValueChangeNewKey];
        block(newValue);
    }];
}
@end
