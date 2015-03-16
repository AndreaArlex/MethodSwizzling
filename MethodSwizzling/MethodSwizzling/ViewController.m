//
//  ViewController.m
//  MethodSwizzling
//
//  Created by Arlexovincy on 15/3/16.
//  Copyright (c) 2015年 Arlexovincy. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+MethodSwizzling.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *arrary = [[NSMutableArray alloc] init];
    [arrary addObject:@"你妹"];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
