//
//  SSDKBaseViewChainModel+Masonry.m
//  SSDKCategory
//
//  Created by maxl on 2019/6/5.
//  Copyright © 2019 maxl. All rights reserved.
//

#import "SSDKBaseViewChainModel+Masonry.h"

#define   SSDKCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(methodName, masonryMethod) \
- (id (^)( void (^constraints)(MASConstraintMaker *)) )methodName    \
{   \
return ^id ( void (^constraints)(MASConstraintMaker *) ) {  \
[self enumerateObjectsUsingBlock:^(UIView*  _Nonnull obj) {\
if (obj.superview) { \
[obj masonryMethod:constraints];\
}\
}];\
return self;\
};  \
}
#define     SSDKCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(methodName, masonryMethod) \
- (id (^)( void (^constraints)(MASConstraintMaker *)) )methodName    \
{   \
return ^id ( void (^constraints)(MASConstraintMaker *) ) {  \
return self;    \
};  \
}
@implementation SSDKBaseViewChainModel (Masonry)
#if __has_include(<Masonry.h>) || __has_include("Masonry.h")
SSDKCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(makeMasonry, mas_makeConstraints);
SSDKCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(updateMasonry, mas_updateConstraints);
SSDKCATEGORY_CHAIN_MASONRY_IMPLEMENTATION(remakeMasonry, mas_remakeConstraints);

#else
SSDKCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(makeMasonry, mas_makeConstraints);
SSDKCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(updateMasonry, mas_updateConstraints);
SSDKCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL(remakeMasonry, mas_remakeConstraints);
#endif

@end
#undef SSDKCATEGORY_CHAIN_MASONRY_IMPLEMENTATION
#undef SSDKCATEGORY_CHAIN_MASONRY_IMPLEMENTATION_NULL
