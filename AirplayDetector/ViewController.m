//
//  ViewController.m
//  AirplayDetector
//
//  Created by Thanh Thuat on 2017/03/03.
//  Copyright © 2017 Thanh Thuat. All rights reserved.
//

#import "ViewController.h"
@import MediaPlayer;

@interface ViewController (){
    MPVolumeView *volumeView;
    id routerController;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupAirplayMonitoring];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupAirplayMonitoring
{
    routerController = [NSClassFromString(@"MPAVRoutingController") new];
    [routerController setValue:self forKey:@"delegate"];
    [routerController setValue:[NSNumber numberWithLong:2] forKey:@"discoveryMode"];
    
    CGRect rect;
    rect = self.view.frame;
    rect.origin.x = rect.origin.y = 0;
    
    volumeView = [[MPVolumeView alloc] initWithFrame:rect];
    [volumeView setShowsVolumeSlider:NO];
    [self.view addSubview:volumeView];
    
}

-(void)routingControllerAvailableRoutesDidChange:(id)arg{
    
    NSArray *availableRoutes = [routerController valueForKey:@"availableRoutes"];
    for (id router in availableRoutes) {
        NSString *routerName = [router valueForKey:@"routeName"];
        NSLog(@"routername -%@",routerName);
    }
    
}


@end
