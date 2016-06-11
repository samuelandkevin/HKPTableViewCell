//
//  TableViewController.h
//  delete2
//
//  Created by kun on 16/6/10.
//  Copyright © 2016年 kun. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(int,ScrollDirection){
    ScrollDirection_Up = 1,
    ScrollDirection_Down
} ;
@interface TableViewController : UIViewController
@property (nonatomic,copy)void(^contentOffset)(CGFloat  contentOffsetY,ScrollDirection direction);
@property (nonatomic,copy)void(^scrollEnd)(BOOL scrollEnd);
@end
