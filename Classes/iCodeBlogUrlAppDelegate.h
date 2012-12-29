//
//  iCodeBlogUrlAppDelegate.h
//  iCodeBlogUrl
//
//  Created by Kiran Soumya on 12/13/12.
//  Copyright 2012 Cognizant. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iCodeBlogUrlViewController;

@interface iCodeBlogUrlAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iCodeBlogUrlViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iCodeBlogUrlViewController *viewController;

@end

