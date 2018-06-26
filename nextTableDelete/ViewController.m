//
//  ViewController.m
//  nextTableDelete
//
//  Created by Administrator on 2018/6/25.
//  Copyright © 2018年 match. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import <objc/runtime.h>

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.view.backgroundColor =  [UIColor colorWithRed:213.0/255.0 green:213.0/255.0 blue:213.0/255.0 alpha:1.0];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate= self;
    self.tableView.dataSource = self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 78;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * header = [[UIView alloc]init];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    MyTableViewCell *currentCell = objc_getAssociatedObject(self.tableView, @"currentCell");
    if (currentCell != nil) {
        [currentCell hideButtonsWithAnimation];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.tableview = tableView;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
