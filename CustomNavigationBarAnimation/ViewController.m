//
//  ViewController.m
//  CustomNavigationBarAnimation
//
//  Created by yxibng on 2019/1/12.
//  Copyright © 2019 yxibng. All rights reserved.
//

#import "ViewController.h"

static NSString *CellMark = @"cell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topViewHeight;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageWidth;

@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellMark];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellMark];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offset = scrollView.contentOffset.y;
    CGFloat height = self.topViewHeight.constant;
    
    
    
    if (offset > 0) {
        if (height > 64) {
            self.topViewHeight.constant = height - offset;
            [scrollView setContentOffset:CGPointZero];
            
            
            
        }
    } else {
        if (height < 100) {
            self.topViewHeight.constant = height - offset;
        }
    }
    
    CGFloat scale = 0.7 + 0.3 * (height -64)/(100-64);
    self.imageWidth.constant = 50*scale;
    
    
}
@end
