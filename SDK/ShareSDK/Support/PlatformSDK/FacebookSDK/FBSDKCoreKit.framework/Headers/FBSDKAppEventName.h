// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <Foundation/Foundation.h>

/**
 @methodgroup Predefined event names for logging events common to many apps.  Logging occurs through the `logEvent` family of methods on `FBSDKAppEvents`.
 Common event parameters are provided in the `FBSDKAppEventsParameterNames*` constants.
 */

/// typedef for FBSDKAppEventName
typedef NSString * FBSDKAppEventName NS_TYPED_EXTENSIBLE_ENUM NS_SWIFT_NAME(AppEvents.Name);

// MARK: - General Purpose

/** Log this event when the user clicks an ad. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameAdClick;

/** Log this event when the user views an ad. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameAdImpression;

/** Log this event when a user has completed registration with the app. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameCompletedRegistration;

/** Log this event when the user has completed a tutorial in the app. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameCompletedTutorial;

/** A telephone/SMS, email, chat or other type of contact between a customer and your business. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameContact;

/** The customization of products through a configuration tool or other application your business owns. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameCustomizeProduct;

/** The donation of funds to your organization or cause. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameDonate;

/** When a person finds one of your locations via web or application, with an intention to visit (example: find product at a local store). */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameFindLocation;

/** Log this event when the user has rated an item in the app.  The valueToSum passed to logEvent should be the numeric rating. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameRated;

/** The booking of an appointment to visit one of your locations. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameSchedule;

/** Log this event when a user has performed a search within the app. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameSearched;

/** The start of a free trial of a product or service you offer (example: trial subscription). */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameStartTrial;

/** The submission of an application for a product, service or program you offer (example: credit card, educational program or job). */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameSubmitApplication;

/** The start of a paid subscription for a product or service you offer. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameSubscribe;

/** Log this event when a user has viewed a form of content in the app. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameViewedContent;

// MARK: - E-Commerce

/** Log this event when the user has entered their payment info. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameAddedPaymentInfo;

/** Log this event when the user has added an item to their cart.  The valueToSum passed to logEvent should be the item's price. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameAddedToCart;

/** Log this event when the user has added an item to their wishlist.  The valueToSum passed to logEvent should be the item's price. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameAddedToWishlist;

/** Log this event when the user has entered the checkout process.  The valueToSum passed to logEvent should be the total price in the cart. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameInitiatedCheckout;

/** Log this event when the user has completed a transaction.  The valueToSum passed to logEvent should be the total price of the transaction. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNamePurchased;

// MARK: - Gaming

/** Log this event when the user has achieved a level in the app. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameAchievedLevel;

/** Log this event when the user has unlocked an achievement in the app. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameUnlockedAchievement;

/** Log this event when the user has spent app credits.  The valueToSum passed to logEvent should be the number of credits spent. */
FOUNDATION_EXPORT FBSDKAppEventName const FBSDKAppEventNameSpentCredits;
