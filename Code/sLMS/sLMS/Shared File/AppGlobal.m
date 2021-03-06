//
//  AppGlobal.m
//  sLMS
//
//  Created by Mayank on 07/07/15.
//  Copyright (c) 2015 Mayank. All rights reserved.
//

#import "AppGlobal.h"

@implementation AppGlobal

//Show warning message
+(void)showAlertWithMessage:(NSString*)msg title:(NSString*)title{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
}

//Set View Position
+(void)setViewPositionWithView:(UIView*)view axisX:(NSInteger)axisX axisY:(NSInteger)axisY withAnimation:(BOOL)animation{
    
    if (animation) {
        [UIView animateWithDuration:0.5
                         animations:^{
                             CGRect rect=view.frame;
                             rect.origin.x=axisX;
                             rect.origin.y=axisY;
                             view.frame=rect;
                             
                         }
                         completion:^(BOOL finished){
                             
                         }
         ];
        
    }else{
        
        CGRect rect=view.frame;
        rect.origin.x=axisX;
        rect.origin.y=axisY;
        view.frame=rect;
    }
    
}

//Custom Button
+(void)roundButton:(UIButton*)btn withFontColor:(UIColor*)fontColor withBG:(UIColor*)BGcolor withRadius:(NSInteger)radius withborderWidth:(float)borderWidth{
    
    [btn setTitleColor:fontColor forState:UIControlStateNormal];
    btn.backgroundColor = BGcolor;
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = borderWidth;
    btn.layer.cornerRadius = radius;
}


//Round View
+(void)roundView:(UIView*)view withRadius:(NSInteger)radius borderWidth:(float)width color:(UIColor*)bcolor setshadow:(BOOL)shadow shadowOffset:(CGSize)shadowOffset shadowOpacity:(float)shadowOpacity shadowColor:(UIColor*)shadowColor{
    
    [view.layer setBorderWidth:width];
    [view.layer setBorderColor:bcolor.CGColor];
    view.layer.cornerRadius = radius;
    view.clipsToBounds = YES;
    
    if (shadow) {
        view.layer.masksToBounds = NO;
        view.layer.shadowOffset = shadowOffset;
        view.layer.shadowOpacity = shadowOpacity;
        view.layer.shadowColor = shadowColor.CGColor;
    }
    
    
    // [view.layer setNeedsDisplay];
}


//Manage User Default Value
+(void)setValueInDefault:(NSString *)key value:(id)value
{
    [[NSUserDefaults standardUserDefaults] setValue:value forKey:(NSString*)key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+(id)getValueInDefault:key
{
    return [[NSUserDefaults standardUserDefaults] valueForKey:(NSString*)key];
    
}


//Create Error Object
+(NSError*)createErrorObjectWithDescription:(NSString*)error_str errorCode:(NSInteger)errorCode{
    
    NSMutableDictionary* details = [NSMutableDictionary dictionary];
    [details setValue:error_str forKey:NSLocalizedDescriptionKey];
    NSError *error = [NSError errorWithDomain:@"Login" code:errorCode userInfo:details];
    
    return error;
}


//NSDate Convert to String
+(NSString*)nsdateConvertToStringWithFormate:(NSString *)Formate date:(NSDate*)date{
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:Formate];
    NSTimeZone* localTimeZone = [NSTimeZone localTimeZone];
    format.timeZone=localTimeZone;
    NSString *_strdate=[format stringFromDate:date];
    
    return _strdate;
}

//string date cinver to nsdate
+(NSDate*)convertStringDateToNSDate:(NSString*)CustomeFormate withNSDate:(NSString*)str_date{
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:CustomeFormate];
    NSTimeZone* localTimeZone = [NSTimeZone localTimeZone];
    format.timeZone=localTimeZone;
    NSDate *date=[format dateFromString:str_date];
    
    
    return date;
}
//Manage Read And Write File
+(NSMutableArray *)readFileData:(NSString *)strPath
{
    
    NSData *fileData = [NSData dataWithContentsOfFile:strPath];
    NSMutableArray *favArray = [NSJSONSerialization JSONObjectWithData:fileData options:NSJSONReadingMutableContainers error:nil];
    return favArray;
    
}


