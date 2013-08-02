//
//  MyViewController.m
//  UITest_3
//
//  Created by 3005 on 13-5-27.
//  Copyright (c) 2013年 lxl. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array=[[NSArray alloc] initWithObjects:@"1",@"2",@"3", nil];
	UISegmentedControl *seg=[[UISegmentedControl alloc] initWithItems:array];
    seg.frame=CGRectMake(30, 20, 260, 30);
    seg.tintColor=[UIColor cyanColor];
    //[seg setContentOffset:CGSizeMake(0, 0) forSegmentAtIndex:1];
    //seg.segmentedControlStyle=
    //UISegmentedControlStyleBezeled;
    //UISegmentedControlStyleBar;
    //UISegmentedControlStyleBordered;
    //UISegmentedControlStylePlain;
    // large plain
    [seg addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:seg];
    [array release];
    [seg release];
    
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(30, 150, 260, 300)];
    NSMutableArray *arr=[[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<8; i++)
    {
        NSString *str=[[NSString alloc] initWithFormat:@"h%d",i+1];
        UIImage *image=[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:str ofType:@"jpeg"]];
        [arr addObject:image];
        [image release];
        [str release];
        
    }
    imageView.animationImages=arr;
    imageView.tag=101;
    [self.view addSubview:imageView];
    [arr release];
    [imageView release];
    
    UISlider *slider=[[UISlider alloc] initWithFrame:CGRectMake(50, 70, 220, 10)];
    slider.tag=102;
    slider.minimumValue=0;
    slider.maximumValue=1;
    slider.value=0.5;
    [slider addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    [slider release];
}
-(void)changeValue:(UISlider *)sender
{
    UIImageView *imageView=(UIImageView *)[self.view viewWithTag:101];
    [imageView setAnimationDuration:1-sender.value];
    [imageView startAnimating];
}
-(void)segmentClick:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex)
    {
        case 0:
        {
            NSLog(@"你选择的是1");
            NSString *str=[[NSString alloc] initWithFormat:@"%d",sender.numberOfSegments+1];
            [sender insertSegmentWithTitle:str atIndex:sender.numberOfSegments animated:YES];
            [str release];
        }
        break;
        case 1:
            NSLog(@"你选择的是2");
            break;
        case 2:
            NSLog(@"你选择的是3");
            [sender removeSegmentAtIndex:sender.numberOfSegments-1 animated:YES];
            break;
        default:
        {
            UIButton *button =[UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame=CGRectMake(100, 100, 120, 30);
            [button setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
            [button setTitle:@"start" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(exchangeImage:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
        }
            break;
    }
}
-(void)exchangeImage:(UIButton *)sender
{
    UIImageView *imageView=(UIImageView *)[self.view viewWithTag:101];
    UISlider *slider=(UISlider*)[self.view viewWithTag:102];
    if ([[sender titleForState:UIControlStateNormal] isEqualToString:@"start"])
    {
        [self.view addSubview:imageView];
        [imageView setAnimationDuration:1-slider.value];
        [imageView startAnimating];
        [sender setTitle:@"stop" forState:UIControlStateNormal];
    }
    else
    {
        [imageView stopAnimating];
        //[imageView removeFromSuperview];
        [sender setTitle:@"start" forState:UIControlStateNormal];
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
