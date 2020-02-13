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
    func gotoVC(){
        let vc = qlView
        let rootVC = UIApplication.shared.keyWindow?.rootViewController
        vc.modalPresentationStyle = .fullScreen
        rootVC?.present(vc, animated: true, completion: nil)
        vcDismiss.state = false
    }
    
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
            gotoVC()
        } else {
            fatalError("VTARQuickLook => 3D Model is not available")
        }
    }
    
    @available(iOS 12.0, *)
    @objc
    func downloadFileAndGo(_ url: String){
        
        let fm = FileManager.default
        let url = URL(string: url)
        let modelName = url!.deletingPathExtension().lastPathComponent
        let cacheDir = try! fm.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let downloadLocation = cacheDir.appendingPathComponent("ARModel").appendingPathComponent("\(modelName).usdz")
        
        // Download file to Cache Directory
        // START DOWNLOAD
        //    print("VTARQuickLook => Downloading 3D Model")
        
        do {
            
            let data  = try Data(contentsOf: url!)
            
            if !model.isAvailable {
                print("VTARQuickLook => Model not Available, proceed to download")
                print("VTARQuickLook => Downloading 3D Model")
                try data.write(to: downloadLocation, options: .atomic)
            } else {
                print("VTARQuickLook => Model available, proceed to go to VC")
            }
            
            // Set model url to download location
            model.URL = downloadLocation
            
            // Set model availability to true
            model.isAvailable = true
            
        } catch {
            fatalError("VTARQuickLook => Cannot download file to directory")
        }
        
        // END DOWNLOAD
        print("VTARQuickLook => 3D Model Downloading Finished")
        
        gotoVC()
    }
    
    @objc
    func isARSupported(_ callback: RCTResponseSenderBlock){
        let a = util.isARSupportedDict()
        callback([a])
    }
    
    @objc
    func allowsContentScaling(_ boolean: Bool) {
        model.allowsContentScaling = boolean
        print("VTARQuickLook => Allows content scaling = \(model.contentScaling)")
    }
    
    @objc
    static func canonicalWebPageURL(_ url: String){
        model.canonicalWebPageURL = url
        print("VTARQuickLook => Canonical Web Page URL = \(model.canonicalWebPageURL)")
    }

    @objc
    static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
}
