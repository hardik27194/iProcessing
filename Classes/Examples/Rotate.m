/**
 * Rotate. 
 * 
 * Rotating a square around the Z axis. To get the results
 * you expect, send the rotate function angle parameters that are
 * values between 0 and PI*2 (TWO_PI which is roughly 6.28). If you prefer to 
 * think about angles as degrees (0-360), you can use the radians() 
 * method to convert your values. For example: scale(radians(90))
 * is identical to the statement scale(PI/2). 
 */
/*
void setup()
{
    size(200,200);
    noStroke();
    fill(255);
    frameRate(30);
}

float angle;
float cosine;
float jitter;

void draw()
{
    background(102);
    
    if(second()%2 == 0){
        jitter = (random(-0.1, 0.1));
    }
    angle = angle + jitter;
    cosine = cos(angle);
    
    translate(width/2, height/2);
    rotate(cosine);
    rectMode(CENTER);
    rect(0, 0, 115, 115);   
}
*/
//
//  Rotate.m
//  iProcessing
//
//  Translated by Diego Che on 09-06-24.
//  Copyright 2009 campl software. All rights reserved.
//

#import "Rotate.h"


@implementation Rotate

- (void)setup
{
    [self size:200 :200];
    [self noStroke];
    [self fill:255];
    [self frameRate:30];    
}

- (void)draw
{
    [self background:102];
    
    if([self second]%2 == 0){
        jitter = ([self random:-0.1 :0.1]);
    }
    angle = angle + jitter;
    cosine = [self cos:angle];
    
    [self translate:[self width]/2 :[self height]/2];
    [self rotate:cosine];
    [self rectMode:CENTER];
    [self rect:0 :0 :115 :115];       
}

@end
