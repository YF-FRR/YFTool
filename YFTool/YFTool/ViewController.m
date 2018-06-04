//
//  ViewController.m
//  YFTool
//
//  Created by ios_yangfei on 2018/4/20.
//  Copyright © 2018年 YF_Coder. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *toolListArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    self.navigationItem.title = @"YFToolList";
}

-(void)setUpView{

    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64) style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    tableView.estimatedRowHeight = 100;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.backgroundColor=[UIColor whiteColor];
    tableView.showsVerticalScrollIndicator=NO;
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.toolListArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID=@"YFTool";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    NSDictionary *dic = self.toolListArr[indexPath.row];
    cell.textLabel.text = dic[@"Title"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.toolListArr[indexPath.row];
    NSString *vcName = dic[@"VC"];
    [self.navigationController pushViewController:[NSClassFromString(vcName) new] animated:YES];
}

#pragma mark ====== 获取数据 =======
-(NSArray *)toolListArr{
    if (_toolListArr==nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ToolList.plist" ofType:nil];
        _toolListArr=[[NSArray alloc] initWithContentsOfFile:path];
    }
    return _toolListArr;
}

@end
