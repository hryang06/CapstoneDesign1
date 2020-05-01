//
//  SampleMarkerViewController.m
//  DaumMapLibrarySample_iOS
//
//  Created by Ethan on 2014. 9. 16..
//
//

#import "SampleMarkerViewController.h"
#import "MapPOIDetailViewController.h"


@interface SampleMarkerViewController () {
    MTMapView *_mapView;
}

@property (nonatomic, strong) MTMapPOIItem *poiItem1;
@property (nonatomic, strong) MTMapPOIItem *poiItem2;

@end



@implementation SampleMarkerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // create mapView
    _mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    _mapView.delegate = self;
    [_mapView setDaumMapApiKey:kAPIKey];
    [self.view addSubview:_mapView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"메뉴"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(_onClickMenuButton:)];
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
    [actionSheet addButtonWithTitle:@"DefaultMarker"];
    [actionSheet addButtonWithTitle:@"CustomMarker"];
    [actionSheet addButtonWithTitle:@"ShowAll"];
    
    [actionSheet setCancelButtonIndex:0];
    [actionSheet showInView:self.view];
}

#pragma mark -
#pragma mark Private methods

- (void)_showDefaultMarker {
    _poiItem1 = [MTMapPOIItem poiItem];
    _poiItem1.itemName = @"Default Marker";
    _poiItem1.markerType = MTMapPOIItemMarkerTypeRedPin;
    _poiItem1.showDisclosureButtonOnCalloutBalloon = YES;
    _poiItem1.markerSelectedType = MTMapPOIItemMarkerSelectedTypeRedPin;
    _poiItem1.showAnimationType = MTMapPOIItemShowAnimationTypeDropFromHeaven;
    _poiItem1.mapPoint = [MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(37.402110, 127.108451)];
    
    [_mapView addPOIItem:_poiItem1];
    [_mapView fitMapViewAreaToShowMapPoints:@[self.poiItem1.mapPoint]];
}

- (void)_showCustomMarker {
    _poiItem2 = [MTMapPOIItem poiItem];
    _poiItem2.itemName = @"다음커뮤니케이션";
    _poiItem2.markerType = MTMapPOIItemMarkerTypeCustomImage;
    _poiItem2.customImageName = @"map_pin_custom.png";
    _poiItem2.mapPoint = [MTMapPoint mapPointWithGeoCoord:MTMapPointGeoMake(37.537229,127.005515)];
    _poiItem2.showAnimationType = MTMapPOIItemShowAnimationTypeSpringFromGround;
    _poiItem2.customImageName = @"custom_poi_marker.png";
    _poiItem2.markerSelectedType = MTMapPOIItemMarkerSelectedTypeCustomImage;
    _poiItem2.customSelectedImageName = @"custom_poi_marker_selected.png";
    _poiItem2.customImageAnchorPointOffset = MTMapImageOffsetMake(30,0);
    _poiItem2.customCalloutBalloonView = [[[NSBundle mainBundle] loadNibNamed:@"CustomCalloutBalloonView_IlshinBuilding" owner:self options:nil] lastObject];
    
    [_mapView addPOIItem:_poiItem2];
    [_mapView selectPOIItem:_poiItem2 animated:YES];
}

- (void)_showAllMarkers {
    [self _showDefaultMarker];
    [self _showCustomMarker];
    
    MTMapBoundsRect *bounds = [MTMapBoundsRect boundsRect];
    bounds.bottomLeft = self.poiItem1.mapPoint;
    bounds.topRight = self.poiItem2.mapPoint;
    
    float padding = 50;
    MTMapCameraUpdate *cameraUpdate = [MTMapCameraUpdate fitMapViewWithMapBounds:bounds withPadding:padding];
    [_mapView animateWithCameraUpdate:cameraUpdate];
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
            [self _showDefaultMarker];
        }
            break;
            
        case 2: {
            [self _showCustomMarker];
        }
            break;
            
        case 3:{
            [self _showAllMarkers];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark MTMapView delegate

- (void)MTMapView:(MTMapView *)mapView touchedCalloutBalloonOfPOIItem:(MTMapPOIItem *)poiItem {
    if (poiItem == self.poiItem1) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"DaumMapSample"
                                                            message:@"Touched the callout-balloon of item1"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [alertView show];
        
    } else if (poiItem == self.poiItem2) {
        MapPOIDetailViewController* poiDetailViewController = [[MapPOIDetailViewController alloc] initWithMapPOIItem:poiItem];
        [self presentViewController:poiDetailViewController animated:YES completion:nil];
    }
}

@end

