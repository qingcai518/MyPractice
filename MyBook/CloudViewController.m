//
//  CloudViewController.m
//  MyBook
//
//  Created by user on 2016/01/14.
//  Copyright © 2016年 user. All rights reserved.
//

#import "CloudViewController.h"
#define URL @"http://myreader.main.jp/service.php"

@interface CloudViewController ()

@end

@implementation CloudViewController


- (id)initWithStyle:(UITableViewStyle)theStyle
{
    self = [super init];
    if (self != nil) {
        style = theStyle;
    }
    return self;
}

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    myView = [[UITableView alloc] initWithFrame:view.bounds style:style];
    myView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    myView.dataSource = self;
    myView.delegate = self;
    
    
//    UIScreen *sc = [UIScreen mainScreen];
//    CGRect rect = sc.bounds;
//    tableView.center = CGPointMake(rect.size.width/2, rect.size.height/2);
//    tableView.separatorColor = [UIColor clearColor];
    [view addSubview:myView];

    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeRequests:URL type:YES];
}

/*
 read dummy data from plist.
 */
//- (void) initData {
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"mybook" ofType:@"plist"];
//    NSArray *array = [NSArray arrayWithContentsOfFile:path];
//    _myBook = [[NSMutableArray alloc]init];
//    _myBookCells = [[NSMutableArray alloc]init];
//    
//    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [_myBook addObject:[MyBook statusWithDictionary:obj]];
//        CloudBookCell *cell = [[CloudBookCell alloc]init];
//        [_myBookCells addObject:cell];
//    }];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _myBook.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *cellId = @"id1";
    CloudBookCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[CloudBookCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    MyBook *myBook = _myBook[indexPath.row];
    
    cell.myBook = myBook;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    CloudBookCell *cell = _myBookCells[indexPath.row];
    CloudBookCell *cell = [[CloudBookCell alloc]init];
    cell.myBook = _myBook[indexPath.row];
    return cell.height;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

// access server
- (void)makeRequests:(NSString *)query type:(BOOL)isType {
    NSURL *url = [NSURL URLWithString:query];
    NSLog(@"!!url: %@",url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [AFJSONRequestOperation addAcceptableContentTypes:
     [NSSet setWithObject:@"text/html"]];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:^(NSURLRequest *request, NSHTTPURLResponse *response, id responseObject) {
                                             NSArray *array = [NSArray arrayWithObject:responseObject];
                                             
                                             _myBook = [[NSMutableArray alloc]init];
                                             for (NSArray *sub in array[0]) {
                                                 MyBook *book = [[MyBook alloc]init];
                                                 book.bookName = sub[1];
                                                 book.author = sub[2];
                                                 book.detail = sub[3];
                                                 book.imageStr = sub[5];
                                                 [_myBook addObject:book];
                                             }
                                             
                                             [myView reloadData];
                                         }
                                         failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id responseObject) {
                                             NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
                                         }];

    [operation start];
}

@end
