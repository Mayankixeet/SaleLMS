//
//  LoginHandler.m
//  sLMS
//
//  Created by Mayank on 07/07/15.
//  Copyright (c) 2015 Mayank. All rights reserved.
//

#import "LoginHandler.h"
#import "AFNetworking.h"
@implementation LoginHandler


//User Login
-(void)loginWithUserName:(NSString*)userName password:(NSString*)password  success:(void (^)(UserDetail *userDetail))success  failure:(void (^)(NSError *error))failure{
    
    
    NSDictionary *parameters = @{@"Password":password,
                                 @"UserName":userName,
                                 };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager POST:@"" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *responseDic=[NSDictionary dictionaryWithDictionary:(NSDictionary*)responseObject];
        
        //Success Full Login
        if ([[responseDic objectForKey:@""] integerValue] == 10000) { //Success
            
            //Create Global User Detail Data Model
            
          UserDetail  *userDetail= [[UserDetail alloc]init];
            userDetail.userId= [responseDic objectForKey:@"UserId"];
            userDetail.userFirstName=[responseDic objectForKey:@"Name"];
            userDetail.userRole=[responseDic objectForKey:@"Role"];
            
            // save Category at Local
//            [AppGlobal setDropdownList:CategoryNotes_Dropdown andData:[responseDic objectForKey:@"Categories"]];
//            

//            //Save Mobile Token In user default
//            [AppGlobal setValueInDefault:key_MobileUserToken value:[responseDic objectForKey:key_MobileUserToken]];
//            
            //call Block function
            success(userDetail);
        }
        else if ([[responseDic objectForKey:@""] integerValue] ==10001) { //100001 Invalid Login credential
            
            //call Block function
          failure([AppGlobal createErrorObjectWithDescription:@"" errorCode:[[responseDic objectForKey:@""] integerValue]]);
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //call Block function
       failure([AppGlobal createErrorObjectWithDescription:@"" errorCode:10001]);
        NSLog(@"Error: %@", error);
    }];
    
}

//User Logout
-(void)logout:(void (^)(BOOL logoutValue))success  failure:(void (^)(NSError *error))failure{
    
    UserDetail *userDetail= [[UserDetail alloc]init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:[AppGlobal getValueInDefault:@""]  forHTTPHeaderField:@"MobileUserToken"];
    [manager.requestSerializer setValue:[NSString stringWithFormat:@"%ld",[userDetail.userId longValue]] forHTTPHeaderField:@"UserId"];
    
    
    [manager GET:@"" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSDictionary *responseDic=[NSDictionary dictionaryWithDictionary:(NSDictionary*)responseObject];
        
        //Success Full Logout
        if ([[responseDic objectForKey:@""] integerValue] == 10000) { //Success
            
            //call Block function
            success(YES);
        }
        else if ([[responseDic objectForKey:@""] integerValue] ==10002) { //Invalid Token
            
            //call Block function
            success(YES);
            
        }
        else if ([[responseDic objectForKey:@""] integerValue] ==10003) { //Token expired
            
            //call Block function
            success(YES);
            
        }
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure([AppGlobal createErrorObjectWithDescription:@"" errorCode:10001]);
        
    }];
    
}

@end
