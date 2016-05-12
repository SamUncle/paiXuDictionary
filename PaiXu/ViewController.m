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
    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"b_22",@"b_34",@"b_78",@"b_6",@"b_8",@"b_23", nil];
    NSMutableArray * news = [NSMutableArray array];
    for (int i = 0; i <[array count]; i++) {
       NSString * str = [array objectAtIndex:i];
       NSString * newstr = [[str componentsSeparatedByString:@"b_"] lastObject];
       [news addObject:newstr];
    }
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
    SSDictionary * dic = [[SSDictionary alloc]initWithCapacity:[news count]];
    for (int i = 0; i < [news count]; i++) {
        NSLog(@"%@",[news objectAtIndex:i]);
        NSString * str = [news objectAtIndex:i];
        NSString * newStr = [NSString stringWithFormat:@"b_%@",str];
        NSLog(@"%@",newStr);
        [dic setObject:newStr forKey:[NSNumber numberWithInt:i]];
    }
    NSLog(@"### %@",dic);
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
