//
//  SignalResult.h
//  OCUsing
//
//  Created by 江钧龙 on 15/10/10.
//  Copyright © 2015年 Jincc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignalResult : NSObject

@property (nonatomic ,strong)NSError *error;
@property (nonatomic ,strong)id result;
@end
