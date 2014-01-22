//
//  IDViewController.m
//  UIImage+DummySample
//
//  Created by 和泉田 領一 on 2014/01/22.
//  Copyright (c) 2014年 CAPH. All rights reserved.
//

#import "IDViewController.h"

@interface IDViewController ()

@end

@implementation IDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self dummyImageButtonTapped:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dummyImageButtonTapped:(id)sender
{
    self.imageView.image = [UIImage imageNamed:@"dummy.150x200.#407EFF"];   // ex. dummy.150x300.blue
}

- (IBAction)realImageButtonTapped:(id)sender
{
    self.imageView.image = [UIImage imageNamed:@"image.png"];
}

@end
