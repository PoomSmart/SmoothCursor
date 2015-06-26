#import "../PS.h"

// The pre-iOS8 group seemed to fix the UITextField content removal bug in 
// iOS 8.3 as well as it being completely compatible with iOS 8.1.2, 8.2b2 and 8.3
// with no noticible bugs or adverse effects. 
// - ravecode

%hook UITextSelectionView

- (void)updateSelectionRects
{
	[UIView animateWithDuration:0.2f animations:^{
		%orig;
	}];
}

%end

/*%group iOS3

%hook UITextSelectionView

- (void)updateSelectionWithContentPoint:(CGPoint)contentPoint
{
	%orig;
}

%end

%end*/

/*%ctor
{
	if (isiOS8Up) {
		%init(iOS8);
	} else {
		%init(preiOS8);
	}
}*/