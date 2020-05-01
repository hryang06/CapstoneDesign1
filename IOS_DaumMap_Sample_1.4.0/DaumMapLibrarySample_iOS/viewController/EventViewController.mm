//
//  EventViewController.m
//  DaumMapLibrarySample_iOS
//
//  Created by Ethan on 2014. 9. 17..
//
//

#import "EventViewController.h"

@interface EventViewController () {
    MTMapView *_mapView;
}

@property (nonatomic, strong) UILabel *eventResultLabel;

@end


@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create mapView
    _mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    _mapView.delegate = self;
    [_mapView setDaumMapApiKey:kAPIKey];
    [self.view addSubview:_mapView];
    
    UIToolbar *eventResultView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 40)];
    eventResultView.barStyle = UIBarStyleDefault;
    eventResultView.translucent = YES;
    [self.view addSubview:eventResultView];
    
    _eventResultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, eventResultView.frame.size.width, eventResultView.frame.size.height)];
    _eventResultLabel.font = [UIFont systemFontOfSize:10.0];
    _eventResultLabel.backgroundColor = [UIColor clearColor];
    _eventResultLabel.textAlignment = NSTextAlignmentCenter;
    [eventResultView addSubview:_eventResultLabel];
}

- (void)viewWillDisappear:(BOOL)animated {
    if (_mapView != nil) {
        _mapView = nil;
    }
}

#pragma mark -
#pragma mark MTMapView delegate

- (void)MTMapView:(MTMapView *)mapView openAPIKeyAuthenticationResultCode:(int)resultCode resultMessage:(NSString *)resultMessage {
    NSLog(@"%s", __FUNCTION__);
}

- (void)MTMapView:(MTMapView *)mapView finishedMapMoveAnimation:(MTMapPoint *)mapCenterPoint {
    NSLog(@"%s", __FUNCTION__);
}

- (void)MTMapView:(MTMapView *)mapView centerPointMovedTo:(MTMapPoint *)mapCenterPoint {
    [self.eventResultLabel setText:[NSString stringWithFormat:@"Camera Position: lat:%f, lng: %f", mapCenterPoint.mapPointGeo.latitude, mapCenterPoint.mapPointGeo.longitude]];
}

- (void)MTMapView:(MTMapView *)mapView zoomLevelChangedTo:(MTMapZoomLevel)zoomLevel {
    MTMapPointGeo mapPointGeo = mapView.mapCenterPoint.mapPointGeo;
    [self.eventResultLabel setText:[NSString stringWithFormat:@"Camera Position: lat:%f, lng: %f ZoomLevel: %d", mapPointGeo.latitude, mapPointGeo.longitude, zoomLevel]];
}

- (void)MTMapView:(MTMapView *)mapView dragStartedOnMapPoint:(MTMapPoint *)mapPoint {
    [self.eventResultLabel setText:[NSString stringWithFormat:@"Drag Started Position: lat:%f, lng: %f", mapPoint.mapPointGeo.latitude, mapPoint.mapPointGeo.longitude]];
}

- (void)MTMapView:(MTMapView *)mapView dragEndedOnMapPoint:(MTMapPoint *)mapPoint {
    [self.eventResultLabel setText:[NSString stringWithFormat:@"Drag Ended Position: lat:%f, lng: %f", mapPoint.mapPointGeo.latitude, mapPoint.mapPointGeo.longitude]];
}

- (void)MTMapView:(MTMapView *)mapView singleTapOnMapPoint:(MTMapPoint *)mapPoint {
    [self.eventResultLabel setText:[NSString stringWithFormat:@"Single Tapped Position: lat:%f, lng: %f", mapPoint.mapPointGeo.latitude, mapPoint.mapPointGeo.longitude]];
}

- (void)MTMapView:(MTMapView *)mapView doubleTapOnMapPoint:(MTMapPoint *)mapPoint {
    [self.eventResultLabel setText:[NSString stringWithFormat:@"Double Tapped Position: lat:%f, lng: %f", mapPoint.mapPointGeo.latitude, mapPoint.mapPointGeo.longitude]];
}

- (void)MTMapView:(MTMapView *)mapView longPressOnMapPoint:(MTMapPoint *)mapPoint {
    [self.eventResultLabel setText:[NSString stringWithFormat:@"Long Pressed, Position: lat:%f, lng: %f", mapPoint.mapPointGeo.latitude, mapPoint.mapPointGeo.longitude]];
}

@end
