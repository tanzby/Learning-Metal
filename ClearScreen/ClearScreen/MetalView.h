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

@property (readonly) CAMetalLayer *metalLayer;

@end

NS_ASSUME_NONNULL_END
