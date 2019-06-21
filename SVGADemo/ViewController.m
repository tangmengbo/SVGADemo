//
//  ViewController.m
//  SVGADemo
//
//  Created by 唐蒙波 on 2019/6/21.
//  Copyright © 2019 tangmengbo. All rights reserved.
//

#import "ViewController.h"
#define SJBILI 1.778667
#define VIEW_WIDTH [UIScreen mainScreen].bounds.size.width


@interface ViewController ()<SVGAPlayerDelegate>

@end

static SVGAParser *parser;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     NSArray *items = @[
     @"https://github.com/yyued/SVGA-Samples/blob/master/EmptyState.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/HamburgerArrow.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/PinJump.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/TwitterHeart.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/Walkthrough.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/angel.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/halloween.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/kingset.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/posche.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/rose.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/matteBitmap.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/matteBitmap_1.x.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/matteRect.svga?raw=true",
     @"https://github.com/yyued/SVGA-Samples/blob/master/mutiMatte.svga?raw=true",
     ];
     */

    SVGAPlayer * svgaPlayer = [[SVGAPlayer alloc] init];
    svgaPlayer.delegate = self;
    svgaPlayer.frame = CGRectMake(0, 50, VIEW_WIDTH, VIEW_WIDTH);
    svgaPlayer.backgroundColor = [UIColor clearColor];
    svgaPlayer.loops = 1;
    svgaPlayer.clearsAfterStop = YES;
    [self.view addSubview:svgaPlayer];
    parser = [[SVGAParser alloc] init];
    [parser parseWithURL:[NSURL URLWithString:@"https://github.com/yyued/SVGA-Samples/blob/master/halloween.svga?raw=true"]
         completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
             
             if (videoItem != nil) {
                 svgaPlayer.videoItem = videoItem;
                 [svgaPlayer startAnimation];
             }
         }
            failureBlock:^(NSError * _Nullable error) {
                
                [svgaPlayer removeFromSuperview];
            }];
    
}


@end
