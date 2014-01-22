//
//  IDViewController.h
//  UIImage+DummySample
//
//  Created by 和泉田 領一 on 2014/01/22.
//  Copyright (c) 2014年 CAPH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)dummyImageButtonTapped:(id)sender;
- (IBAction)realImageButtonTapped:(id)sender;
@end
