//
//  Student.m
//  Block_Test
//
//  Created by 3005 on 13-5-31.
//  Copyright (c) 2013年 lxl. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)setBlock:(Block)aaa
{
    if (aaa!=aBlock) {
        Block_release(aBlock);
        aBlock=Block_copy(aaa);
    }
    
}
-(void)sayNumber
{
    if (aBlock)
    {
        aBlock(@"1111");
    }
    
}
@end
