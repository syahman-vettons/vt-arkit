//
//  Utilities.swift
//  VtarKit
//
//  Created by Muhammad Syahman on 11/02/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import ARKit

var util = Utilities()

class Utilities {
  
  /// Check if ARKit is supported, return a Dictionary
  func isARSupportedDict() -> Dictionary<String,Any> {
    guard #available(iOS 12.0, *) else {
      return ["supported":false,"message":"This device is not using iOS 12 and above"]
    }
    if ARConfiguration.isSupported {
      return ["supported":true,"message":"AR is supported in this device"]
    } else {
      return ["supported":false,"message":"AR is not supported in this device"]
    }
  }
  
}

struct model {
  /// Model availability
  static var isAvailable: Bool = false
  
  /// Model URL
  static var URL: URL!
  
  /// Model Name
  static var modelName: NSString = "modelName"
}


struct vcDismiss {
  /// Model Name
  static var state : Bool = false
}

