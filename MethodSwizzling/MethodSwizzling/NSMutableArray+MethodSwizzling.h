//
//  NSMutableArray+MethodSwizzling.h
//  MethodSwizzling
//
//  Created by Arlexovincy on 15/3/16.
//  Copyright (c) 2015年 Arlexovincy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (MethodSwizzling)

- (void)logAddObject:(id)object;
@end
