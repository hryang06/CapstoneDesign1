//
//  MapPOIDetailViewController.m
//  MobileMap
//
//  Created by Byung-Wan Lim on 2/15/12.
//  Copyright (c) 2012 Daum Communications. All rights reserved.
//

#import "MapPOIDetailViewController.h"


@implementation MapPOIDetailViewController

- (id)initWithMapPOIItem:(MTMapPOIItem*)poiItem {
    self = [super init];
    if (self) {
		_poiItem = poiItem;
    }
    return self;
}


- (void)_onCloseTouched {	
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.view setBackgroundColor:[UIColor whiteColor]];
	
	UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, CGRectGetWidth(self.view.frame) - 40, 30)];
	label.text = [NSString stringWithFormat:@"POI Name : %@", _poiItem.itemName];
	[self.view addSubview:label];
	
    UIImage *bgImg = [UIImage imageNamed:@"btn_bg.png"];
    UIImage *resizableBgImg = [bgImg resizableImageWithCapInsets:UIEdgeInsetsMake(0, 20, 0, 20) resizingMode:UIImageResizingModeStretch];
	UIButton* closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	closeButton.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 120, CGRectGetMaxY(label.frame) + 10, 100, 38);
    closeButton.adjustsImageWhenHighlighted = NO;
	[closeButton setTitle:@"닫기" forState:UIControlStateNormal];
	[closeButton addTarget:self action:@selector(_onCloseTouched) forControlEvents:UIControlEventTouchUpInside];
    [closeButton setBackgroundImage:resizableBgImg forState:UIControlStateNormal];
	[self.view addSubview:closeButton];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation == UIDeviceOrientationPortrait);
}

@end
