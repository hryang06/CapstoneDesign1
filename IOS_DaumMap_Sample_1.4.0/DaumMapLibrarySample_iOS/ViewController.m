//
//  ViewController.m
//  DaumMapLibrarySample_iOS
//
//  Created by ParkYoungjoo on 2014. 9. 15..
//
//

#import "ViewController.h"
#import "SampleMapViewController.h"
#import "SampleMarkerViewController.h"
#import "PolylineViewController.h"
#import "LocationViewController.h"
#import "CameraUpdateViewController.h"
#import "EventViewController.h"


@interface ViewController () {
    NSArray *_sampleList;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"모여봐요 동네카페", nil);
    
    _sampleList = [[NSArray alloc] initWithObjects:@{@"Title":@"동네 카페", @"Subtitle":@"거리순, 가격순"},
                  @{@"Title":@"동네 카페2", @"Subtitle":@"거리순, 아메리카순"},
                  @{@"Title":@"Polyline,Polygon", @"Subtitle":@"지도 위 그래픽 요소 그리기"},
                  @{@"Title":@"Location", @"Subtitle":@"위치 관련 API"},
                  @{@"Title":@"Camera", @"Subtitle":@"카메라 관련 API"},
                  @{@"Title":@"Events", @"Subtitle":@"지도 이벤트"}, nil];
    
}

#pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_sampleList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sampleCell"];
    
    if (cell != nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"sampleCell"];
    }
    cell.textLabel.text = [[_sampleList objectAtIndex:indexPath.row] objectForKey:@"Title"];
    cell.detailTextLabel.text = [[_sampleList objectAtIndex:indexPath.row] objectForKey:@"Subtitle"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0: {
            SampleMapViewController *viewController = [[SampleMapViewController alloc] init];
            viewController.title = [[_sampleList objectAtIndex:indexPath.row] objectForKey:@"Title"];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case 1: {
            SampleMarkerViewController *viewController = [[SampleMarkerViewController alloc] init];
            viewController.title = [[_sampleList objectAtIndex:indexPath.row] objectForKey:@"Title"];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case 2: {
            PolylineViewController *viewController = [[PolylineViewController alloc] init];
            viewController.title = [[_sampleList objectAtIndex:indexPath.row] objectForKey:@"Title"];
            [self.navigationController pushViewController:viewController animated:YES];
            break;
        }
        case 3: {
            LocationViewController *viewController = [[LocationViewController alloc] init];
            viewController.title = [[_sampleList objectAtIndex:indexPath.row] objectForKey:@"Title"];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
        case 4: {
            CameraUpdateViewController *viewController = [[CameraUpdateViewController alloc] init];
            viewController.title = [[_sampleList objectAtIndex:indexPath.row] objectForKey:@"Title"];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
            
        case 5: {
            EventViewController *viewController = [[EventViewController alloc] init];
            viewController.title = [[_sampleList objectAtIndex:indexPath.row] objectForKey:@"Title"];
            [self.navigationController pushViewController:viewController animated:YES];
        }
            break;
    }
}

@end
