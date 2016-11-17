//
//  choosematters2.m
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/5/4.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import "choosematters2.h"
#import "datasearchcell.h"
#import "setnumber2.h"
#import "AppDelegate.h"


@interface choosematters2 ()
{
    
    NSIndexPath *tag2;
    NSInteger *tagrow2;
    NSString *tagrowstr2;
    NSString *matterchosenname2;
    NSString *matterchosenstate2;
    NSString *matterchosenH2;
    NSString *matterchosenS2;
    NSString *matterchosenG2;
    NSArray *mattergroup2;

}
@end
@implementation choosematters2


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchbar setShowsScopeBar:NO];
    [self.searchbar sizeToFit];
    NSBundle *bundle = [NSBundle mainBundle];
    
    NSURL *plistURL = [bundle URLForResource:@"datalist" withExtension:@"plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    
    NSMutableArray *tmpDataArray = [[NSMutableArray alloc] init];
    
    for (int i=0; i<[dictionary count]; i++)
    {
        NSString *key = [[NSString alloc] initWithFormat:@"matter%i", i+1];
        NSDictionary *tmpDic = [dictionary objectForKey:key];
        [tmpDataArray addObject:tmpDic];
    }
    
    self.dataList = [tmpDataArray copy];
    
    
}


- (void)viewDidUnload
{
    [self setSearchbar:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark Content Filtering
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSUInteger)scope;
{
    
    if([searchText length]==0)
    {
        //查询所有
        self.dataList = [NSMutableArray arrayWithArray:self.dataList];
        return;
    }
}

#pragma mark --UITableViewDataSource 协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataList count];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableIdentifierOne=@"TableIdentifierOne";
    
    BOOL hasLoad = NO;
    
    if (!hasLoad) {
        UINib *nib = [UINib nibWithNibName:@"datasearchcell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:TableIdentifierOne];
        hasLoad = YES;
    }
    
    
    datasearchcell *cell = [tableView dequeueReusableCellWithIdentifier:TableIdentifierOne];
    
    NSUInteger row=[indexPath row];
    NSDictionary *rowDate=[self.dataList objectAtIndex:row];
    
    cell.matterstring = [rowDate objectForKey:@"mattername"];
    cell.statestring = [rowDate objectForKey:@"state"];
    cell.Hstring = [rowDate objectForKey:@"H"];
    cell.Sstring = [rowDate objectForKey:@"S"];
    cell.Gstring = [rowDate objectForKey:@"G"];
    
    return cell;
    
}


#pragma mark --UISearchBarDelegate 协议方法
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    // 当点击取消按钮，查询所有
    [self filterContentForSearchText:@"" scope:-1];
}

#pragma mark - UISearchDisplayController Delegate Methods
- (BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // 当文本内容发生改变时候，向表视图数据源发出重新加载消息
    [self filterContentForSearchText:searchString scope:self.searchbar.selectedScopeButtonIndex];
    //YES情况下表视图可以重新加载
    return YES;
}



- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tag2) {
        
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:tag2];
        
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    
    tag2 = indexPath;
  
    tagrow2 = tag2.row + 1;
    tagrowstr2 = [NSString stringWithFormat: @"%d", tagrow2];
    
    NSLog(@"%@",tag2);
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"datalist" withExtension:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSString *name = [@"matter" stringByAppendingString:tagrowstr2];
    matterchosenname2 = [[dictionary objectForKey:name] objectForKey:@"mattername"];
    matterchosenstate2 = [[dictionary objectForKey:name] objectForKey:@"state"];
    matterchosenH2 = [[dictionary objectForKey:name] objectForKey:@"H"];
    matterchosenS2 = [[dictionary objectForKey:name] objectForKey:@"S"];
    matterchosenG2 = [[dictionary objectForKey:name] objectForKey:@"G"];

    
    mattergroup2= @[matterchosenname2,matterchosenstate2,matterchosenH2,matterchosenS2,matterchosenG2];
    
    AppDelegate *myDelegate2 = [[UIApplication sharedApplication] delegate];
    myDelegate2.matterchosenin2 = mattergroup2;
    
    UIViewController *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"setnumber2"];
    [self.navigationController pushViewController:vc2 animated:YES];
    
    
    return nil;

}



@end
