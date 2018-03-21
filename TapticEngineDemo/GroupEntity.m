//
//  GroupEntity.m
//  TapticEngineDemo
//
//  Created by heweihua on 2018/3/19.
//  Copyright © 2018年 heweihua. All rights reserved.
//

#import "GroupEntity.h"


@implementation ItemEntity

-(instancetype) init{
    
    self = [super init];
    if(self){
        
        _height = 45;
    }
    return self;
}
@end



@implementation GroupEntity

-(instancetype) init{
    
    self = [super init];
    if(self){
        _list = [[NSMutableArray alloc] init];
        _height = 40;
    }
    return self;
}
@end
