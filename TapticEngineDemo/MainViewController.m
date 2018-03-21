//
//  MainViewController.m
//  TapticEngineDemo
//
//  Created by heweihua on 2018/3/19.
//  Copyright © 2018年 heweihua. All rights reserved.
//

#import "MainViewController.h"
#import <AudioToolbox/AudioServices.h>

@interface MainViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>

@property(nonatomic, strong) UITableView* tableView;
@property(nonatomic, strong) NSMutableArray* tableDataArr;
@end

@implementation MainViewController

-(instancetype) init{
    
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"物理触觉(Haptic)";
    [self loadData];
    [self initTableView];
    
    /*
     iOS中关于Taptic-Engine震动反馈的深入解析
     https://www.jianshu.com/p/d4567dbd7dde
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadData {
    
    // Custom initialization
    _tableDataArr = [[NSMutableArray alloc] init];
    
    GroupEntity* group0 = [[GroupEntity alloc] init];
    group0.title = @"AudioServicesPlaySystemSound";
    
    ItemEntity* entity0 = [[ItemEntity alloc] init];
    entity0.title = @"kSystemSoundID_Vibrate";// AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    entity0.subTitle = @"普通震动";
    
    ItemEntity* entity1 = [[ItemEntity alloc] init];
    entity1.title = @"1519";
    entity1.subTitle = @"普通短震，3D Touch 中 Peek 震动反馈";
    
    ItemEntity* entity2 = [[ItemEntity alloc] init];
    entity2.title = @"1520";
    entity2.subTitle = @"普通短震，3D Touch 中 Pop 震动反馈";
    
    ItemEntity* entity3 = [[ItemEntity alloc] init];
    entity3.title = @"1521";
    entity3.subTitle = @"连续三次短震";
    
    [group0.list addObject:entity0];
    [group0.list addObject:entity1];
    [group0.list addObject:entity2];
    [group0.list addObject:entity3];
    
    GroupEntity* group1 = [[GroupEntity alloc] init];
    group1.title = @"UIImpactFeedbackGenerator(for iphone7 ios 10)";
    
    ItemEntity* entity10 = [[ItemEntity alloc] init];
    entity10.title = @"UIImpactFeedbackStyleLight";// AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    entity10.subTitle = @"微弱短振";
    
    ItemEntity* entity11 = [[ItemEntity alloc] init];
    entity11.title = @"UIImpactFeedbackStyleMedium";
    entity11.subTitle = @"中等短振";
    
    ItemEntity* entity12 = [[ItemEntity alloc] init];
    entity12.title = @"UIImpactFeedbackStyleHeavy";
    entity12.subTitle = @"明显短振";
    
    [group1.list addObject:entity10];
    [group1.list addObject:entity11];
    [group1.list addObject:entity12];
    
    
    GroupEntity* group2 = [[GroupEntity alloc] init];
    group2.title = @"AudioServicesPlaySystemSound";
    
    //1003
    for (int i = 1000; i < 2000; ++i) {
        
        ItemEntity* entity = [[ItemEntity alloc] init];
        entity.title = @(i).stringValue;
        [group2.list addObject:entity];
    }
    
    [_tableDataArr addObject:group0];
    [_tableDataArr addObject:group1];
    [_tableDataArr addObject:group2];
}



// init UITableView
-(void) initTableView{
    
    CGRect rect = CGRectMake(0.0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.sectionHeaderHeight = 0.f;
    _tableView.sectionFooterHeight = 0.f;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
//    UIView *headerView = [[UIView alloc] init];
//    headerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 64.0f);
//    _tableView.tableHeaderView = headerView;
    
    UIView *footView = [[UIView alloc]init];
    footView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 20.0f);
    _tableView.tableFooterView = footView;
}




#pragma mark - UITableViewDelegate && UITableViewDataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [_tableDataArr count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    GroupEntity *group = [_tableDataArr objectAtIndex:section];
    return group.height;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    GroupEntity *group = [_tableDataArr objectAtIndex:section];
    static NSString *reuseId = @"UITableViewHeaderFooterView";
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseId];
    if (!headerView)
        headerView = [[UITableViewHeaderFooterView alloc] initWithReuseIdentifier:reuseId];
    //    [headerView.contentView setBackgroundColor:[UIColor clearColor]];
    headerView.textLabel.text = group.title;
    return headerView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    GroupEntity *group = [_tableDataArr objectAtIndex:section];
    return group.list.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GroupEntity *group = [_tableDataArr objectAtIndex:indexPath.section];
    ItemEntity* entity = [group.list objectAtIndex:indexPath.row];
    return entity.height;
}


-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GroupEntity *group = [_tableDataArr objectAtIndex:indexPath.section];
    ItemEntity* entity = [group.list objectAtIndex:indexPath.row];
    static NSString *cellId = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    cell.textLabel.text = entity.title;
    cell.detailTextLabel.text = entity.subTitle;
    return cell;
}


#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GroupEntity *group = [_tableDataArr objectAtIndex:indexPath.section];
    ItemEntity* entity = [group.list objectAtIndex:indexPath.row];
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
                }
                    break;
                case 1:
                {
                    AudioServicesPlaySystemSound(1519);
                }
                    break;
                case 2:
                {
                    AudioServicesPlaySystemSound(1520);
                }
                    break;
                case 3:
                {
                    AudioServicesPlaySystemSound(1521);
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                {
                    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleLight];
                    [generator prepare];
                    [generator impactOccurred];
                }
                    break;
                case 1:
                {
                    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleMedium];
                    [generator prepare];
                    [generator impactOccurred];
                }
                    break;
                case 2:
                {
                    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle: UIImpactFeedbackStyleHeavy];
                    [generator prepare];
                    [generator impactOccurred];
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2:
        {
            
            AudioServicesPlaySystemSound([entity.title integerValue]);
        }
            break;
            
        default:
            break;
    }
}

@end




