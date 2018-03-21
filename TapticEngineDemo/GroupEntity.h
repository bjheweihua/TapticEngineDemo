//
//  GroupEntity.h
//  TapticEngineDemo
//
//  Created by heweihua on 2018/3/19.
//  Copyright © 2018年 heweihua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ItemEntity : NSObject

@property(nonatomic, copy  ) NSString*title;
@property(nonatomic, copy  ) NSString*subTitle;
@property(nonatomic, assign) CGFloat height;
@end


@interface GroupEntity : NSObject
@property(nonatomic, copy  ) NSString*title;
@property(nonatomic, strong) NSMutableArray* list; // ItemEntity
@property(nonatomic, assign) CGFloat height;
@end
