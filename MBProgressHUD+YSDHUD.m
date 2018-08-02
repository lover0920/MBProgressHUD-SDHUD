//
//  MBProgressHUD+YSDHUD.m
//  freeStuff
//
//  Created by 孙号斌 on 2017/11/17.
//  Copyright © 2017年 孙号斌. All rights reserved.
//

#import "MBProgressHUD+YSDHUD.h"

@implementation MBProgressHUD (YSDHUD)
#pragma mark - 只显示文字、自动隐藏
+ (void)showMessageInWindow:(NSString*)message
            completionBlock:(MBProgressHUDCompletionBlock)block
{
    MBProgressHUD *hud = [self createHUDViewWithMessage:message isWindow:YES];
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:HUD_Message_Time];
    hud.completionBlock = block;
}

+ (void)showMessageInView:(NSString*)message
          completionBlock:(MBProgressHUDCompletionBlock)block
{
    MBProgressHUD *hud = [self createHUDViewWithMessage:message isWindow:NO];
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:HUD_Message_Time];
    hud.completionBlock = block;
}

#pragma mark - 显示圈文字，不隐藏
+ (void)showActivityInWindow:(NSString*)message
{
    MBProgressHUD *hud  =  [self createHUDViewWithMessage:message isWindow:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
}
+ (void)showActivityInView:(NSString*)message
{
    MBProgressHUD *hud  =  [self createHUDViewWithMessage:message isWindow:NO];
    hud.mode = MBProgressHUDModeIndeterminate;
}


#pragma mark - 显示自定义图标和文字，自动隐藏
+ (void)showStatusMessageInWindow:(MBProgressHUDIconStatus)status
                          message:(NSString *)message
                  completionBlock:(MBProgressHUDCompletionBlock)block
{
    UIImage *image;
    switch (status)
    {
        case MBProgressHUDIconStatusError:
            image = [UIImage imageNamed:@"MBHUD_Error"];
            break;
        case MBProgressHUDIconStatusSuccess:
            image = [UIImage imageNamed:@"MBHUD_Success"];
            break;
        case MBProgressHUDIconStatusInfo:
            image = [UIImage imageNamed:@"MBHUD_Info"];
            break;
        default:
            image = [UIImage imageNamed:@"MBHUD_Warn"];
            break;
    }
    MBProgressHUD *hud  =  [self createHUDViewWithMessage:message isWindow:NO];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hide:YES afterDelay:HUD_StatusMessage_Time];
    hud.completionBlock = block;
}

+ (void)hideHUD
{
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:winView animated:YES];
    [self hideHUDForView:[self getCurrentUIVC].view animated:YES];
}














#pragma mark - 私有方法
+ (MBProgressHUD *)createHUDViewWithMessage:(NSString*)message
                                   isWindow:(BOOL)isWindow
{
    UIView *view = isWindow ? (UIView*)[UIApplication sharedApplication].delegate.window : [self getCurrentUIVC].view;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabelText = message ? message : nil;
    hud.detailsLabelFont = UIFont(17);
    hud.color = RGB(164, 170, 179);
    hud.cornerRadius = 0.0f;
    hud.opaque = 1.0f;
    hud.removeFromSuperViewOnHide = YES;
    hud.dimBackground = NO;
    return hud;
}

//获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }
    return superVC;
}

+ (UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView;
    if ([window subviews].count > 0) {
        frontView = [[window subviews] objectAtIndex:0];
    }
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}
@end
