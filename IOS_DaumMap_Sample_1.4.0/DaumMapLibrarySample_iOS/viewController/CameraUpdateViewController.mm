//
//  CameraUpdateViewController.m
//  DaumMapLibrarySample_iOS
//
//  Created by Ethan on 2014. 9. 17..
//
//

#import "CameraUpdateViewController.h"

@interface CameraUpdateViewController () {
    MTMapView *_mapView;
}

@property (nonatomic, strong) MTMapPoint *mapPoint1;
@property (nonatomic, strong) MTMapPoint *mapPoint2;
@property (nonatomic, strong) MTMapPOIItem *POIItem1;
@property (nonatomic, strong) MTMapPOIItem *POIItem2;

@end


@implementation CameraUpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create mapView
    _mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    
    // created poiItems
    self.mapPoint1 = [MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(37.537229, 127.005515)];
    self.POIItem1 =  [MTMapPOIItem poiItem];
    self.POIItem1.markerType = MTMapPOIItemMarkerTypeBluePin;
    self.POIItem1.mapPoint = self.mapPoint1;
    [_mapView addPOIItem:self.POIItem1];
    
    self.mapPoint2 = [MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(37.4020737, 127.1086766)];
    self.POIItem2 =  [MTMapPOIItem poiItem];
    self.POIItem1.markerType = MTMapPOIItemMarkerTypeYellowPin;
    self.POIItem2.mapPoint = self.mapPoint2;
    [_mapView addPOIItem:self.POIItem2];
    
    // add navigation right bar button
    UIBarButtonItem *rightBarButtonItem =  [[UIBarButtonItem alloc] initWithTitle:@"메뉴"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(_onClickMenuButton:)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
}

- (void)viewWillDisappear:(BOOL)animated {
    if (_mapView != nil) {
        _mapView = nil;
    }
}

#pragma mark -
#pragma mark Event Handlers

- (void)_onClickMenuButton:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
    actionSheet.delegate = self;
    [actionSheet addButtonWithTitle:@"취소"];
    [actionSheet addButtonWithTitle:@"Point 1"];
    [actionSheet addButtonWithTitle:@"Point 2, Zoom Lv 7"];
    [actionSheet addButtonWithTitle:@"Point 1, Diameter"];
    [actionSheet addButtonWithTitle:@"Bounds, Padding"];
    [actionSheet addButtonWithTitle:@"Bounds, Padding, Zoom min/max"];
    [actionSheet setCancelButtonIndex:0];
    [actionSheet showInView:self.view];
    
}

#pragma mark -
#pragma mark Private methods

- (void)_move {
    MTMapCameraUpdate *camera = [MTMapCameraUpdate move:self.mapPoint1];
    [_mapView animateWithCameraUpdate:camera];
}

- (void)_moveWithZoomLevel {
    MTMapCameraUpdate *camera = [MTMapCameraUpdate move:self.mapPoint2 withZoomLevel:7];
    [_mapView animateWithCameraUpdate:camera];
}

- (void)_moveWithDiameter {
    MTMapCameraUpdate *camera = [MTMapCameraUpdate move:self.mapPoint2 withDiameter:500];
    [_mapView animateWithCameraUpdate:camera];
}

- (void)_fitWithBounds {
    MTMapBoundsRect *mapBounds= [MTMapBoundsRect boundsRect];
    mapBounds.bottomLeft = self.mapPoint1;
    mapBounds.topRight = self.mapPoint2;
    
    MTMapCameraUpdate *camera = [MTMapCameraUpdate fitMapViewWithMapBounds:mapBounds
                                                               withPadding:100];
    [_mapView animateWithCameraUpdate:camera];
}

- (void)_fitWithBoundsAndZoomLevels {
    MTMapBoundsRect *mapBounds= [MTMapBoundsRect boundsRect];
    mapBounds.bottomLeft = self.mapPoint1;
    mapBounds.topRight = self.mapPoint2;
    
    MTMapCameraUpdate *camera = [MTMapCameraUpdate fitMapViewWithMapBounds:mapBounds
                                                               withPadding:100
                                                          withMinZoomLevel:3
                                                          withMaxZoomLevel:7];
    [_mapView animateWithCameraUpdate:camera];
}

#pragma mark -
#pragma mark UIActionSheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            // noop.
        }
            break;
            
        case 1: {
            [self _move];
        }
            break;
            
        case 2: {
            [self _moveWithZoomLevel];
        }
            break;
            
        case 3: {
            [self _moveWithDiameter];
        }
            break;
            
        case 4: {
            [self _fitWithBounds];
        }
            break;
            
        case 5: {
            [self _fitWithBoundsAndZoomLevels];
        }
            break;
            
        default:
            break;
    }
}

@end
