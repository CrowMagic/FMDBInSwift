//
//  ViewController.swift
//  FMDBInSwift
//
//  Created by 李 宇亮 on 16/9/5.
//  Copyright © 2016年 NightWatcher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let db = AddressTool()
        db.initDB()
        
        let item = Address()
        item.name = "testName1"
        item.phone = "testPhone1"
        item.selectLocation = "testSelectLocation1"
        item.address = "testAddress1"
        item.postcode = "testPostcode1"
        item.currentAddress = "testCurrentAddress1"
//        db.insert(item)
        
//        db.delete(item)
//        db.update(item)
        let result = db.query()
//        print(result?.name)
        result!.detailLog()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