+(void)writeFile:(NSString *)filePath andData:(NSMutableArray *)arrayData
{
    NSData  *data=[NSJSONSerialization dataWithJSONObject:arrayData options:0 error:nil];
    NSOutputStream *stream = [[NSOutputStream alloc] initToFileAtPath:filePath append:NO];
    [stream open];
    [stream write:data.bytes maxLength:data.length];
    [stream close];
    stream = nil;
    
}
//
////Manage Get/ Set Drop Down List
//+(NSMutableArray*)getDropdownList:(AppDropdownType)dropdownName{
//    
//    NSMutableArray *stateList=[[NSMutableArray alloc] init];
//    NSString *filePath =  @"";
//    
//    
//    switch(dropdownName) {
//        case State_Dropdown:
//        case QuoteStatus_Dropdown:
//        case LostReason_Dropdown:
//        case QuoteShippingType_Dropdown:
//        case QuoteType_Dropdown:
//        case ProjectOwnerType_Dropdown:
//        {
//            filePath =  [[NSBundle mainBundle] pathForResource:[self getDropdownFileName:dropdownName] ofType:@"txt"];
//            
//        }break;
//        case LineOfBusiness_Dropdown:
//        case CategoryNotes_Dropdown:
//        case SalesPersons_Visualization_Dropdown:
//        case Templates_Dropdown:
//        case Location_Dropdown:
//        case MergeFields_Dropdown:
//        {
//            NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//            filePath =  [NSString stringWithFormat:@"%@/%@.txt",[arr objectAtIndex:0],[self getDropdownFileName:dropdownName] ];
//            
//            
//        }break;
//        case QuoteISTaxExempt_Dropdown:{
//            
//            [stateList addObject:@{@"Id":[NSNumber numberWithBool:YES],
//                                   @"Description":@"Yes",
//                                   }];
//            [stateList addObject:@{@"Id":[NSNumber numberWithBool:NO],
//                                   @"Description":@"No",
//                                   }];
//            
//            return stateList;
//            
//        }break;
//        case QuoteWonLost_DropDown:{
//            
//            [stateList addObject:@{@"Id":[NSNumber numberWithInteger:QuoteStatus_Won],
//                                   @"Description":@"Won",
//                                   }];
//            [stateList addObject:@{@"Id":[NSNumber numberWithInteger:QuoteStatus_Lost],
//                                   @"Description":@"Lost",
//                                   }];
//            
//            return stateList;
//            
//        }break;
//        case SalesPersons_QuoteDetail_Dropdown:{
//            
//            [stateList addObject:@{@"Id":userDetail.userId,
//                                   @"Description":userDetail.userName,
//                                   }];
//            return stateList;
//            
//        }break;
//            
//        default:
//            break;
//    }
//    
//    
//    
//    //read File
//    [stateList addObjectsFromArray:[AppGlobal readFileData:filePath]];
//    return stateList;
//    
//}
//+(void)setDropdownList:(AppDropdownType)dropdownName andData:(NSData *)data{
//    
//    
//    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *filePath =  [NSString stringWithFormat:@"%@/%@.txt",[arr objectAtIndex:0],[self getDropdownFileName:dropdownName] ];
//    //NSLog(@"filePath: %@",filePath);
//    [self  writeFile:filePath andData:data ];
//    
//}
//
//+(NSString*)getDropdownFileName:(AppDropdownType )dropdownName{
//    
//    NSString *fileName;
//    switch(dropdownName) {
//        case State_Dropdown:
//            fileName = @"stateList";
//            break;
//        case QuoteStatus_Dropdown:
//            fileName = @"quoteStatusList";
//            break;
//        case CategoryNotes_Dropdown:
//            fileName = @"categoryNotesList";
//            break;
//        case LineOfBusiness_Dropdown:
//            fileName = @"lineOfBusinessList";
//            break;
//        case SalesPersons_Visualization_Dropdown:
//            fileName = @"salesPersonsList";
//            break;
//        case Templates_Dropdown:
//            fileName = @"templatesList";
//            break;
//        case MergeFields_Dropdown:
//            fileName = @"mergeFieldsList";
//            break;
//        case LostReason_Dropdown:
//            fileName = @"lostReasonList";
//            break;
//        case QuoteShippingType_Dropdown:
//            fileName = @"quoteShippingTypeList";
//            break;
//        case QuoteType_Dropdown:
//            fileName = @"quoteTypeList";
//            break;
//        case Location_Dropdown:
//            fileName = @"quoteLocationList";
//            break;
//        case ProjectOwnerType_Dropdown:
//            fileName = @"projectOwnerType";
//            break;
//            
//            
//        default:
//            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
//    }
//    
//    
//    return fileName;
//}

