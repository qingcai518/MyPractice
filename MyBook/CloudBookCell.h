//
//  CloudBookCell.h
//  MyBook
//
//  Created by user on 2016/01/14.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyBook.h"

@interface CloudBookCell : UITableViewCell {
    UIImageView *imageView;
    UILabel *bookName;
    UILabel *author;
    UILabel *detail;
}

@property (nonatomic, strong) MyBook *myBook;

@property (nonatomic, assign) CGFloat height;

@end
