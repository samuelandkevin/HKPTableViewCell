//
//  TableViewController.m
//  delete2
//
//  Created by kun on 16/6/10.
//  Copyright © 2016年 kun. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<UITableViewDataSource,UITableViewDelegate>{
    ScrollDirection _scrollDirection;
    CGFloat _lastPositionY;
}
@property (nonatomic,strong) UITableView *tableview;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableview.delegate =self;
    _tableview.dataSource = self;
    _tableview.separatorStyle =
    UITableViewCellSeparatorStyleNone;

    [self.view addSubview:_tableview];
     _tableview.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 30;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId2"];
    if (!cell) {
         cell = [[UITableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId2"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    if (indexPath.row%2==0) {
        cell.backgroundColor = [UIColor purpleColor];
    }
    else{
        cell.backgroundColor = [UIColor greenColor];
    }
    
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}




- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
 
//        NSLog(@"%f",scrollView.contentOffset.y);
    int currentPositionY = scrollView.contentOffset.y;
    
    if (currentPositionY - _lastPositionY > 0 && currentPositionY >0 ) {
        _scrollDirection = ScrollDirection_Up;
    }
    else if(_lastPositionY - currentPositionY > 0 && currentPositionY < 0){
        _scrollDirection = ScrollDirection_Down;
    }
     _lastPositionY = currentPositionY;
    
    if (self.contentOffset) {
        self.contentOffset(currentPositionY,_scrollDirection);
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}

-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{

}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView;{
    return YES;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
