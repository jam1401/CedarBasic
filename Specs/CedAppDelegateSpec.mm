#import <Cedar-iOS/Cedar-iOS.h>
#import "CedAppDelegate.h"
#import "CedViewController.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(CedAppDelegateSpec)

describe(@"CedAppDelegate", ^{
    __block CedAppDelegate *model;
    __block BOOL launchedSuccessfully;

    beforeEach(^{
      model = [[CedAppDelegate alloc] init];
    });
  
  context(@"when the app finishes launching", ^{
    beforeEach(^{
      launchedSuccessfully = [model application:nil didFinishLaunchingWithOptions:nil];
    });
    
    it(@"launched successfully", ^{
      launchedSuccessfully should be_truthy;
    });
    
    it(@"has a window", ^ {
      model.window should be_instance_of([UIWindow class]);
    });
    
    it(@"window is the size of the screen", ^{
      float screenHeight = [[UIScreen mainScreen]bounds].size.height;
      float screenWidth = [[UIScreen mainScreen] bounds].size.width;
      model.window.frame.size.height should equal(screenHeight);
      model.window.frame.size.width should equal(screenWidth);
    });
    
    it(@"makes the window visible", ^{
      model.window.keyWindow should be_truthy;
    });
    
    it(@"has the correct root controller", ^{
      model.window.rootViewController should be_instance_of([CedViewController class]);
    });
  });
  
});

SPEC_END
