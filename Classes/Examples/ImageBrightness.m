/**
 * Brightness
 * by Daniel Shiffman. 
 * 
 * Adjusts the brightness of part of the image
 * Pixels closer to the mouse will appear brighter. 
 */
/*
PImage img;

void setup() {
    size(200, 200);
    frameRate(30);
    img = loadImage("wires.jpg");
}

void draw() {
    loadPixels();
    for (int x = 0; x < img.width; x++) {
        for (int y = 0; y < img.height; y++ ) {
            // Calculate the 1D location from a 2D grid
            int loc = x + y*img.width;
            // Get the R,G,B values from image
            float r,g,b;
            r = red (img.pixels[loc]);
            //g = green (img.pixels[loc]);
            //b = blue (img.pixels[loc]);
            // Calculate an amount to change brightness based on proximity to the mouse
            float maxdist = 50;//dist(0,0,width,height);
            float d = dist(x,y,mouseX,mouseY);
            float adjustbrightness = 255*(maxdist-d)/maxdist;
            r += adjustbrightness;
            //g += adjustbrightness;
            //b += adjustbrightness;
            // Constrain RGB to make sure they are within 0-255 color range
            r = constrain(r,0,255);
            //g = constrain(g,0,255);
            //b = constrain(b,0,255);
            // Make a new color and set pixel in the window
            //color c = color(r,g,b);
            color c = color(r);
            pixels[loc] = c;
        }
    }
    updatePixels();
}
*/
//
//  ImageBrightness.m
//  iProcessing
//
//  Created by Kenan Che on 09-07-02.
//  Copyright 2009 campl software. All rights reserved.
//

#import "ImageBrightness.h"


@implementation ImageBrightness
- (void)setup
{
    [self size:200 :200];
    [self frameRate:30];
    img = [self loadImage:@"jelly.jpg"];
    [img retain];
}

- (void)dealloc
{
    [img release];
    [super dealloc];
}

- (void)draw
{
    [self loadPixels];
    for (int x = 0; x < img.width; x++) {
        for (int y = 0; y < img.height; y++ ) {
            // Calculate the 1D location from a 2D grid
            int loc = x + y*img.width;
            // Get the R,G,B values from image
            float r/*,g,b*/;
            r = [self red:img.pixels[loc]];
            //g = green (img.pixels[loc]);
            //b = blue (img.pixels[loc]);
            // Calculate an amount to change brightness based on proximity to the mouse
            float maxdist = 50;//dist(0,0,width,height);
            float d = [self dist:x :y :self.mouseX :self.mouseY];
            float adjustbrightness = 255*(maxdist-d)/maxdist;
            r += adjustbrightness;
            //g += adjustbrightness;
            //b += adjustbrightness;
            // Constrain RGB to make sure they are within 0-255 color range
            r = [self constrain:r :0 :255];
            //g = constrain(g,0,255);
            //b = constrain(b,0,255);
            // Make a new color and set pixel in the window
            //color c = color(r,g,b);
            color c = [self color:r];
            self.pixels[loc] = c;
        }
    }
    [self updatePixels];
}
@end
