//
//  AppConstant.h
//  sLMS
//
//  Created by Mayank on 07/07/15.
//  Copyright (c) 2015 Mayank. All rights reserved.
//

#ifndef sLMS_AppConstant_h
#define sLMS_AppConstant_h

#define  APP_URL  @"http://52.5.111.203/OMGQuoteMobileService/OMGEnterpriseAjax.svc/"


//App URL
//#define  APP_URL  @"http://10.151.1.10/OMGQuoteMobileService/OMGEnterpriseAjax.svc/"

#define USER_LOGIN_URL APP_URL@"QuoteLogin"
#define USER_LOGUT_URL APP_URL@"QuoteLogout"

//App Delegate Reference
#define appDelegate (AppDelegate *)[[UIApplication sharedApplication] delegate]

//server Respond Key
#define key_severRespond_Status @"Status"
#define key_severRespond_StatusMessage @"StatusMessage"

// Error Msg
#define MISSING_LOGIN_ID @"Please enter user id."
#define MISSING_PASSWORD @"Please enter password."

// Success Message Alert Title

#define SUCCESS_MESSAGE_ALERT_TITLE @"Info"

#endif
