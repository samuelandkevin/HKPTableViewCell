//
//  ViewController.m
//  delete2
//
//  Created by kun on 16/6/9.
//  Copyright © 2016年 kun. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    CGFloat _curContentOffsetY;
}
@property (strong, nonatomic)  UITableView *tableview;
@property (nonatomic,strong)   TableViewController *vc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    self.tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    [self.view addSubview:self.tableview];
    _tableview.scrollsToTop = NO;
    
    
    _vc = [[TableViewController alloc] init];
    __weak typeof(self)weakSelf = self;
    _tableview.backgroundColor = [UIColor orangeColor];
    [_vc setContentOffset:^(CGFloat contentOffsetY, ScrollDirection direction) {
        if (direction == ScrollDirection_Up && contentOffsetY <=200 && contentOffsetY >=_curContentOffsetY) {
          
            weakSelf.tableview.contentOffset = CGPointMake(0, contentOffsetY);
        
          
        }
        else if(direction == ScrollDirection_Down && contentOffsetY <= 0 )
        {
            weakSelf.tableview.contentOffset = CGPointMake(0, 0);
        }
        
    }];

    [self addChildViewController:_vc];
   
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {

        return [UIScreen mainScreen].bounds.size.height ;
    }
    else
        return 100.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 2)
    {
         UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId1"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId1"];
            cell.backgroundColor = [UIColor yellowColor];
            
            [cell.contentView addSubview:_vc.view];
           
        }

         return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
            cell.contentView.backgroundColor = [UIColor blueColor];
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"section %ld",indexPath.section];
         return cell;
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _curContentOffsetY = scrollView.contentOffset.y;
}

@end
