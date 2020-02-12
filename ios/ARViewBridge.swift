//
//  ARViewBridge.swift
//  VtarKit
//
//  Created by Muhammad Syahman on 11/02/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation

@objc(ARView)
class ARViewBridge: NSObject {
  
  @available(iOS 12.0, *)
  @objc
  func display(_ url: String){
    print("VTARQuickLook => Display initiate")
    
    let fileUrl = URL(fileURLWithPath: "\(url)")
    let modelName = fileUrl.deletingPathExtension().lastPathComponent
    let fm = FileManager.default
    
    if fm.fileExists(atPath: fileUrl.path) {
      print("VTARQuickLook => File Exist")
      print("VTARQuickLook => Setting the URL, Model Name and Model availability")
      model.URL = fileUrl
      model.modelName = modelName as NSString
      model.isAvailable = true
    } else {
      print("VTARQuickLook => File not available")
      model.isAvailable = false
    }
    
    if model.isAvailable {
      
//      guard let vc: UIViewController = UIStoryboard(name: "ARView", bundle: nil).instantiateInitialViewController() else {return}
      let vc = qlView
      let rootVC = UIApplication.shared.keyWindow?.rootViewController
      vc.modalPresentationStyle = .fullScreen
      rootVC?.present(vc, animated: true, completion: nil)
      vcDismiss.state = false
      //    util.rootViewController().present(vc, animated: true, completion: nil)
    } else {
      fatalError("VTARQuickLook => 3D Model is not available")
//      RNEventEmitter.sharedInstance.dispatch(name: "error", body: ["type": "model", "message": "3D Model is not available"])
    }
  }
  
  
  
  @objc
  func isARSupported(_ callback: RCTResponseSenderBlock){
    let a = util.isARSupportedDict()
    callback([a])
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
}
