/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 3.0 Edition
 BSD License, Use at your own risk
 */

#import "UIViewExt.h"

CGPoint CGRectGetCenter(CGRect rect)
{
    CGPoint pt;
    pt.x = CGRectGetMidX(rect);
    pt.y = CGRectGetMidY(rect);
    return pt;
}

CGRect CGRectMoveToCenter(CGRect rect, CGPoint center)
{
    CGRect newrect = CGRectZero;
    newrect.origin.x = center.x-CGRectGetMidX(rect);
    newrect.origin.y = center.y-CGRectGetMidY(rect);
    newrect.size = rect.size;
    return newrect;
}

@implementation UIView (ViewGeometry)

// Retrieve and set the origin
- (CGPoint) mp_origin
{
	return self.frame.origin;
}

-(void)setMp_origin:(CGPoint)mp_origin {
    CGRect newframe = self.frame;
    newframe.origin = mp_origin;
    self.frame = newframe;
}


// Retrieve and set the size
- (CGSize) mp_size
{
	return self.frame.size;
}

- (void) setMp_size: (CGSize) aSize
{
	CGRect newframe = self.frame;
	newframe.size = aSize;
	self.frame = newframe;
}

// Query other frame locations
- (CGPoint) mp_bottomRight
{
	CGFloat x = self.frame.origin.x + self.frame.size.width;
	CGFloat y = self.frame.origin.y + self.frame.size.height;
	return CGPointMake(x, y);
}

- (CGPoint) mp_bottomLeft
{
	CGFloat x = self.frame.origin.x;
	CGFloat y = self.frame.origin.y + self.frame.size.height;
	return CGPointMake(x, y);
}

- (CGPoint) mp_topRight
{
	CGFloat x = self.frame.origin.x + self.frame.size.width;
	CGFloat y = self.frame.origin.y;
	return CGPointMake(x, y);
}


// Retrieve and set height, width, top, bottom, left, right
- (CGFloat) mp_height
{
	return self.frame.size.height;
}

- (void)setMp_height:(CGFloat)mp_height
{
	CGRect newframe = self.frame;
	newframe.size.height = mp_height;
	self.frame = newframe;
}

- (CGFloat)mp_width
{
	return self.frame.size.width;
}

- (void)setMp_width:(CGFloat)mp_width
{
	CGRect newframe = self.frame;
	newframe.size.width = mp_width;
	self.frame = newframe;
}

- (CGFloat)mp_top
{
	return self.frame.origin.y;
}

- (void)setMp_top:(CGFloat)mp_top
{
	CGRect newframe = self.frame;
	newframe.origin.y = mp_top;
	self.frame = newframe;
}

- (CGFloat)mp_left
{
	return self.frame.origin.x;
}

-(void)setMp_left:(CGFloat)mp_left
{
	CGRect newframe = self.frame;
	newframe.origin.x = mp_left;
	self.frame = newframe;
}

- (CGFloat)mp_bottom
{
	return self.frame.origin.y + self.frame.size.height;
}

- (void)setMp_bottom:(CGFloat)mp_bottom
{
	CGRect newframe = self.frame;
	newframe.origin.y = mp_bottom - self.frame.size.height;
	self.frame = newframe;
}

- (CGFloat)mp_right
{
	return self.frame.origin.x + self.frame.size.width;
}

- (void)setMp_right:(CGFloat)mp_right
{
	CGFloat delta = mp_right - (self.frame.origin.x + self.frame.size.width);
	CGRect newframe = self.frame;
	newframe.origin.x += delta ;
	self.frame = newframe;
}

- (CGFloat)mp_centerX
{
    return self.center.x;
}

-(void)setMp_centerX:(CGFloat)mp_centerX
{
    CGPoint center = self.center;
    center.x = mp_centerX;
    self.center = center;
}

- (CGFloat)mp_centerY
{
    return self.center.y;
}

- (void)setMp_centerY:(CGFloat)mp_centerY
{
    CGPoint center = self.center;
    center.y = mp_centerY;
    self.center = center;
}


// Move via offset
- (void) mp_moveBy: (CGPoint) delta
{
	CGPoint newcenter = self.center;
	newcenter.x += delta.x;
	newcenter.y += delta.y;
	self.center = newcenter;
}

// Scaling
- (void) mp_scaleBy: (CGFloat) scaleFactor
{
	CGRect newframe = self.frame;
	newframe.size.width *= scaleFactor;
	newframe.size.height *= scaleFactor;
	self.frame = newframe;
}

// Ensure that both dimensions fit within the given size by scaling down
- (void) mp_fitInSize: (CGSize) aSize
{
	CGFloat scale;
	CGRect newframe = self.frame;
	
	if (newframe.size.height && (newframe.size.height > aSize.height))
	{
		scale = aSize.height / newframe.size.height;
		newframe.size.width *= scale;
		newframe.size.height *= scale;
	}
	
	if (newframe.size.width && (newframe.size.width >= aSize.width))
	{
		scale = aSize.width / newframe.size.width;
		newframe.size.width *= scale;
		newframe.size.height *= scale;
	}
	
	self.frame = newframe;	
}
@end