//
//  SCSDKSnapErrorCode.h
//  SCSDKCreativeKit
//
//  Copyright © 2017 Snap, Inc. All rights reserved.
//

@import Foundation;

#define SC_SDK_SNAP_ERROR_DOMAIN @"SCSDKCreativeKitErrorDomain"

typedef NS_ENUM(NSInteger, SCSDKCreativeKitErrorCode) {
    SCSDKCreativeKitErrorCodeUnknown,
    SCSDKCreativeKitErrorCodeInvalidArgument,
    SCSDKCreativeKitErrorCodeMainMediaDataReadFailure,
    SCSDKCreativeKitErrorCodeStickerDataReadFailure,
    SCSDKCreativeKitErrorCodeEncryptionMetadataReadFailure,
    SCSDKCreativeKitErrorCodeDeepLinkFailure,
    SCSDKCreativeKitErrorCodeIllegalState,
    SCSDKCreativeKitErrorCodeFileTooLarge,
    SCSDKCreativeKitErrorCodeInvalidFormat,
    SCSDKCreativeKitErrorCodeCaptionTooLong,
    SCSDKCreativeKitErrorCodeMalformedURL,
    SCSDKCreativeKitErrorCodeMissingData,
    SCSDKCreativeKitErrorCodeNone,
    SCSDKCreativeKitErrorCodeStickerInvalidFormat,
    SCSDKCreativeKitErrorCodeStickerMissingURL,
    SCSDKCreativeKitErrorCodeStickerInvalidDimensions,
    SCSDKCreativeKitErrorCodeLensMissingID,
    SCSDKCreativeKitErrorCodeVideoTooLong,
    SCSDKCreativeKitErrorCodeTopicTooLong,
    SCSDKCreativeKitErrorCodeTopicInvalidCharacter,
    SCSDKCreativeKitErrorCodeTooManyTopics,
};
