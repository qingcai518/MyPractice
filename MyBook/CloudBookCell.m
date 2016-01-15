//
//  CloudBookCell.m
//  MyBook
//
//  Created by user on 2016/01/14.
//  Copyright © 2016年 user. All rights reserved.
//

#import "CloudBookCell.h"

#define bookNameFontSize 20
#define authorFontSize 12
#define detailFontSize 12

@implementation CloudBookCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void) initSubView {
    imageView = [[UIImageView alloc]init];
    bookName = [[UILabel alloc]init];
    bookName.font = [UIFont systemFontOfSize:bookNameFontSize];
    author = [[UILabel alloc]init];
    author.font = [UIFont systemFontOfSize:authorFontSize];
    detail = [[UILabel alloc]init];
    detail.font = [UIFont systemFontOfSize:detailFontSize];
    
    [self addSubview:imageView];
    [self addSubview:bookName];
    [self addSubview:author];
    [self addSubview:detail];
}

- (void)setMyBook:(MyBook *)myBook {
    NSString *imgStr = myBook.imageStr;
    NSData *jpgData = [[NSData alloc] initWithBase64EncodedString:imgStr
                                                          options:NSDataBase64DecodingIgnoreUnknownCharacters];
    imageView.image = [UIImage imageWithData:jpgData];
    imageView.frame = CGRectMake(10, 10, 80, 120);
    
    //根据文本内容取得文本占用空间大小
    NSInteger positionX = CGRectGetMaxX(imageView.frame);
    CGSize bookNameSize = [myBook.bookName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:bookNameFontSize]}];
    CGRect bookNameRect = CGRectMake(positionX + 10, 10, bookNameSize.width, bookNameSize.height);
    bookName.text = myBook.bookName;
    bookName.frame = bookNameRect;

    CGSize authorSize = [myBook.author sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:authorFontSize]}];
    CGRect authorRect = CGRectMake(positionX + 10, 10 + bookNameRect.size.height + 10, authorSize.width, authorSize.height);
    author.text = myBook.author;
    author.frame = authorRect;
    
    CGFloat textWidth = self.frame.size.width - 2 * 10;
    CGSize detailSize = [myBook.detail boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:detailFontSize]} context:nil].size;
    CGRect detailRect = CGRectMake(positionX + 10, 10 + bookNameRect.size.height + 10 + authorRect.size.height + 10, detailSize.width, detailSize.height);
    detail.text = myBook.detail;
    detail.frame = detailRect;
    
    _height = CGRectGetMaxY(imageView.frame) + 2 * 10;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
