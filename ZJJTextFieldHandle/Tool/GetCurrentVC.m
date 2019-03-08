//
//  GetCurrentVC.m
//  ZJJTextFieldHandle
//
//  Created by YD on 2019/3/8.
//  Copyright © 2019年 YD. All rights reserved.
//

#import "GetCurrentVC.h"

@implementation GetCurrentVC

+ (UIViewController *)obtainCurrentViewController {
    UIViewController *rootVC = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    if ([rootVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav = (UINavigationController *)rootVC;
        return nav.topViewController;
    } else if ([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabbar = (UITabBarController *)rootVC;
        UINavigationController *nav = tabbar.selectedViewController;
        return nav.topViewController;
    } else {
        while (rootVC.presentedViewController) {
            rootVC = rootVC.presentedViewController;
        }
        return rootVC;
    }
}

@end
