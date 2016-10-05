/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

CGPoint CGRectGetCenter(CGRect rect);
CGRect  CGRectMoveToCenter(CGRect rect, CGPoint center);

@interface UIView (ViewFrameGeometry)
@property CGPoint mp_origin;
@property CGSize mp_size;

@property (readonly) CGPoint mp_bottomLeft;
@property (readonly) CGPoint mp_bottomRight;
@property (readonly) CGPoint mp_topRight;

@property CGFloat mp_height;
@property CGFloat mp_width;

@property CGFloat mp_top;
@property CGFloat mp_left;

@property CGFloat mp_bottom;
@property CGFloat mp_right;

@property CGFloat mp_centerX;
@property CGFloat mp_centerY;


- (void) mp_moveBy: (CGPoint) delta;
- (void) mp_scaleBy: (CGFloat) scaleFactor;
- (void) mp_fitInSize: (CGSize) aSize;
@end