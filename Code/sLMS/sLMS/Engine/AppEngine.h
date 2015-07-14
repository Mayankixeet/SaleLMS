//
//  AppEngine.h
//  sLMS
//
//  Created by Mayank on 07/07/15.
//  Copyright (c) 2015 Mayank. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginHandler.h"
#import "UserDetail.h"

@protocol ApppEngineDelegate <NSObject>

@optional

@end
@interface AppEngine : NSObject
//User Login with credentials (user id and password)
-(void)loginWithUserName:(NSString*)userName password:(NSString*)password rememberMe:(BOOL)rememberMe success:(void (^)(UserDetail *userDetail))success  failure:(void (^)(NSError *error))failure;
#pragma mark - logout

//User Logout
-(void)logout:(void (^)(BOOL logoutValue))success  failure:(void (^)(NSError *error))failure;
//User Register
-(void)registerWithUserDetail:(UserDetail*)user success:(void (^)(UserDetail *userDetail))success  failure:(void (^)(NSError *error))failure;
-(void)ForgetPasswordWithUserName:(NSString*)userName success:(void (^)(BOOL logoutValue))success  failure:(void (^)(NSError *error))failure;

//FB Varification by Server
-(void)FBloginWithUserID:(NSString*)userid success:(void (^)(UserDetail *userDetail))success  failure:(void (^)(NSError *error))failure;
//User Set FB  with user id
-(void)SetFBloginWithUserID:(NSString*)username FBID:(NSString*)fbid success:(void (^)(bool status))success  failure:(void (^)(NSError *error))failure;
//get Master Data
-(void)getMasterData:(void (^)(BOOL success))success  failure:(void (^)(NSError *error))failure;

@end
