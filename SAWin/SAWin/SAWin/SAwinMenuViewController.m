//
//  SAwinMenuViewController.m
//  SAWin
//
//  Created by Niraj Gat on 8/7/17.
//  Copyright © 2017 Naveed Shaikh. All rights reserved.
//

#import "SAwinMenuViewController.h"
#import "MenuCollectionViewCell.h"

@interface SAwinMenuViewController ()

@property (nonatomic,strong) NSArray *menuItemsArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation SAwinMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self readMenuItemsFromPlist];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Misclenious Functions

- (void)readMenuItemsFromPlist{
    NSString *plistFilePath = [[NSBundle mainBundle]pathForResource:@"SAwinMenuItems" ofType:@"plist"];
    self.menuItemsArray = [NSArray arrayWithContentsOfFile:plistFilePath];
    [self.collectionView reloadData];
}


#pragma mark - Collection view data source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.menuItemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{ 
    
    MenuCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MenuCell" forIndexPath:indexPath];
    
    NSDictionary *menuComponentDictonary = [self.menuItemsArray objectAtIndex:indexPath.row];
    
    // configure the cell
    [cell.menuLabel setText:[menuComponentDictonary objectForKey:@"Caption"]];
    
    [cell.imageView setImage:[UIImage imageNamed:[menuComponentDictonary objectForKey:@"Icon"]]];
    
    cell.layer.cornerRadius = 10;
    
    
    return cell;
    
}
#pragma mark -
#pragma mark UICollection View Delegates

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *menuComponentDictonary = [self.menuItemsArray objectAtIndex:indexPath.row];
    int componentSeletced =[[menuComponentDictonary objectForKey:@"ComponentID"]intValue];
    
    switch (componentSeletced) {
        case 0:
        {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ServiceMaster" bundle:[NSBundle mainBundle]];
            UIViewController *viewServiceMastersViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewServiceMastersViewController"];
            
            [self.navigationController pushViewController:viewServiceMastersViewController animated:YES];
        }
            break;
        case 1:
        {
//            [self performSegueWithIdentifier:@"CreateSM" sender:self];
            NSLog(@"Cell clicked");
        }
            break;
            
        case 2:
        {
//            UIStoryboard *techCallsStoryboard = [UIStoryboard storyboardWithName:@"TechCalls" bundle:[NSBundle mainBundle]];
//            UIViewController *assignedUnassignedCallsViewController = [techCallsStoryboard instantiateViewControllerWithIdentifier:@"AssignedUnassignedCallsView"];
//            [self.navigationController pushViewController:assignedUnassignedCallsViewController animated:YES];
            
            NSLog(@"Cell clicked");
        }
            break;
            
        case 4:
        {
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MostUsedList" bundle:[NSBundle mainBundle]];
//            UIViewController *MostUsedListView = [storyboard instantiateViewControllerWithIdentifier:@"MostUsedList"];
//            
//            [self.navigationController pushViewController:MostUsedListView animated:YES];
            
            NSLog(@"Cell clicked");
            
        }
            break;
            
        case 5:
        {
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Timecard" bundle:[NSBundle mainBundle]];
//            UIViewController *MostUsedListView = [storyboard instantiateViewControllerWithIdentifier:@"TimecardVCIdentifier"];
//            
//            [self.navigationController pushViewController:MostUsedListView animated:YES];
            NSLog(@"Cell clicked");
            
        }
            break;
            
        case 7:
        {
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"TrainingVideos" bundle:[NSBundle mainBundle]];
//            UIViewController *TrainingVideosViewController = [storyboard instantiateViewControllerWithIdentifier:@"TrainingVideos"];
//            
//            [self.navigationController pushViewController:TrainingVideosViewController animated:YES];
            NSLog(@"Cell clicked");
        }
            break;
            
        case 12:
        {
//            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MyTeam" bundle:[NSBundle mainBundle]];
//            UIViewController *myTeamView = [storyboard instantiateViewControllerWithIdentifier:@"MyTeamView"];
//            
//            [self.navigationController pushViewController:myTeamView animated:YES];
            NSLog(@"Cell clicked");
        }
            break;

            
        default:
            break;
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
