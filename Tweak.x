#import <UIKit/UIKit.h>

%hook UITextSelectionView

- (void)updateSelectionRects {
    [UIView animateWithDuration:0.2 animations:^{
        %orig;
    }];
}

%end
