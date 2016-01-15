//
//  CloudViewController.h
//  MyBook
//
//  Created by user on 2016/01/14.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyBook.h"
#import "CloudBookCell.h"
#import "AFNetworking.h"

@interface CloudViewController : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    UITableViewStyle style;
    UITableView *myView;
    NSMutableArray *_myBook;
}

- (id)initWithStyle:(UITableViewStyle)theStyle;
@end
