//
//  Processing+image.m
//  Processing Touch
//
//  Created by Kenan Che on 09-06-06.
//  Copyright 2009 campl software. All rights reserved.
//

#import "Processing+image.h"
#import "Processing.h"

@implementation Processing (Image)

- (PImage *)createImage:(int)width :(int)height :(int)mode
{
    PImage *img = [[PImage alloc] initWithWidth:width height:height mode:mode];
    return [img autorelease];
}

- (void)image:(PImage *)img :(float)x :(float)y
{
    [graphics_ drawImage:img atPoint:CGPointMake(x, y)];
}

- (void)image:(PImage *)img :(float)x :(float)y :(float)width :(float)height
{
    [graphics_ drawImage:img inRect:normalizedRectangle(x, y, width, height, curStyle_.imageMode)];
}

- (void)imageMode:(int)mode
{
    switch (mode) {
        case CORNER:
        case CORNERS:
        case CENTER:
            curStyle_.imageMode = mode;
            break;
        default:
            break;
    }
}

- (PImage *)loadImage:(NSString *)name
{
    UIImage *img = [UIImage imageNamed:name];
    if (nil == img) return nil;
    
    CGImageRef cgImg = img.CGImage;
    PImage *pImg = [[PImage alloc] initWithCGImage:cgImg];
    
    [img release];    
    return [pImg autorelease];
}

- (void)noTint
{
    [graphics_ noTint];
    curStyle_.doTint = NO;
}

- (PImage *)requestImage:(NSString *)name
{
    return [self loadImage:name];
}

- (void)tint:(color)clr
{
    PColor pc = PColorMake(clr);
    
    [graphics_ tint:pc.red :pc.green :pc.blue :pc.alpha];
    curStyle_.tintColor = clr;
    curStyle_.doTint = YES;
}

- (void)tint:(float)gray :(float)alpha
{
    [self tint:[self color:gray :alpha]];
}

- (void)tint:(float)val1 :(float)val2 :(float)val3
{
    [self tint:[self color:val1 :val2 :val3]];
}

- (void)tint:(float)val1 :(float)val2 :(float)val3 :(float)alpha
{
    [self tint:[self color:val1 :val2 :val3 :alpha]];
}

- (void)blend:(int)x :(int)y :(int)width :(int)height 
             :(int)dx :(int)dy :(int)dwidth :(int)dheight 
             :(int)mode
{
    
}

- (void)blend:(PImage *)srcImg 
             :(int)x :(int)y :(int)width :(int)height 
             :(int)dx :(int)dy :(int)dwidth :(int)dheight 
             :(int)mode
{
    
}

- (void)copy:(int)sx :(int)sy :(int)swidth :(int)sheight 
            :(int)dx :(int)dy :(int)dwidth :(int)dheight
{
    
}

- (void)copy:(PImage *)srcImg 
            :(int)sx :(int)sy :(int)swidth :(int)sheight 
            :(int)dx :(int)dy :(int)dwidth :(int)dheight
{
    
}

- (void)filter:(int)mode
{
    
}

- (void)filter:(int)mode :(float)param
{
    
}

- (color)get:(int)x :(int)y
{
    return [graphics_ getPixelAtPoint:CGPointMake(x, y)];
}

- (PImage *)get
{
    return [self get:0 :0 :self.width :self.height];
}

- (PImage *)get:(int)x1 :(int)y1 :(int)x2 :(int)y2
{
    return nil;
}

- (void)loadPixels
{
    pixels_ = [graphics_ loadPixels];
}

- (void)set:(int)x :(int)y :(color)clr
{
    [graphics_ setPixel:clr atPoint:CGPointMake(x, y)];
}

- (void)updatePixels
{
    [graphics_ updatePixels];
}

@end
