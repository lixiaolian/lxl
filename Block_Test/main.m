//
//  main.m
//  Block_Test
//
//  Created by 3005 on 13-5-31.
//  Copyright (c) 2013年 lxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
//声明一个函数
int add(int a,int b);
int main(int argc, const char * argv[])
{
//    int result;
//    //调用一个函数
//    result=add(1, 1);
//    printf("1+1=%d\n",result);
//    
//    int a=2;
//    int b=2;
//    //声明一个block
//    int (^Block_add)(void);
//    //给block赋值
//    Block_add=^{
//        return a+b;
//    };
//    //调用这个block,怎么调用呢？？？
//    result=Block_add();
//    printf("2+2=%d",result);
    
    Student *stu=[[Student alloc]init];
    [stu setBlock:^(NSString *str)
    {
        
        
        
        NSLog(@"我的学号是：%@",str);
    }];
    [stu sayNumber];
    [stu release];
    return 0;
}
//实现一个函数
int add(int a, int b)
{
    return a+b;
}