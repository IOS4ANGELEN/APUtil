//
//  UIAlertController+APUtil.m
//  donaRaposa
//
//  Created by Flavio Negrão Torres on 27/01/15.
//  Copyright (c) 2015 Apetis. All rights reserved.
//

#import "UIAlertController+APUtil.h"

@implementation UIAlertController (APUtil)


+ (instancetype) alertControllerForLocalizedErrorMessage:(NSError*) error {
    
    NSString* message = [NSString stringWithFormat:@"%@\n\nCódigo do Erro: %ld",error.localizedDescription,error.code];
    
    UIAlertController* alerController = [UIAlertController alertControllerWithTitle:@"Erro" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alerController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:NULL]];
    
    return alerController;
}


+ (instancetype) alertControllerForTitle:(NSString*) title message:(NSString*) msg okButtonAction:(void (^)(UIAlertAction*)) actionBlock{
    UIAlertController* alerController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
    
    [alerController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:actionBlock]];
    
    return alerController;
}


+ (UIAlertControllerStyle) preferedAlertControllerStyle {
    
    UIAlertControllerStyle alertStyle;
    UIWindow* mainWindow = [UIApplication sharedApplication].keyWindow;
    UIView* mainView = mainWindow.rootViewController.view;
    if (mainView.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        alertStyle = UIAlertControllerStyleAlert;
    } else {
        alertStyle = UIAlertControllerStyleActionSheet;
    }
    return alertStyle;
}

@end
