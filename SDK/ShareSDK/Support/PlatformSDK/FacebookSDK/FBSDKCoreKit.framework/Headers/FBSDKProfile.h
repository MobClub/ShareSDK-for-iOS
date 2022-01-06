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
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."

#if !TARGET_OS_TV

#import <FBSDKCoreKit/FBSDKProfilePictureView.h>

@class FBSDKLocation;
@class FBSDKProfile;
@class FBSDKUserAgeRange;

NS_ASSUME_NONNULL_BEGIN



/**
  Notification indicating that the `currentProfile` has changed.

 the userInfo dictionary of the notification will contain keys
 `FBSDKProfileChangeOldKey` and
 `FBSDKProfileChangeNewKey`.
 */
FOUNDATION_EXPORT NSNotificationName const FBSDKProfileDidChangeNotification
NS_SWIFT_NAME(ProfileDidChange);

/*   key in notification's userInfo object for getting the old profile.

 If there was no old profile, the key will not be present.
 */
FOUNDATION_EXPORT NSString *const FBSDKProfileChangeOldKey
NS_SWIFT_NAME(ProfileChangeOldKey);

/*   key in notification's userInfo object for getting the new profile.

 If there is no new profile, the key will not be present.
 */
FOUNDATION_EXPORT NSString *const FBSDKProfileChangeNewKey
NS_SWIFT_NAME(ProfileChangeNewKey);

/**
 Describes the callback for loadCurrentProfileWithCompletion.
 @param profile the FBSDKProfile
 @param error the error during the request, if any

 */
typedef void (^FBSDKProfileBlock)(FBSDKProfile *_Nullable profile, NSError *_Nullable error)
NS_SWIFT_NAME(ProfileBlock);

/**
 Represents the unique identifier for an end user
 */
typedef NSString FBSDKUserIdentifier
NS_SWIFT_NAME(UserIdentifier);

/**
  Represents an immutable Facebook profile

 This class provides a global "currentProfile" instance to more easily
 add social context to your application. When the profile changes, a notification is
 posted so that you can update relevant parts of your UI and is persisted to NSUserDefaults.

 Typically, you will want to call `enableUpdatesOnAccessTokenChange:YES` so that
 it automatically observes changes to the `[FBSDKAccessToken currentAccessToken]`.

 You can use this class to build your own `FBSDKProfilePictureView` or in place of typical requests to "/me".
 */
NS_SWIFT_NAME(Profile)
@interface FBSDKProfile : NSObject<NSCopying, NSSecureCoding>

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

/**
  initializes a new instance.
 @param userID the user ID
 @param firstName the user's first name
 @param middleName the user's middle name
 @param lastName the user's last name
 @param name the user's complete name
 @param linkURL the link for this profile
 @param refreshDate the optional date this profile was fetched. Defaults to [NSDate date].
 */
- (instancetype)initWithUserID:(FBSDKUserIdentifier *)userID
                     firstName:(nullable NSString *)firstName
                    middleName:(nullable NSString *)middleName
                      lastName:(nullable NSString *)lastName
                          name:(nullable NSString *)name
                       linkURL:(nullable NSURL *)linkURL
                   refreshDate:(nullable NSDate *)refreshDate;

/**
 @param userID the user ID
 @param firstName the user's first name
 @param middleName the user's middle name
 @param lastName the user's last name
 @param name the user's complete name
 @param linkURL the link for this profile
 @param refreshDate the optional date this profile was fetched. Defaults to [NSDate date].
 @param imageURL an optional URL to use for fetching a user's profile image
 @param email the user's email
 @param friendIDs a list of identifiers for the user's friends
 @param birthday the user's birthday
 @param ageRange the user's age range
 @param hometown the user's hometown
 @param location the user's location
 @param gender the user's gender
 @param isLimited indicates if the information provided is incomplete in some way.
 When true, `loadCurrentProfileWithCompletion:` will assume the profile is
 incomplete and disregard any cached profile. Defaults to false.
 */
- (instancetype)initWithUserID:(FBSDKUserIdentifier *)userID
                     firstName:(nullable NSString *)firstName
                    middleName:(nullable NSString *)middleName
                      lastName:(nullable NSString *)lastName
                          name:(nullable NSString *)name
                       linkURL:(nullable NSURL *)linkURL
                   refreshDate:(nullable NSDate *)refreshDate
                      imageURL:(nullable NSURL *)imageURL
                         email:(nullable NSString *)email
                     friendIDs:(nullable NSArray<FBSDKUserIdentifier *> *)friendIDs
                      birthday:(nullable NSDate *)birthday
                      ageRange:(nullable FBSDKUserAgeRange *)ageRange
                      hometown:(nullable FBSDKLocation *)hometown
                      location:(nullable FBSDKLocation *)location
                        gender:(nullable NSString *)gender
                     isLimited:(BOOL)isLimited;

/**
  initializes a new instance.
 @param userID the user ID
 @param firstName the user's first name
 @param middleName the user's middle name
 @param lastName the user's last name
 @param name the user's complete name
 @param linkURL the link for this profile
 @param refreshDate the optional date this profile was fetched. Defaults to [NSDate date].
 @param imageURL an optional URL to use for fetching a user's profile image
 @param email the user's email
 @param friendIDs a list of identifiers for the user's friends
 @param birthday the user's birthday
 @param ageRange the user's age range
 @param hometown the user's hometown
 @param location the user's location
 @param gender the user's gender
 */
