//
//  ViewController.m
//  RainbowTable
//
//  Created by Rockstar. on 3/16/15.
//  Copyright (c) 2015 Fantastik. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property NSMutableArray *colors;
@property IBOutlet UITableView *colorTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.colors = [NSMutableArray arrayWithObjects:
                   [UIColor redColor],
                   [UIColor orangeColor],
                   [UIColor yellowColor],
                   [UIColor greenColor],
                   [UIColor blueColor],
                   [UIColor colorWithRed:0.29 green:0.00 blue:0.51 alpha:1.00],
                   [UIColor purpleColor],
                   nil];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColorCell"];
    cell.textLabel.text = [NSString stringWithFormat:@"Row: %li", indexPath.row];
    cell.backgroundColor = [self.colors objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Actions
- (IBAction)onAddRandomColor:(id)sender {
    CGFloat red = (float)rand()/RAND_MAX;
    CGFloat green = (float)rand()/RAND_MAX;
    CGFloat blue = (float)rand()/RAND_MAX;
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    [self.colors addObject:newColor];
    [self.colorTableView reloadData];
}

@end
