//
//  ViewController.m
//  PaiXu
//
//  Created by SmileSun on 16-5-12.
//  Copyright (c) 2016年 companyName. All rights reserved.
//

#import "ViewController.h"
#import "SSDictionary.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //思路：首先将数组中的字符串取出，截取字符串，取出数字，用冒泡排序法排序好后再拼接字符串，然后放到字典（自定义的有序的字典）。这样就完成了对一个数组中的字符串排序到有序字典中。    
    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"123b_22",@"123b_34",@"123b_78",@"123b_6",@"123b_8",@"123b_23", nil];
    //创建一个装数字的字典
    NSMutableArray * news = [NSMutableArray array];
    for (int i = 0; i <[array count]; i++) {
       NSString * str = [array objectAtIndex:i];
       NSString * newstr = [[str componentsSeparatedByString:@"b_"] lastObject];
       [news addObject:newstr];
    }
    NSLog(@"ne %@",[[[array firstObject] componentsSeparatedByString:@"b_"] firstObject] );
    //下面使用冒泡排序法排序
    for (int i = 0; i<[news count]; i ++) {
        for (int j = i+1; j<[news count]; j++) {
            int a = [[news objectAtIndex:i] intValue];
            int b = [[news objectAtIndex:j] intValue];
            if (a>b) {
                [news replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",b]];
                [news replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%d",a]];
            }
        }
    }
    //创建一个自定义的有序字典
    SSDictionary * dic = [[SSDictionary alloc]initWithCapacity:[news count]];
    NSMutableArray * youxus = [NSMutableArray array];
    for (int i = 0; i < [news count]; i++) {
        //NSLog(@"%@",[news objectAtIndex:i]);
        NSString * str = [news objectAtIndex:i];
        
        NSString * newStr = [NSString stringWithFormat:@"%@b_%@",[[[array firstObject] componentsSeparatedByString:@"b_"] firstObject],str];
        NSLog(@"newStr %@",newStr);
        //添加到有序数组里
        [youxus addObject:newStr];
        
        [dic setObject:newStr forKey:[NSNumber numberWithInt:i]];
    }
    NSString * xuStr = [youxus componentsJoinedByString:@","];
    //打印拼接好的字符串
    NSLog(@"xuStr %@",xuStr);
    //打印需要的字典
    NSLog(@"### %@",dic);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
