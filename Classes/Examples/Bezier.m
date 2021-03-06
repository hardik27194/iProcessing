/**
 * Bezier. 
 * 
 * The first two parameters for the bezier() function specify the 
 * first point in the curve and the last two parameters specify 
 * the last point. The middle parameters set the control points
 * that define the shape of the curve. 
 */

/*
size(200, 200); 
background(0); 
stroke(255);
noFill();
smooth(); 

for(int i = 0; i < 100; i += 20) {
    bezier(90-(i/2.0), 20+i, 210, 10, 220, 150, 120-(i/8.0), 150+(i/4.0));
}
*/

//
//  Bezier.m
//  iProcessing
//
//  Created by Kenan Che on 09-06-23.
//  Copyright 2009 campl software. All rights reserved.
//

#import "Bezier.h"


@implementation Bezier

- (void)setup
{
    [self size:200 :200];
    [self background:[self color:0]];
    [self stroke:[self color:255]];
    [self noFill];
    [self smooth];
    
    for(int i = 0; i < 100; i += 20) {
        [self bezier:90-(i/2.0) :20+i :210 :10 :220 :150 :120-(i/8.0) :150+(i/4.0)];
    }    
}

@end
