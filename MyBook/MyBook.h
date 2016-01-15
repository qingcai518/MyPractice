//
//  MyBook.h
//  MyBook
//
//  Created by user on 2016/01/14.
//  Copyright © 2016年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyBook : NSObject
@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSString *imageStr;
//@property (nonatomic, strong) UIImage *image;

@end
