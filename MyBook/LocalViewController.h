//
//  MyViewController.h
//  MyBook
//
//  Created by user on 2016/01/13.
//  Copyright © 2016年 user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewCell.h"

@interface LocalViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate> {
}
@property (nonatomic,strong)UICollectionView *collectionView;
@end
