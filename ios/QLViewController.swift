//
//  QLViewController.swift
//  VtarKit
//
//  Created by Muhammad Syahman on 11/02/2020.
//  Copyright © 2020 Facebook. All rights reserved.
//

import UIKit
import QuickLook
import ARKit

@available(iOS 12.0, *)
var qlView = QLViewController()

@available(iOS 12.0, *)
class QLViewController: UIViewController, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    
    //    let remoteURL = URL(string:"https://73442b2c.ngrok.io/GrowNGo.usdz")
    var fileURL : URL?
    let fm = FileManager()
    
    
    override func viewWillAppear(_ animated: Bool) {
        //        checkFile()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        previewController.delegate = self
        
        func showAR() {
            print("VTARQuickLook => Showing AR")
            if QLPreviewController.canPreview(model.URL as QLPreviewItem) {
                present(previewController, animated: true, completion: nil)
            }
        }
        
        if !vcDismiss.state {
            if fm.fileExists(atPath: model.URL.path){
                print("VTARQuickLook => File exist at ==")
                print(model.URL.path)
                showAR()
            } else {
                fatalError("VTARQuickLook => File not exist")
            }
        }
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        1
    }
    
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        dismissScreen()
        print("VTARQuickLook => Dismiss QLPreviewController")
    }
    
    func dismissScreen() {
        
        self.dismiss(animated: true, completion: nil)
        vcDismiss.state = true
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        if #available(iOS 13, *) {
            let arItem = ARQuickLookPreviewItem(fileAt: model.URL)
            arItem.allowsContentScaling = model.allowsContentScaling
            arItem.canonicalWebPageURL = URL(string: "\(model.canonicalWebPageURL)")
            return arItem
        } else {
            let arItem = model.URL
            return arItem! as QLPreviewItem
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
