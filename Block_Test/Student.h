//
//  Student.h
//  Block_Test
//
//  Created by 3005 on 13-5-31.
//  Copyright (c) 2013年 lxl. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Block)(NSString * str);
@interface Student : NSObject
{
    Block aBlock;
}
-(void)setBlock:(Block)aaa;
-(void)sayNumber;
@end
