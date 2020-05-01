//
//  LocationViewController.m
//  DaumMapLibrarySample_iOS
//
//  Created by Ethan on 2014. 9. 17..
//
//

#import "LocationViewController.h"
#import "SDKDemoAPIKey.h"


@interface LocationViewController () {
    MTMapView *_mapView;
    BOOL isCustomLocationMarkerUsing;
}

@end


@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isCustomLocationMarkerUsing = NO;
    
    // create mapView
    _mapView = [[MTMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [_mapView setDaumMapApiKey:kAPIKey];
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
    [actionSheet addButtonWithTitle:@"Location"];
    [actionSheet addButtonWithTitle:@"Reverse Geo-Coding"];
    
    [actionSheet setCancelButtonIndex:0];
    [actionSheet showInView:self.view];
    
}

#pragma mark -
#pragma mark UIAcitonSheet delegate

enum {
    ALERT_VEW_TAG_FOR_LOCATION = 500
};

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            // noop.
        }
            break;
            
        case 1: {
            NSString *locationMarkerTypeTitle = [NSString stringWithFormat:@"%@ %@",isCustomLocationMarkerUsing ? @"Default" : @"Custom", @"Location Marker"];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Location"
                                                                message:nil
                                                               delegate:self
                                                      cancelButtonTitle:@"취소"
                                                      otherButtonTitles:@"User Location On", @"User Location On, MapMoving Off", @"User Location+Heading On", @"User Location+Heading On, MapMoving Off", @"Off", locationMarkerTypeTitle, @"Show Location Marker", @"Hide Location Marker", nil];
            alertView.delegate = self;
            alertView.tag = ALERT_VEW_TAG_FOR_LOCATION;
            [alertView show];
        }
            break;
            
        case 2: {
            MTMapReverseGeoCoderCompletionHandler handler = ^(BOOL success, NSString *addressForMapPoint, NSError *error) {
                if (success) {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"DaumMapSample"
                                                                        message:addressForMapPoint
                                                                       delegate:nil
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil];
                    [alertView show];
                    
                } else {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"DaumMapSample"
                                                                        message:[NSString stringWithFormat:@"Reverse Geo-Coding Failed with Error : %@", error.localizedDescription]
                                                                       delegate:nil
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil];
                    [alertView show];
                }
            };
            
            [MTMapReverseGeoCoder executeFindingAddressForMapPoint:_mapView.mapCenterPoint
                                                        openAPIKey:kAPIKey
                                                 completionHandler:handler];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == ALERT_VEW_TAG_FOR_LOCATION) {
        switch (buttonIndex) {
            case 1: {
                [_mapView setCurrentLocationTrackingMode:MTMapCurrentLocationTrackingOnWithoutHeading];
            }
                break;
                
            case 2: {
                [_mapView setCurrentLocationTrackingMode:MTMapCurrentLocationTrackingOnWithoutHeadingWithoutMapMoving];
            }
                break;
                
            case 3: {
                [_mapView setCurrentLocationTrackingMode:MTMapCurrentLocationTrackingOnWithHeading];
            }
                break;
                
            case 4: {
                [_mapView setCurrentLocationTrackingMode:MTMapCurrentLocationTrackingOnWithHeadingWithoutMapMoving];
            }
                break;
                
            case 5: {
                [_mapView setCurrentLocationTrackingMode:MTMapCurrentLocationTrackingOff];
            }
                break;
                
            case 6: {
                if (isCustomLocationMarkerUsing) {
                    [_mapView setShowCurrentLocationMarker:YES];
                    [_mapView updateCurrentLocationMarker:nil];
                    isCustomLocationMarkerUsing = !isCustomLocationMarkerUsing;
                    
                } else {
                    MTMapLocationMarkerItem *makerItem = [MTMapLocationMarkerItem mapLocationMarkerItem];
                    makerItem.customImageName = @"custom_map_present.png";
                    makerItem.customImageAnchorPointOffset = MTMapImageOffsetMake(27, 27);
                    makerItem.customTrackingImageName = @"custom_map_present_tracking.png";
                    makerItem.customTrackingImageAnchorPointOffset = MTMapImageOffsetMake(22, 22);
                    makerItem.customDirectionImageName = @"custom_map_present_direction.png";
                    makerItem.customDirectionImageAnchorPointOffset = MTMapImageOffsetMake(130, 130);
                    makerItem.radius = 100.0f;
                    makerItem.strokeColor = [UIColor blueColor];
                    makerItem.fillColor = [UIColor colorWithRed:0.0f green:0.0f blue:1.0f alpha:0.5];
                    
                    [_mapView updateCurrentLocationMarker:makerItem];
                    isCustomLocationMarkerUsing = !isCustomLocationMarkerUsing;
                }
            }
                break;
                
            case 7: {
                _mapView.showCurrentLocationMarker = YES;
            }
                break;
                
            case 8: {
                _mapView.showCurrentLocationMarker = NO;
                
            }
                break;
                
            default:
                break;
        }
    }
}

@end
