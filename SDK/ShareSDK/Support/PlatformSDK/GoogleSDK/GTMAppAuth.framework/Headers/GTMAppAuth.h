/*! @file GTMAppAuth.h
    @brief GTMAppAuth SDK
    @copyright
        Copyright 2016 Google Inc.
    @copydetails
        Licensed under the Apache License, Version 2.0 (the "License");
        you may not use this file except in compliance with the License.
        You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

        Unless required by applicable law or agreed to in writing, software
        distributed under the License is distributed on an "AS IS" BASIS,
        WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
        See the License for the specific language governing permissions and
        limitations under the License.
 */

if __has_include(<GTMSessionFetcher/GTMSessionFetcher.h>)
  #import <GTMSessionFetcher/GTMSessionFetcher.h>
#else
  #import "GTMSessionFetcher.h"
#endif

if __has_include(<GTMAppAuth/GTMKeychain.h>)
 #import <GTMAppAuth/GTMAppAuthFetcherAuthorization.h>
 #import <GTMAppAuth/GTMAppAuthFetcherAuthorization+Keychain.h>
 #import <GTMAppAuth/GTMKeychain.h>
 #import <GTMAppAuth/GTMOAuth2KeychainCompatibility.h>
#else
 #import "GTMAppAuthFetcherAuthorization.h"
 #import "GTMAppAuthFetcherAuthorization+Keychain.h"
 #import "GTMKeychain.h"
 #import "GTMOAuth2KeychainCompatibility.h"
#endif



