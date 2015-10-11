//
//  NetViewModel.h
//  OCUsing
//
//  Created by 江钧龙 on 15/10/11.
//  Copyright © 2015年 Jincc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SignalProducer.h"
@interface NetViewModel : NSObject

@property (nonatomic ,strong)SignalProducer *fetchSignalProducer;

/*   注意劲量要避免复用场景(tableView,collectView)里面的多次observe
    解决办法就是在恰当的时机移除KVO，比如在UITableViewdelegate里
 - (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
 {
    [self unobserve:cell keyPath:@"SignalProducer.result"];
 }
 

 */
- (void)observeAllResultWithBlock:(void (^)(id result , NSError* error))block;

- (void)observeResultIgnoreErrorWithBlock:(void (^)(id result))block;

@end
