//
//  UIAlertView+BlockAdditions.h
//  UIKitCategoryAdditions
//
//  Created by Mugunth on 21/03/11.
//  Copyright 2011 NakCheon Jung. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void (^VoidBlock)();

typedef void (^DismissBlock)(int buttonIndex);
typedef void (^CancelBlock)();
typedef void (^PhotoPickedBlock)(UIImage *chosenImage);


@interface UIAlertView (Block) <UIAlertViewDelegate> 
+(UIAlertView*)alertViewWithTitle:(NSString*)title
                            message:(NSString*)message;

+(UIAlertView*)alertViewWithTitle:(NSString*)title
                            message:(NSString*)message
                  cancelButtonTitle:(NSString*)cancelButtonTitle;

+(UIAlertView*)alertViewWithTitle:(NSString*)title
                            message:(NSString*)message
                  cancelButtonTitle:(NSString*)cancelButtonTitle
                  otherButtonTitles:(NSArray*)otherButtons
                          onDismiss:(DismissBlock)dismissed
                           onCancel:(CancelBlock)cancelled;

@property (nonatomic, copy) DismissBlock dismissBlock;
@property (nonatomic, copy) CancelBlock cancelBlock;

@end