//Calculate Dynamic Size of text
+(CGSize)calculateTextSizeWithString:(NSString*)text width:(CGFloat)width font:(UIFont*)font{
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    /// Set text alignment
    paragraphStyle.alignment = NSTextAlignmentLeft;
    
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text attributes:
                                          @{  NSFontAttributeName: font,
                                              NSParagraphStyleAttributeName:paragraphStyle}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGSize size = rect.size;
    size.width=width;
    //NSLog(@"Text: %@ \n size %@",text, NSStringFromCGSize(size));
    return size;
}

//Check Data Available in string or note
+(BOOL)checkDataAvailableInString:(NSString*)str_data{
    
    NSString *trim_Str= [str_data stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (trim_Str.length != 0) {
        return YES;
    }else{
        return NO;
    }
    
}


//Formatter Currency
+(NSString*)returnFormattedCurrency:(NSNumber*)currency{
    
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    
    [numberFormatter setCurrencySymbol:@"$"];
    
    numberFormatter.negativePrefix = [NSString stringWithFormat:@"- %@", numberFormatter.currencySymbol];
    numberFormatter.negativeSuffix = @"";
    
    NSString *numberAsString = [numberFormatter stringFromNumber:currency];
    
    return numberAsString;
}

+(NSNumber*)returnNumberOfFormattedString:(NSString*)currency{
    
    //currency=[currency stringByReplacingOccurrencesOfString:@"$ " withString:@""];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle: NSNumberFormatterCurrencyStyle];
    
    [numberFormatter setCurrencySymbol:@"$"];
    
    numberFormatter.negativePrefix = [NSString stringWithFormat:@"- %@", numberFormatter.currencySymbol];
    numberFormatter.negativeSuffix = @"";
    
    
    NSNumber *num=[numberFormatter numberFromString:currency];
    
    return num;
}

+(NSString*)returnWithoutFormattedCurrency:(NSString *)currency{
    
    NSRange range=[currency rangeOfString:@"$"];
    
    NSString *_currency;
    
    if (range.location == NSNotFound  ) {
        _currency=currency;
    }else{
        NSNumber *nPrice=[self returnNumberOfFormattedString:currency];
        _currency=[NSString stringWithFormat:@"%.2f",[nPrice doubleValue]];
        
        
    }
    
    return _currency;
}

//Manage Image Bytes
+(NSMutableArray*)returnBytesArrayOfNSData:(NSData*)data{
    
    NSUInteger len = data.length;
    uint8_t *bytes = (uint8_t *)[data bytes];
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:len];
    int i = 0;
    while(i < len){
        
        [result addObject:[NSNumber numberWithInteger:bytes[i]]];
        i++;
    }
    
    return result;
}


+(NSMutableData*)returnNSDataOfBytesArray:(NSArray*)bytes{
    
    NSMutableData *data = [[NSMutableData alloc] initWithCapacity:bytes.count];
    for (NSNumber *byteVal in bytes) {
        Byte b = (Byte)(byteVal.intValue);
        [data appendBytes:&b length:1];
    }
    
    return data;
}


//element Set Enabled
+(void)elementSetEnabled:(BOOL)enabled OfView:(UIView*)view{
    for (id obj in [view subviews]) {
        if ([obj isKindOfClass:[UITextField class]] || [obj isKindOfClass:[UIButton class]] || [obj isKindOfClass:[UITextView class]]) {
            [obj setEnabled:enabled];
        }
    }
}



@end

