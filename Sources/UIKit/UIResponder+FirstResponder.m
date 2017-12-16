#import "UIResponder+FirstResponder.h"

@implementation UIResponder (FirstResponder)

static UIResponder *_firstResponder = nil;

+ (UIResponder *)firstResponder {
	_firstResponder = nil;
	[[UIApplication sharedApplication] sendAction:@selector(_findFirstResponder) to:nil from:nil forEvent:nil];
	return _firstResponder;
}

- (void)_findFirstResponder {
	_firstResponder = self;
}

@end
