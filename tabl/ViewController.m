//
//  ViewController.m
//  tabl
//
//  Created by arthadmin on 01/06/16.
//  Copyright © 2016 arthadmin. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>

@interface ViewController ()
{
    NSMutableArray *Name;
    NSMutableArray *temp;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    Name = [[NSMutableArray alloc]initWithObjects:@"Hardik Sharma",@"Kaushik Prajapati",@"Sohil Jadav",@"Keyur Nimavat",@"Nikumbh Pavan",@"Rashmita Padhiyar", nil];
    
    temp = [[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return Name.count;
}
- (IBAction)ClickAction:(id)sender
{
    self.tableview.hidden =NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSString *name = [Name objectAtIndex:indexPath.row];
    
    if ([temp containsObject:name])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *name = [Name objectAtIndex:indexPath.row];
    
    if ([temp containsObject:name])
    {
        [temp removeObject:name];
    }
    else
    {
        [temp addObject:name];
    }
    self.textName.text = [temp componentsJoinedByString:@", "];
    self.tableview.hidden = YES;
}
- (IBAction)PhassetAction:(id)sender
{
    NSMutableArray *_assets = [NSMutableArray new];
    
    PHFetchOptions *fetchOptions = [PHFetchOptions new];
    
    PHFetchResult *fr = [PHAssetCollection fetchMomentsWithOptions:fetchOptions];
    for (PHAssetCollection *collection in fr) {
        
        PHFetchResult *_fr = [PHAsset fetchAssetsInAssetCollection:collection options:fetchOptions];
        for (PHAsset *asset in _fr) {
            
            [_assets addObject:asset];
            
        }
        
        
    }
    
 /*   PHFetchOptions *fetchOptions = [PHFetchOptions new];
    fetchOptions.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:NO]];
    fetchOptions.fetchLimit = 1;
    PHFetchResult *fetchResult = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:fetchOptions];
    PHAsset *lastImageAsset = [fetchResult firstObject];
    
    [[PHImageManager defaultManager]requestImageForAsset:lastImageAsset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeDefault options:nil resultHandler:^(UIImage *result, NSDictionary *info){
        if ([info objectForKey:PHImageErrorKey] == nil && ![[info objectForKey:PHImageResultIsDegradedKey] boolValue]) {
           
            self.imageView.image = result;
        }
    }];
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
