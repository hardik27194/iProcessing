//
//  Processing+p3d.m
//  iProcessing
//
//  Created by Kenan Che on 09-07-09.
//  Copyright 2009 campl software. All rights reserved.
//

#import "Processing.h"

@implementation Processing (ThreeD)

#pragma mark -
#pragma 3D Primitives
#pragma mark -

- (void)box:(float)size
{
    [self box:size :size :size];
}

- (void)box:(float)width :(float)height :(float)depth
{
    if (self.mode != P3D) return;
    
    float x = width/2.0f;
    float y = height/2.0f;
    float z = depth/2.0f;
    
    [self beginShape:QUAD_STRIP];
    [self vertex:-x :-y :-z];
    [self vertex:-x :-y :z];
    [self vertex:x :-y :-z];
    [self vertex:x :-y :z];
    [self vertex:x :y :-z];
    [self vertex:x :y :z];
    [self vertex:-x :y :-z];
    [self vertex:-x :y :z];
    [self vertex:-x :-y :-z];   // Close the strip.
    [self vertex:-x :-y :z];
    [self endShape];
    
    [self beginShape:QUADS];
    [self vertex:-x :-y :-z];
    [self vertex:-x :y :-z];
    [self vertex:x :y :-z];
    [self vertex:x :-y :-z];
    [self vertex:-x :-y :z];
    [self vertex:-x :y :z];
    [self vertex:x :y :z];
    [self vertex:x :-y :z];    
    [self endShape];
}

- (void)sphere:(float)radius
{
    if (self.mode == P3D) {
        
    }
}

- (void)sphereDetail:(float)res
{
    [self sphereDetail:res :res];
}

- (void)sphereDetail:(float)ures :(float)vres
{
    if (self.mode != P3D) {
        
    }
}


#pragma mark -
#pragma mark Lights
#pragma mark -

- (void)ambientLight:(float)v1 :(float)v2 :(float)v3
{
    if (self.mode == P3D) {
        [graphics_ addAmbientLightWithColor:PColorMake([self color:v1 :v2 :v3])];
    }
}

- (void)ambientLight:(float)v1 :(float)v2 :(float)v3 :(float)x :(float)y :(float)z
{
    if (self.mode == P3D) {
        [graphics_ addAmbientLightWithColor:PColorMake([self color:v1 :v2 :v3])
                                 atPosition:PVertexMake(x, y, z)];
    }
}

- (void)directionalLight:(float)v1 :(float)v2 :(float)v3 :(float)x :(float)y :(float)z
{
    if (self.mode == P3D) {
        [graphics_ addDirectionalLightWithColor:PColorMake([self color:v1 :v2 :v3]) 
                                    toDirection:PVertexMake(x, y, z)];
    }
}

/// Set the factors of light attenuation.

// CHECK: Are lightFalloff and lightspecular part of style?
// They are not protected by pushStyle. The PGraphics3D will remember these values.
- (void)lightFalloff:(float)constant :(float)linear :(float)quadratic
{
    if (self.mode == P3D) {
        [graphics_ lightAttenuationConst:constant linear:linear quardratic:quadratic];        
    }
}

- (void)lightSpecular:(float)v1 :(float)v2 :(float)v3
{
    if (self.mode == P3D) {
        [graphics_ lightSpecular:PColorMake([self color:v1 :v2 :v3])];
    }
}

/// Set default lighting.
/// The defaults are are ambientLight(128, 128, 128) and 
/// directionalLight(128, 128, 128, 0, 0, -1), falloff(1, 0, 0), 
/// and specular(0, 0, 0).
- (void)lights
{
    if (self.mode == P3D) {
        [self lightFalloff:1 :0 :0];
        [graphics_ lightSpecular:PColorMake(PWhiteColor)];
        
        [graphics_ addAmbientLightWithColor:PColorMake(PGrayColor)];
        [graphics_ addDirectionalLightWithColor:PColorMake(PGrayColor)
                                    toDirection:PVertexMake(0, 0, -1)];
    }    
}

