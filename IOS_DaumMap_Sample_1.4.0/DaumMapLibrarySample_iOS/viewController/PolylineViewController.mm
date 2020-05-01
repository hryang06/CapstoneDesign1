//
//  PolylineViewController.m
//  DaumMapLibrarySample_iOS
//
//  Created by Ethan on 2014. 9. 16..
//
//

#import "PolylineViewController.h"

@interface PolylineViewController () {
    MTMapView *_mapView;
}

@end


@implementation PolylineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create _mapView
    _mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [self.view addSubview:_mapView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"메뉴"
                                                                              style:UIBarButtonItemStylePlain target:self action:@selector(_onClickMenuButton:)];
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
    [actionSheet addButtonWithTitle:@"Add Polyline1"];
    [actionSheet addButtonWithTitle:@"Add Polyline2"];
    [actionSheet addButtonWithTitle:@"Remove All Polylines"];
    [actionSheet addButtonWithTitle:@"Add Circle"];
    [actionSheet addButtonWithTitle:@"Remove All Circles"];
    
    [actionSheet setCancelButtonIndex:0];
    [actionSheet showInView:self.view];
}

#pragma mark -
#pragma mark Private methods

enum {
    VIEW_TAG_START_MARKER = 1000,
    VIEW_TAG_END_MARKER
};

- (void)_addPolyline1 {
    MTMapPolyline* polyline1 = [MTMapPolyline polyLine];
    polyline1.polylineColor = [UIColor colorWithRed:1.0f green:0.2f blue:0.0f alpha:0.5f];
    [polyline1 addPoint:[MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(37.537229,127.005515)]];
    [polyline1 addPoint:[MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(37.545024,127.03923)]];
    [polyline1 addPoint:[MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(37.527896,127.036245)]];
    [polyline1 addPoint:[MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(37.541889,127.095388)]];
    
    [_mapView addPolyline:polyline1];
    [_mapView fitMapViewAreaToShowPolyline:polyline1];
}

- (void)_addPolyline2 {
    MTMapPOIItem* startPOIItem = [MTMapPOIItem poiItem];
    startPOIItem.itemName = @"출발";
    startPOIItem.tag = VIEW_TAG_START_MARKER;
    startPOIItem.mapPoint = [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(475334.0,1101210.0)];
    startPOIItem.markerType = MTMapPOIItemMarkerTypeCustomImage;
    startPOIItem.showAnimationType = MTMapPOIItemShowAnimationTypeSpringFromGround;
    startPOIItem.customImageName = @"custom_poi_marker_start.png";
    startPOIItem.customImageAnchorPointOffset = MTMapImageOffsetMake(42,2);
    
    MTMapPOIItem* endPOIItem = [MTMapPOIItem poiItem];
    endPOIItem.itemName = @"도착";
    endPOIItem.tag = VIEW_TAG_END_MARKER;
    endPOIItem.mapPoint = [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(485016.0,1118034.0)];
    endPOIItem.markerType = MTMapPOIItemMarkerTypeCustomImage;
    endPOIItem.showAnimationType = MTMapPOIItemShowAnimationTypeSpringFromGround;
    endPOIItem.customImageName = @"custom_poi_marker_end.png";
    endPOIItem.customImageAnchorPointOffset = MTMapImageOffsetMake(42,2);
    
    [_mapView addPOIItems:[NSArray arrayWithObjects:startPOIItem, endPOIItem, nil]];
    
    MTMapPolyline* polyline2 = [MTMapPolyline polyLine];
    polyline2.polylineColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.8f];
    [polyline2 addPoints:[NSArray arrayWithObjects:
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(475334.0,1101210.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(474300.0,1104123.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(473873.0,1105377.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(473302.0,1107097.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(473126.0,1109606.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(473063.0,1110548.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(473435.0,1111020.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(474068.0,1111714.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(475475.0,1112765.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(476938.0,1113532.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(478725.0,1114391.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(479453.0,1114785.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(480145.0,1115145.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(481280.0,1115237.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(481777.0,1115164.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(482322.0,1115923.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(482832.0,1116322.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(483384.0,1116754.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(484401.0,1117547.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(484893.0,1117930.0)],
                          [MTMapPoint mapPointWithWCONG:MTMapPointPlainMake(485016.0,1118034.0)],
                          nil]];
    [_mapView addPolyline:polyline2];
    [_mapView fitMapViewAreaToShowPolyline:polyline2];
}

- (void)_addCircle {
    MTMapCircle *circle = [MTMapCircle circle];
    circle.circleCenterPoint = [MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(37.537094, 127.005470)];
    circle.circleLineColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.5];
    circle.circleFillColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.5];
    circle.circleRadius = 500;
    
    [_mapView addCircle:circle];
    [_mapView fitMapViewAreaToShowCircle:circle];
}

- (void)_removePreviousMarkers {
    MTMapPOIItem* prevStartPOIItem = [_mapView findPOIItemByTag:VIEW_TAG_START_MARKER];
    if (prevStartPOIItem != nil) {
        [_mapView removePOIItem:prevStartPOIItem];
    }
    
    MTMapPOIItem* prevEndPOIItem = [_mapView findPOIItemByTag:VIEW_TAG_END_MARKER];
    if (prevEndPOIItem != nil) {
        [_mapView removePOIItem:prevEndPOIItem];
    }
}

#pragma mark -
#pragma mark UIAcitonSheet delegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            // noop.
        }
            break;
            
        case 1: {
            [_mapView removeAllPolylines];
            
            [self _addPolyline1];
        }
            break;
            
        case 2: {
            [self _removePreviousMarkers];
            [_mapView removeAllPolylines];
            
            [self _addPolyline2];
        }
            break;
            
        case 3: {
            [self _removePreviousMarkers];
            [_mapView removeAllPolylines];
        }
            break;
            
        case 4: {
            [self _addCircle];
        }
            break;
            
        case 5: {
            [_mapView removeAllCircles];
        }
            
        default:
            break;
    }
}

@end
