//
//  ViewController.swift
//  CCNA
//
//  Created by tuannv on 9/29/16.
//  Copyright © 2016 vn.test. All rights reserved.
//

import UIKit

struct SRCContent {
    var description : String
    var url  : String
}

extension UIViewController {
    
    func setTitleNav(title: String)  {
        self.title = title
    }
    
}

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var webView : UIWebView!
    var tableView : UITableView!
    
    let data = [
        SRCContent.init(description: "Bố cục nhiếp ảnh cơ bản", url: "bocucnhiepanhcoban.html"),
        SRCContent.init(description: "Các kỹ thuật chụp ảnh thường gặp ", url: "cackythuatchupanhthuonggap.html"),
        SRCContent.init(description: "Các loại máy ảnh DSLR thông dụng", url: "cacloaimayanhdslrthongdung.html"),
        SRCContent.init(description: "Các thể loại nhiếp ảnh cơ bản", url: "cactheloainhiepanhcoban.html"),
        SRCContent.init(description: "Các thuật ngữ trên máy ảnh KTS", url: "cacthuatngutrenmayanhkts.html"),
        SRCContent.init(description: "DOF và các yếu tố ảnh hưởng", url: "dofvacacyeutoanhhuong.html"),
        SRCContent.init(description: "Kiến thức nhiếp ảnh cơ bản ", url: "kienthucnhiepanhcoban.html"),
        ]
    
    let cellIdentifier : String = "cellIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView = UITableView(frame: self.view.frame)
        
        
        tableView.autoresizingMask = [.FlexibleWidth , .FlexibleHeight];
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier )
        
        self.view.addSubview(tableView)
        
        self.setTitleNav("CCNA")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK Table
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        //
        let  cellData = data[indexPath.row] ;
        cell.textLabel?.text = cellData.description
        //
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let  cellData = data[indexPath.row] ;
        let detailPage : DetailPageController = DetailPageController(sourceURL: cellData)
        
        self.navigationController?.pushViewController(detailPage, animated: true)

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    
}

