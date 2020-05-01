//
//  SampleMapViewController.m
//  DaumMapLibrarySample_iOS
//
//  Created by ParkYoungjoo on 2014. 9. 15..
//
//

#import "SampleMapViewController.h"

@interface SampleMapViewController () {
    MTMapView *_mapView;
    BOOL isMapRotationUsing;
}

@end


@implementation SampleMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isMapRotationUsing = NO;
    
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
    [actionSheet addButtonWithTitle:@"MapType"];
    [actionSheet addButtonWithTitle:@"Move"];
    
    [actionSheet setCancelButtonIndex:0];
    [actionSheet showInView:self.view];
}

#pragma mark -
#pragma mark MapType

- (void)mapType:(MTMapType)type {
    _mapView.baseMapType = type;
}

- (void)setHDMapTile:(BOOL)tileMode {
    _mapView.useHDMapTile = tileMode;
}

#pragma mark -
#pragma mark UIAcitonSheet delegate

enum {
    ALERT_VIEW_TAG_FOR_MAP_TYPE,
    ALERT_VIEW_TAG_FOR_MAP_MOVEMENT
};

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0: {
            // noop.
        }
            break;
            
        case 1: {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"MapType"
                                                                message:nil
                                                               delegate:self
                                                      cancelButtonTitle:@"취소"
                                                      otherButtonTitles:@"Standard", @"Satellite", @"Hybrid", @"HD Map Tile Off", @"Clear Map Tile Cache", nil];
            alertView.tag = ALERT_VIEW_TAG_FOR_MAP_TYPE;
            alertView.delegate = self;
            [alertView show];
        }
            break;
            
        case 2: {
            NSString *rotatitonMenuTitle = isMapRotationUsing ? @"Unrotate Map" : @"Rotate Map 60";
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Move"
                                                                message:nil
                                                               delegate:self
                                                      cancelButtonTitle:@"취소"
                                                      otherButtonTitles:@"Move to", @"Zoom to", @"Move and Zoom to", @"Zoom in", @"Zoom out", rotatitonMenuTitle, nil];
            alertView.tag = ALERT_VIEW_TAG_FOR_MAP_MOVEMENT;
            alertView.delegate = self;
            [alertView show];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (alertView.tag == ALERT_VIEW_TAG_FOR_MAP_TYPE) {
        switch (buttonIndex) {
            case 1:
                [self mapType:MTMapTypeStandard];
                break;
            case 2:
                [self mapType:MTMapTypeSatellite];
                break;
            case 3:
                [self mapType:MTMapTypeHybrid];
                break;
            case 4:
                [self setHDMapTile:NO];
                break;
            case 5:
                [MTMapView clearMapTilePersistentCache];
                break;
                
            default:
                break;
        }
        
    } else if (alertView.tag == ALERT_VIEW_TAG_FOR_MAP_MOVEMENT) {
        switch (buttonIndex) {
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                [_mapView zoomInAnimated:YES];
                break;
            case 5:
                [_mapView zoomOutAnimated:YES];
            case 6: {
                if (!isMapRotationUsing) {
                    [_mapView setMapRotationAngle:60.0 animated:YES];
                    isMapRotationUsing = YES;
                    
                } else {
                    [_mapView setMapRotationAngle:0.0 animated:YES];
                    isMapRotationUsing = NO;
                }
            }
                break;
            default:
                break;
        }
    }
}

@end
