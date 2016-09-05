//
//  DBModel.swift
//  FMDBInSwift
//
//  Created by 李 宇亮 on 16/9/5.
//  Copyright © 2016年 NightWatcher. All rights reserved.
//

import UIKit


class Address {
    var name = ""
    var phone = ""
    var selectLocation = ""
    var address = ""
    var postcode = ""
    var currentAddress = ""
    var recordIDNumber = ""
    func detailLog() {
        print(name, phone, selectLocation, address, postcode, currentAddress)
    }
}