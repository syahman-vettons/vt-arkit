//
//  ARViewBridge.m
//  VtarKit
//
//  Created by Muhammad Syahman on 11/02/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridge.h>



@interface RCT_EXTERN_MODULE(ARView, NSObject);

RCT_EXTERN_METHOD(display:(String)url)
RCT_EXTERN_METHOD(downloadFileAndGo:(String)url)
RCT_EXTERN_METHOD(isARSupported:(RCTResponseSenderBlock)callback)

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

@end
