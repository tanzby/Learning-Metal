//
//  MetalView.m
//  Learning-Metal
//
//  Created by 檀祖冰 on 2018/10/21.
//  Copyright © 2018 檀祖冰. All rights reserved.
//

#import "MetalView.h"

@implementation MetalView

+ (id)layerClass
{
    return [CAMetalLayer class];
}

- (CAMetalLayer *)metalLayer {
    return (CAMetalLayer *)self.layer;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        self.metalLayer.device = MTLCreateSystemDefaultDevice();
        self.metalLayer.pixelFormat = MTLPixelFormatBGRA8Unorm;
    }
    return self;
}

- (void)didMoveToWindow
{
    [self step];
}

- (void) step
{
    id<CAMetalDrawable> drawable = [self.metalLayer nextDrawable];
    id<MTLTexture> new_texture = drawable.texture;
    
    MTLRenderPassDescriptor * passDescriptor = [MTLRenderPassDescriptor renderPassDescriptor];
    passDescriptor.colorAttachments[0].texture = new_texture;
    passDescriptor.colorAttachments[0].loadAction = MTLLoadActionClear;
    passDescriptor.colorAttachments[0].storeAction = MTLStoreActionStore;
    passDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(1, 0, 0, 1);
    
    id<MTLCommandQueue> commandQueue = [self.metalLayer.device newCommandQueue];
    id<MTLCommandBuffer> commandBuffer = [commandQueue commandBuffer];
    id<MTLRenderCommandEncoder> commandEncoder = [commandBuffer renderCommandEncoderWithDescriptor:passDescriptor];
    [commandEncoder endEncoding];
    [commandBuffer presentDrawable:drawable];
    [commandBuffer commit];
}

@end
