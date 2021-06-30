#import <UIKit/UIKit.h>

@interface UITextSelectionView : UIView
@end

%hook UITextSelectionView

- (id)dynamicCaret {
    return [self valueForKey:@"m_caretView"];
}

%end