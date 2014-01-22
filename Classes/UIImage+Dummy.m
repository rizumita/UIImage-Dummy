//
//  UIImage+Dummy.m
//  UIImage+DummySample
//
//  Created by 和泉田 領一 on 2014/01/22.
//  Copyright (c) 2014年 CAPH. All rights reserved.
//

#import "UIImage+Dummy.h"
#import "UIColor+HexString.h"
#import <objc/runtime.h>


CGSize sizeForSizeString(NSString *sizeString) {
    NSArray *array = [sizeString componentsSeparatedByString:@"x"];
    if (array.count != 2) return CGSizeZero;

    return CGSizeMake([array[0] floatValue], [array[1] floatValue]);
}

UIColor *colorForColorString(NSString *colorString) {
    if (!colorString) {
        return [UIColor lightGrayColor];
    }

    SEL colorSelector = NSSelectorFromString([colorString stringByAppendingString:@"Color"]);
    if ([UIColor respondsToSelector:colorSelector]) {
        return [UIColor performSelector:colorSelector];
    } else {
        return [UIColor colorWithHexString:colorString];
    }
}


@implementation UIImage (Dummy)

+ (void)load
{
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        [self exchangeClassMethod:@selector(imageNamed:) withMethod:@selector(dummy_imageNamed:)];
    });
}

+ (UIImage *)dummy_imageNamed:(NSString *)name
{
    if (!name) return nil;

    UIImage *result;

    NSArray *array = [name componentsSeparatedByString:@"."];
    if ([[array[0] lowercaseString] isEqualToString:@"dummy"]) {
        // Create Dummy image
        NSString *sizeString = array[1];
        if (!sizeString) return nil;

        NSString *colorString = nil;
        if (array.count >= 3) {
            colorString = array[2];
        }

        return [self dummyImageWithSize:sizeForSizeString(sizeString) color:colorForColorString(colorString)];
    } else {
        // Create normal image
        result = [self dummy_imageNamed:name];
    }

    return result;
}

+ (UIImage *)dummyImageWithSize:(CGSize)size color:(UIColor *)color
{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);

    [color setFill];
    CGContextFillRect(context, rect);

    [[UIColor blackColor] setFill];
    NSString *sizeString = [NSString stringWithFormat:@"%d x %d", (int)size.width, (int)size.height];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
        style.alignment = NSTextAlignmentCenter;
        NSDictionary *attributes = @{NSParagraphStyleAttributeName : style};
        [sizeString drawInRect:rect withAttributes:attributes];
    } else {
        [sizeString drawInRect:rect withFont:[UIFont systemFontOfSize:12] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentCenter];
    }

    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    return result;
}

+ (void)exchangeClassMethod:(SEL)selector1 withMethod:(SEL)selector2
{
    Method fromMethod = class_getClassMethod(self, selector1);
    Method toMethod = class_getClassMethod(self, selector2);
    method_exchangeImplementations(fromMethod, toMethod);
}

@end
