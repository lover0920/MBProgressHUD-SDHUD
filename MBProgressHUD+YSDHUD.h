//
//  MBProgressHUD+YSDHUD.h
//  freeStuff
//
//  Created by 孙号斌 on 2017/11/17.
//  Copyright © 2017年 孙号斌. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>


#define HUD_Message_Time            1.5f
#define HUD_StatusMessage_Time      1.5f
#define HUD_StatusMessage_Time      1.5f

typedef NS_ENUM(NSInteger, MBProgressHUDIconStatus) {
    MBProgressHUDIconStatusError,
    MBProgressHUDIconStatusSuccess,
    MBProgressHUDIconStatusInfo,
    MBProgressHUDIconStatusWarn
};

@interface MBProgressHUD (YSDHUD)
+ (void)showMessageInWindow:(NSString*)message
            completionBlock:(MBProgressHUDCompletionBlock)block;
+ (void)showMessageInView:(NSString*)message
          completionBlock:(MBProgressHUDCompletionBlock)block;

+ (void)showActivityInWindow:(NSString*)message;
+ (void)showActivityInView:(NSString*)message;

+ (void)showStatusMessageInWindow:(MBProgressHUDIconStatus)status
                          message:(NSString *)message
                  completionBlock:(MBProgressHUDCompletionBlock)block;

+ (void)hideHUD;


@end
