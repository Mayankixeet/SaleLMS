//
//  CourseHandler.m
//  sLMS
//
//  Created by Mayank on 07/07/15.
//  Copyright (c) 2015 Mayank. All rights reserved.
//

#import "CourseHandler.h"
#import "AFHTTPRequestOperationManager.h"
#import "Courses.h"
#import "Module.h"
@implementation CourseHandler
//get my Course Data
//get my Course Data
-(void)getMyCourse:(NSString*)userid AndTextSearch:(NSString*)txtSearch  success:(void (^)(NSMutableArray *courses))success   failure:(void (^)(NSError *error))failure{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSDictionary *parameters = @{@"userId":userid,
                                 @"searchText":txtSearch,
                                 };
    [manager POST:USER_COURSE_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
    
        
        
        NSDictionary *responseDic=[NSDictionary dictionaryWithDictionary:(NSDictionary*)responseObject];
        
        //Success Full Logout
        if ([[responseDic objectForKey:key_severRespond_Status] integerValue] == 1001) { //Success
            

            //call Block function
            NSMutableArray *courseList= [[NSMutableArray alloc]init];
            
            for (NSDictionary *dicCourese in [responseDic objectForKey:@"courseList"]) {
                Courses *course= [[Courses alloc]init];
                course.startedOn=[dicCourese objectForKey:@"startedOn"];
                course.completedPercentStatus=[dicCourese objectForKey:@"completedPercentStatus"];
                course.courseId=[dicCourese objectForKey:@"courseId"];
                course.courseName=[dicCourese objectForKey:@"courseName"];
              
                NSMutableArray * arrayModule= [[NSMutableArray alloc]init];
                for (NSDictionary *dicModule in [dicCourese objectForKey:@"moduleList"]) {
                    Module *module= [[Module alloc]init];
                    module.startedOn=[dicModule objectForKey:@"startedOn"];
                    module.completedPercentStatus=[dicModule objectForKey:@"completedPercentStatus"];
                    module.moduleId=[dicModule objectForKey:@"moduleId"];
                    module.moduleName=[dicModule objectForKey:@"moduleName"];
                    [arrayModule addObject:module];
                }
                course.moduleList=arrayModule;
                [courseList addObject:course];
            }
            success(courseList);
            
            
        }
        else {
            //call Block function
            failure([AppGlobal createErrorObjectWithDescription:[responseDic objectForKey:@"statusMessage"] errorCode:[[responseDic objectForKey:[responseDic objectForKey:@"status"] ] integerValue]]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure([AppGlobal createErrorObjectWithDescription:ERROR_DEFAULT_MSG errorCode:1000]);
        
    }];
    
}
@end