- (instancetype)initWithUserID:(FBSDKUserIdentifier *)userID
                     firstName:(nullable NSString *)firstName
                    middleName:(nullable NSString *)middleName
                      lastName:(nullable NSString *)lastName
                          name:(nullable NSString *)name
                       linkURL:(nullable NSURL *)linkURL
                   refreshDate:(nullable NSDate *)refreshDate
                      imageURL:(nullable NSURL *)imageURL
                         email:(nullable NSString *)email
                     friendIDs:(nullable NSArray<FBSDKUserIdentifier *> *)friendIDs
                      birthday:(nullable NSDate *)birthday
                      ageRange:(nullable FBSDKUserAgeRange *)ageRange
                      hometown:(nullable FBSDKLocation *)hometown
                      location:(nullable FBSDKLocation *)location
                         gender:(nullable NSString *)gender
NS_DESIGNATED_INITIALIZER;

/**
 The current profile instance and posts the appropriate notification
 if the profile parameter is different than the receiver.

 This persists the profile to NSUserDefaults.
 */

/// The current profile
@property (class, nonatomic, strong, nullable) FBSDKProfile *currentProfile
NS_SWIFT_NAME(current);

/**
  The user id
 */
@property (nonatomic, copy, readonly) FBSDKUserIdentifier *userID;
/**
  The user's first name
 */
@property (nonatomic, copy, readonly, nullable) NSString *firstName;
/**
  The user's middle name
 */
@property (nonatomic, copy, readonly, nullable) NSString *middleName;
/**
  The user's last name
 */
@property (nonatomic, copy, readonly, nullable) NSString *lastName;
/**
  The user's complete name
 */
@property (nonatomic, copy, readonly, nullable) NSString *name;
/**
  A URL to the user's profile.

  IMPORTANT: This field will only be populated if your user has granted your application the 'user_link' permission

 Consider using `FBSDKAppLinkResolver` to resolve this
 to an app link to link directly to the user's profile in the Facebook app.
 */
@property (nonatomic, readonly, nullable) NSURL *linkURL;

/**
  The last time the profile data was fetched.
 */
@property (nonatomic, readonly) NSDate *refreshDate;
/**
  A URL to use for fetching a user's profile image.
 */
@property (nonatomic, readonly, nullable) NSURL *imageURL;
/**
  The user's email.

 IMPORTANT: This field will only be populated if your user has granted your application the 'email' permission.
 */
@property (nonatomic, copy, readonly, nullable) NSString *email;
/**
  A list of identifiers of the user's friends.

 IMPORTANT: This field will only be populated if your user has granted your application the 'user_friends' permission.
 */
@property (nonatomic, copy, readonly, nullable) NSArray<FBSDKUserIdentifier *> *friendIDs;

/**
  The user's birthday.

 IMPORTANT: This field will only be populated if your user has granted your application the 'user_birthday' permission.
 */
@property (nonatomic, copy, readonly, nullable) NSDate *birthday;

/**
  The user's age range

 IMPORTANT: This field will only be populated if your user has granted your application the 'user_age_range' permission.
 */
@property (nonatomic, copy, readonly, nullable) FBSDKUserAgeRange *ageRange;

/**
  The user's hometown

 IMPORTANT: This field will only be populated if your user has granted your application the 'user_hometown' permission.
 */
@property (nonatomic, copy, readonly, nullable) FBSDKLocation *hometown;

/**
  The user's location

 IMPORTANT: This field will only be populated if your user has granted your application the 'user_location' permission.
 */
@property (nonatomic, copy, readonly, nullable) FBSDKLocation *location;

/**
  The user's gender

 IMPORTANT: This field will only be populated if your user has granted your application the 'user_gender' permission.
 */
@property (nonatomic, copy, readonly, nullable) NSString *gender;

/**
  Indicates if `currentProfile` will automatically observe `FBSDKAccessTokenDidChangeNotification` notifications
 @param enable YES is observing

 If observing, this class will issue a graph request for public profile data when the current token's userID
 differs from the current profile. You can observe `FBSDKProfileDidChangeNotification` for when the profile is updated.

 Note that if `[FBSDKAccessToken currentAccessToken]` is unset, the `currentProfile` instance remains. It's also possible
 for `currentProfile` to return nil until the data is fetched.
 */
+ (void)enableUpdatesOnAccessTokenChange:(BOOL)enable
NS_SWIFT_NAME(enableUpdatesOnAccessTokenChange(_:));

/**
  Loads the current profile and passes it to the completion block.
 @param completion The block to be executed once the profile is loaded

 If the profile is already loaded, this method will call the completion block synchronously, otherwise it
 will begin a graph request to update `currentProfile` and then call the completion block when finished.
 */
+ (void)loadCurrentProfileWithCompletion:(nullable FBSDKProfileBlock)completion;

/**
  A convenience method for returning a complete `NSURL` for retrieving the user's profile image.
 @param mode The picture mode
 @param size The height and width. This will be rounded to integer precision.
 */
- (nullable NSURL *)imageURLForPictureMode:(FBSDKProfilePictureMode)mode size:(CGSize)size
NS_SWIFT_NAME(imageURL(forMode:size:));

/**
  Returns YES if the profile is equivalent to the receiver.
 @param profile the profile to compare to.
 */
- (BOOL)isEqualToProfile:(FBSDKProfile *)profile;
@end

NS_ASSUME_NONNULL_END

#endif
