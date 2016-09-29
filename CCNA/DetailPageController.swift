//
//  DetailPageController.swift
//  CCNA
//
//  Created by tuannv on 9/29/16.
//  Copyright © 2016 vn.test. All rights reserved.
//

import Foundation
import UIKit

class DetailPageController: UIViewController {
    var source : SRCContent!
    var webView : UIWebView!
    
     init(sourceURL: SRCContent)  {
        
        super.init(nibName: nil, bundle: nil)
        
        self.source = sourceURL
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = UIWebView(frame: self.view.bounds)
        self.view.addSubview(webView)
        
        let sourceBundleURL = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource(source.url, ofType: nil, inDirectory:"Content")!)
        
        webView.autoresizingMask = [.FlexibleWidth , .FlexibleHeight]
        
        self.view.addSubview(webView)
        
        
        webView.loadRequest(NSURLRequest(URL: sourceBundleURL))
        
        
    }
    
    
    
}