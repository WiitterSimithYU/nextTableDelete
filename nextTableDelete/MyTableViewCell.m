//
//  MyTableViewCell.m
//  tableviewcelldelete
//
//  Created by Administrator on 2018/6/7.
//  Copyright © 2018年 match. All rights reserved.
//

#import "MyTableViewCell.h"
#import <objc/runtime.h>

#define DELETEWIDTH 70.0

@interface MyTableViewCell ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (strong, nonatomic) IBOutlet UIView *detailView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *deleteLeftLayout;

@end


@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.myScrollView.delegate = self;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self didBeginMove];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    CGPoint point = scrollView.contentOffset;
    if (point.x > DELETEWIDTH / 2) {
        self.deleteLeftLayout.constant = -3;
        [self layoutIfNeeded];
        [scrollView setContentOffset:CGPointMake(DELETEWIDTH -3 , 0) animated:YES];
        self.detailView.layer.cornerRadius = 0;
    }else{
        self.deleteLeftLayout.constant = 0;
        [self layoutIfNeeded];
        [scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        self.detailView.layer.cornerRadius = 5;
    }
}

-(void)didBeginMove{
    if (self.tableview) {
        MyTableViewCell *currentCell = objc_getAssociatedObject(self.tableview, @"currentCell");
        
        if (currentCell != self && currentCell != nil) {
            [currentCell hideButtonsWithAnimation];
        }
        objc_setAssociatedObject(self.tableview, @"currentCell", self, OBJC_ASSOCIATION_ASSIGN);
    }
}

-(void)hideButtonsWithAnimation{
    [self.myScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    self.detailView.layer.cornerRadius = 5;
    self.deleteLeftLayout.constant = 0;
    [self layoutIfNeeded];
}

@end
