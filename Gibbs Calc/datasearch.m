//
//  datasearch.m
//  Gibbs Calc
//
//  Created by 孙何岚峰 on 16/4/19.
//  Copyright © 2016年 KKSun. All rights reserved.
//

#import "datasearch.h"
#import "datasearchcell.h"

@interface datasearch ()

@end

@implementation datasearch

@synthesize list;
@synthesize dataList;
@synthesize bar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    //NSArray *array = [[dictionary objectForKey:@"matter1"] objectForKey:@"mattername"];
    //self.bar = array;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
   
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    self.list = nil;
    self.dataList = nil;
}


//#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
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


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

- (NSIndexPath *)tableView:(UITableView *)tableView
  willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

/*- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return bar;
}
*/
@end
