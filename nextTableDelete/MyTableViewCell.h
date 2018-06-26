//
//  MyTableViewCell.h
//  tableviewcelldelete
//
//  Created by Administrator on 2018/6/7.
//  Copyright © 2018年 match. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell

@property (weak, nonatomic) UITableView * tableview;//父视图tableview
-(void)hideButtonsWithAnimation;
@end
