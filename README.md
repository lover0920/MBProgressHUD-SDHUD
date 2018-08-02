# MBProgressHUD-SDHUD
自己对MBProgressHUD的一个扩展

---

``` 
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
//显示文本
+ (void)showMessageInWindow:(NSString*)message
completionBlock:(MBProgressHUDCompletionBlock)block;
+ (void)showMessageInView:(NSString*)message
completionBlock:(MBProgressHUDCompletionBlock)block;

//显示菊花
+ (void)showActivityInWindow:(NSString*)message;
+ (void)showActivityInView:(NSString*)message;

//显示状态message
+ (void)showStatusMessageInWindow:(MBProgressHUDIconStatus)status
message:(NSString *)message
completionBlock:(MBProgressHUDCompletionBlock)block;

//隐藏
+ (void)hideHUD;
@end
```