- (void)noLights
{
    if (self.mode == P3D) {
        [graphics_ noLights];        
    }
}

/// Set current normal vector.
- (void)normal:(float)x :(float)y :(float)z
{
    
}

- (void)pointLight:(float)v1 :(float)v2 :(float)v3 :(float)x :(float)y :(float)z
{
    if (self.mode == P3D) {
        [graphics_ addPointLightWithColor:PColorMake([self color:v1 :v2 :v3]) 
                               atPosition:PVertexMake(x, y, z)];
    }
}

- (void)spotLight:(float)v1 :(float)v2 :(float)v3 
                 :(float)x :(float)y :(float)z 
                 :(float)nx :(float)ny :(float)nz 
                 :(float)angle :(float)concentration
{
    if (self.mode == P3D) {
        [graphics_ addSpotLightWithColor:PColorMake([self color:v1 :v2 :v3]) 
                                   angle:angle 
                           concentration:concentration 
                              atPosition:PVertexMake(x, y, z) 
                             toDirection:PVertexMake(nx, ny, nz)];
    }
}


#pragma mark -
#pragma mark Camera
#pragma mark -

- (void)beginCamera
{
    
}

- (void)camera
{
    
}

- (void)camera:(float)eyeX :(float)eyeY :(float)eyeZ 
              :(float)centerX :(float)centerY :(float)centerZ 
              :(float)upX :(float)upY :(float)upZ
{
    
}

- (void)endCamera
{
    
}

- (void)frustum:(float)left :(float)right :(float)bottom :(float)top :(float)near :(float)far
{
    if (self.mode == P3D) {
        [graphics_ frustum :left :right :bottom :top :near :far];
    }
}

- (void)ortho:(float)left :(float)right :(float)bottom :(float)top :(float)near :(float)far
{
    if (self.mode == P3D) {
        [graphics_ ortho :left :right :bottom :top :near :far];
    }
}

- (void)perspective
{
    float near = (self.height / 2.0f) / [self tan:60/2];
    float far = near * 1000;

    [self perspective:60 :self.height/self.width :near :far];
}

- (void)perspective:(float)fov :(float)aspect :(float)zNear :(float)zFar
{
    
}

- (void)printCamera
{
    
}

- (void)printPerspective
{
    
}


#pragma mark -
#pragma mark Coordinates
#pragma mark -

- (float)modelX:(float)x :(float)y :(float)z
{
    return 0;
}

- (float)modelY:(float)x :(float)y :(float)z
{
    return 0;
}

- (float)modelZ:(float)x :(float)y :(float)z
{
    return 0;
}

- (float)screenX:(float)x :(float)y :(float)z
{
    return 0;
}

- (float)screenY:(float)x :(float)y :(float)z
{
    return 0;
}

- (float)screenZ:(float)x :(float)y :(float)z
{
    return 0;
}


#pragma mark -
#pragma mark Material properties
#pragma mark -

- (void)ambient:(color)clr
{
    if (self.mode == P3D) {
        
    }
}

- (void)ambient:(float)v1 :(float)v2 :(float)v3
{
    [self ambient:[self color:v1 :v2 :v3]];
}

- (void)emissive:(color)clr
{
    if (self.mode == P3D) {
        
    }
}

- (void)shininess:(float)shine
{
    if (self.mode == P3D) {
        
    }
}

- (void)specular:(color)clr
{
    if (self.mode == P3D) {
        
    }
}

- (void)specular:(float)gray :(float)alpha
{
    [self specular:[self color:gray :alpha]];
}

- (void)specular:(float)v1 :(float)v2 :(float)v3
{
    [self specular:[self color:v1 :v2 :v3]];
}

- (void)specular:(float)v1 :(float)v2 :(float)v3 :(float)alpha
{
    [self specular:[self color:v1 :v2 :v3 :alpha]];
}

@end