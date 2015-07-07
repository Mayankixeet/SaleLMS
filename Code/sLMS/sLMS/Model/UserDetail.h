//
//  UserDetail.h
//  sLMS
//
//  Created by Mayank on 07/07/15.
//  Copyright (c) 2015 Mayank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDetail : NSObject
@property (nonatomic,strong) NSNumber* userId;
@property (nonatomic,strong) NSString* userFirstName;
@property (nonatomic,strong) NSString* userLastName;
@property (nonatomic,strong) NSString* userRole;
@property (nonatomic,strong) NSString* userEmail;
@property (nonatomic,strong) NSString* userPassword;
@property (nonatomic,strong) NSString* userFBEmail;
@end
