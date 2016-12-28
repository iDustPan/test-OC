//
//  XBorderPreferentialPoliciesPickerCell.m
//  iOSClient
//
//  Created by 徐攀 on 2016/12/28.
//  Copyright © 2016年 borderxlab. All rights reserved.
//

#import "XBorderPreferentialPoliciesPickerCell.h"

@interface XBorderPreferentialPoliciesPickerCell ()

@property (nonatomic, strong) UIButton *checkButton;

@property (nonatomic, strong) UILabel *activityLabel;

@property (nonatomic, strong) UILabel *policiesDetailLabel;

@property (nonatomic, strong) UILabel *policiesOverviewLabel;

@property (nonatomic, strong) UIView *grayLine;

@end

@implementation XBorderPreferentialPoliciesPickerCell

static const CGFloat kCheckButtonSize = 18;


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (void)updateCell:(id)model
{
    self.activityLabel.text = @"多买多折";
    self.policiesOverviewLabel.text = @"已购买¥30，还差¥70";
    self.policiesDetailLabel.text = @"购买YSL满¥24赠豪华中样一件，满¥50再获赠7件套，满¥75再获赠两件套";
}

- (void)updateConstraints
{
    [self.checkButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(21);
        make.top.mas_equalTo(12);
        make.size.mas_equalTo(CGSizeMake(kCheckButtonSize, kCheckButtonSize));
    }];
    
    [self.activityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12);
        make.left.equalTo(self.checkButton.mas_right).offset(15);
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(24);
    }];
    
    [self.policiesOverviewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.activityLabel);
        make.right.mas_equalTo(-21);
    }];
    
    [self.policiesDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.activityLabel.mas_bottom).offset(12);
        make.left.equalTo(self.activityLabel);
        make.right.equalTo(self.policiesOverviewLabel);
    }];
    
    [self.grayLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.policiesDetailLabel.mas_bottom).offset(12);
        make.left.equalTo(self.checkButton);
        make.right.equalTo(self.policiesOverviewLabel);
        make.height.mas_equalTo(1);
        make.bottom.lessThanOrEqualTo(self.contentView);
    }];
    

    [super updateConstraints];
}

#pragma mark - touchAction

- (void)checkButtonTouchAction:(UIButton *)sender
{
    sender.selected = !sender.selected;
}


#pragma mark - setter/getter

- (UIButton *)checkButton
{
    if (!_checkButton) {
        _checkButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_checkButton addTarget:self action:@selector(checkButtonTouchAction:) forControlEvents:UIControlEventTouchUpInside];
        [_checkButton setImage:[UIImage imageNamed:@"checkout_checkbox_off"] forState:UIControlStateNormal];
        [_checkButton setImage:[UIImage imageNamed:@"checkout_checkbox_on"] forState:UIControlStateSelected];
        [_checkButton setSelected:NO];
        [self.contentView addSubview:_checkButton];
    }
    return _checkButton;
}

- (UILabel *)activityLabel
{
    if (!_activityLabel) {
        _activityLabel = [[UILabel alloc] init];
        _activityLabel.font = [UIFont systemFontOfSize:14];
        _activityLabel.backgroundColor = [UIColor lightGrayColor];
        _activityLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_activityLabel];
    }
    return _activityLabel;
}

- (UILabel *)policiesOverviewLabel
{
    if (!_policiesOverviewLabel) {
        _policiesOverviewLabel = [[UILabel alloc] init];
        _policiesOverviewLabel.font = [UIFont systemFontOfSize:14];
        _policiesOverviewLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_policiesOverviewLabel];
    }
    return _policiesOverviewLabel;
}

- (UILabel *)policiesDetailLabel
{
    if (!_policiesDetailLabel) {
        _policiesDetailLabel = [[UILabel alloc] init];
        _policiesDetailLabel.numberOfLines = 0;
        _policiesDetailLabel.textColor = [UIColor lightGrayColor];
        _policiesDetailLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_policiesDetailLabel];
    }
    return _policiesDetailLabel;
}

- (UIView *)grayLine
{
    if (!_grayLine) {
        _grayLine = [UIView new];
        _grayLine.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_grayLine];
    }
    return _grayLine;
}

@end









