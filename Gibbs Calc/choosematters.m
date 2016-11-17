//
//  choosematters.m
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/5/2.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import "choosematters.h"
#import "datasearchcell.h"
#import "setnumber.h"
#import "AppDelegate.h"

@interface choosematters ()
{
    
    NSIndexPath *tag;
    NSInteger *tagrow;
    NSString *tagrowstr;
    NSString *matterchosenname;
    NSString *matterchosenstate;
    NSString *matterchosenH;
    NSString *matterchosenS;
    NSString *matterchosenG;
    NSArray *mattergroup;
}
@end

@implementation choosematters

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.searchBar setShowsScopeBar:NO];
    [self.searchBar sizeToFit];
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
    [self setSearchBar:nil];
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
    [self filterContentForSearchText:searchString scope:self.searchBar.selectedScopeButtonIndex];
    //YES情况下表视图可以重新加载
    return YES;
}



- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tag) {
        
        UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:tag];
        
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    tag = indexPath;
    tagrow = tag.row + 1;
    tagrowstr = [NSString stringWithFormat: @"%d", tagrow];
    
    NSLog(@"%@",tag);
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"datalist" withExtension:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:plistURL];
    NSString *name = [@"matter" stringByAppendingString:tagrowstr];
    matterchosenname = [[dictionary objectForKey:name] objectForKey:@"mattername"];
    matterchosenstate = [[dictionary objectForKey:name] objectForKey:@"state"];
    matterchosenH = [[dictionary objectForKey:name] objectForKey:@"H"];
    matterchosenS = [[dictionary objectForKey:name] objectForKey:@"S"];
    matterchosenG = [[dictionary objectForKey:name] objectForKey:@"G"];

    
    mattergroup= @[matterchosenname,matterchosenstate,matterchosenH,matterchosenS,matterchosenG];
    

    AppDelegate *myDelegate1 = [[UIApplication sharedApplication] delegate];
    myDelegate1.matterchosenin1 = mattergroup;
    

    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"setnumber"];
    [self.navigationController pushViewController:vc animated:YES];


    return nil;
}




@end
