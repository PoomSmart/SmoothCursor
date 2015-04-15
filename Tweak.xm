#import "../PS.h"

%group iOS8

%hook UITextSelectionView

static char overrideAnimationKey;

- (BOOL)dynamicCaret
{
	return [objc_getAssociatedObject(self, &overrideAnimationKey) boolValue] ? YES : %orig;
}

- (void)updateSelectionRects
{
	objc_setAssociatedObject(self, &overrideAnimationKey, @YES, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	%orig;
	objc_setAssociatedObject(self, &overrideAnimationKey, @NO, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

%end

%end

%group preiOS8

%hook UITextSelectionView

- (void)updateSelectionRects
{
	[UIView animateWithDuration:0.2f animations:^{
		%orig;
	}];
}

%end

%end

/*%group iOS3

%hook UITextSelectionView

- (void)updateSelectionWithContentPoint:(CGPoint)contentPoint
{
	%orig;
}

%end

%end*/

%ctor
{
	if (isiOS8Up) {
		%init(iOS8);
	} else {
		%init(preiOS8);
	}
}