//
//  ViewController.m
//  FaceDemo
//
//  Created by ifenghui on 2018/5/16.
//  Copyright © 2018年 ifenghui. All rights reserved.
//

#import "ViewController.h"

#import "FRCameraManager.h"

@interface ViewController ()<FRCameraManagerDelegate>
@property (strong, nonatomic) FRCameraManager *manager;
@property (strong, nonatomic) UIView *pickView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefault];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (![self.manager.session isRunning]) {
        [self.manager.session startRunning];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.manager.session isRunning]) {
        [self.manager.session stopRunning];
    }
}

#pragma mark - Methods
- (UIView *)pickView {
    if (!_pickView) {
        _pickView = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_pickView];
    }
    return _pickView;
}

- (void)setDefault {
    FRCameraManager *manager = [[FRCameraManager alloc] initWithParentView:self.pickView];
    manager.delegate = self;
    manager.canFaceRecognition = YES;
    [manager setFaceRecognitonCallBack:^(CGRect faceFrame) {
        NSLog(@"你的脸在%@",NSStringFromCGRect(faceFrame));
    }];
    self.manager = manager;
}
#pragma mark - FRCameraManagerDelegate
- (void)cameraDidFinishFocus {
    
}

- (void)cameraDidStareFocus {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
