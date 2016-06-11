//
//  ViewController.h
//  tabl
//
//  Created by arthadmin on 01/06/16.
//  Copyright © 2016 arthadmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *textName;

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

