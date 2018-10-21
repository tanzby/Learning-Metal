//
//  MetalView.h
//  Learning-Metal
//
//  Created by 檀祖冰 on 2018/10/21.
//  Copyright © 2018 檀祖冰. All rights reserved.
//

@import UIKit;
@import Metal;
@import QuartzCore.CAMetalLayer;

NS_ASSUME_NONNULL_BEGIN

@interface MetalView : UIView

@property (nonatomic, strong) CAMetalLayer  *metalLayer;
@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) id<MTLDevice> device;
@property (nonatomic, strong) id<MTLRenderPipelineState> pipeline;
@property (nonatomic, strong) id<MTLCommandQueue> commandQueue;
@property (nonatomic, strong) id<MTLBuffer> vertexBuffer;

@end

NS_ASSUME_NONNULL_END
