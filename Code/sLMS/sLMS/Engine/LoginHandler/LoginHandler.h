//
//  LoginHandler.h
//  sLMS
//
//  Created by Mayank on 07/07/15.
//  Copyright (c) 2015 Mayank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginHandler : NSObject
//User Login
-(void)loginWithUserName:(NSString*)userName password:(NSString*)password  success:(void (^)(UserDetail *userDetail))success  failure:(void (^)(NSError *error))failure;

//User Logout
-(void)logout:(void (^)(BOOL logoutValue))success  failure:(void (^)(NSError *error))failure;
@end
