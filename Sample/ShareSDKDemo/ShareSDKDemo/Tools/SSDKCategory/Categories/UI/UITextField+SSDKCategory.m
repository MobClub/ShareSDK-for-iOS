//
//  UITextField+SSDKCategory.m
//  SSDKCategory
//
//  Created by maxl on 2018/12/28.
//  Copyright © 2018 mob. All rights reserved.
//

#import "UITextField+SSDKCategory.h"
#import <objc/runtime.h>
#import "UIControl+SSDKCategory.h"
@implementation UITextField (SSDKCategory)
- (void)addLeftViewBlock:(UIView * (^) (UITextField *))leftBlock mode:(UITextFieldViewMode)mode{
    if (leftBlock) {
        self.leftView = leftBlock(self);
        self.leftViewMode = mode;
    }
}
- (void)addRightViewBlock:(UIView * (^) (UITextField *))rightBlock mode:(UITextFieldViewMode)mode{
    if (rightBlock) {
        self.rightView = rightBlock(self);
        self.rightViewMode = mode;
    }
}

- (NSRange)selectedRange
{
    UITextPosition *beginning = self.beginningOfDocument;
    
    UITextRange *selectedRange = self.selectedTextRange;
    UITextPosition *selectionStart = selectedRange.start;
    UITextPosition *selectionEnd = selectedRange.end;
    
    NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}

- (void)selectedText
{
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}

- (void)setSelectedRange:(NSRange)range
{
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}


- (void)setEditedText:(void (^)(NSString * _Nonnull))editedText{
    objc_setAssociatedObject(self, @selector(editedText), editedText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addObserver];
}

- (void (^)(NSString * _Nonnull))editedText{
    return objc_getAssociatedObject(self, @selector(editedText));
}

- (NSUInteger)limitLength{
    return [objc_getAssociatedObject(self, @selector(limitLength)) integerValue];
}

- (void)setLimitLength:(NSUInteger)limitLength{
    objc_setAssociatedObject(self, @selector(limitLength), @(limitLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self addObserver];
    
}


- (void)addObserver{
    if ([self containsEventBlockForKey:NSStringFromClass([self class])]) return;
    __weak typeof(self)weakSelf = self;
    [self addEventBlock:^(id  _Nonnull sender) {
        [weakSelf textFieldTextDidChange];
    } forEvents:UIControlEventEditingChanged ForKey:NSStringFromClass([self class])];
}

- (void)textFieldTextDidChange{
    NSString *toBeString = self.text;
    NSUInteger limit = self.limitLength;
    UITextRange *selectedRange = [self markedTextRange];
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    NSInteger loction = [self offsetFromPosition:self.beginningOfDocument toPosition:selectedRange.start];
    if (self.editedText) {
        if (!position) {
            self.editedText(toBeString);
        }else{
            self.editedText([toBeString substringToIndex:loction]);
        }
    }
    if (!position && (limit > 0 && toBeString.length > limit)) {
        NSRange rangeIndex = [toBeString rangeOfComposedCharacterSequenceAtIndex:limit];
        if (rangeIndex.length == 1) {
            self.text = [toBeString substringToIndex:limit];
        }
        else {
            NSRange rangeRange = [toBeString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, limit)];
            NSInteger tmpLength;
            if (rangeRange.length > limit) {
                tmpLength = rangeRange.length - rangeIndex.length;
            }
            else{
                tmpLength = rangeRange.length;
            }
            self.text = [toBeString substringWithRange:NSMakeRange(0, tmpLength)];
        }
    }else{
        if (loction >= limit) {
            self.text = [toBeString substringWithRange:NSMakeRange(0, limit)];
        }
    }
}
@end
