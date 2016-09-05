//
//  DBTool.swift
//  FMDBInSwift
//
//  Created by 李 宇亮 on 16/9/5.
//  Copyright © 2016年 NightWatcher. All rights reserved.
//

import Foundation

class AddressTool {
    
    var dbGlobal: FMDatabase!
    
    func getPathString() -> String {
        let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        let addressPath = path.stringByAppendingString("/address.sqlite")
        print(addressPath)
        return addressPath
    }
    
    func initDB() {
        let str = getPathString()
        let db = FMDatabase(path: str)
        dbGlobal = db
        guard db.open() else { return }
        if !db.tableExists("addressTable") {
            let isOK = db.executeUpdate("create table addressTable (addressID integer primary key autoincrement, name text, phone text, selectLocation text, address text, postcode text, currentAddress text)", withArgumentsInArray: nil)
            let status = isOK ? "success" : "fail"
            print("create addressTable \(status)")
        }
        db.close()
    }
    
    func insert(item: Address) {
        guard dbGlobal.open() else { return }
        let isOK = dbGlobal.executeUpdate("insert into addressTable (name, phone, selectLocation, address, postcode, currentAddress) values (?, ?, ?, ?, ?, ?)", withArgumentsInArray: [item.name, item.phone, item.selectLocation, item.address, item.postcode, item.currentAddress])
        let status = isOK ? "success" : "fail"
        print("insert addressTable \(status)")
        dbGlobal.close()
    }
    
    func delete(item: Address) {
        guard dbGlobal.open() else { return }
        let isOK = dbGlobal.executeUpdate("delete from addressTable where addressID = ? ", withArgumentsInArray: [2])
        let status = isOK ? "success" : "fail"
        print("delete addressTable \(status)")
        dbGlobal.close()
    }
    
    func update(item: Address) {
        guard dbGlobal.open() else { return }
        let isOK = dbGlobal.executeUpdate("update addressTable set name = ?, phone = ?, selectLocation = ?, address = ?, postcode = ?, currentAddress = ?", withArgumentsInArray: [item.name, item.phone, item.selectLocation, item.address, item.postcode, item.currentAddress])
        let status = isOK ? "success" : "fail"
        print("update addressTable \(status)")
        dbGlobal.close()
    }
    
    func query() -> Address? {
        guard dbGlobal.open() else { return nil}
        let result = dbGlobal.executeQuery("select * from addressTable where addressID = ?", withArgumentsInArray: [1])
        let item = Address()
        while result.next() {
                      item.name = result.stringForColumn("name")
                     item.phone = result.stringForColumn("phone")
            item.selectLocation = result.stringForColumn("selectLocation")
                   item.address = result.stringForColumn("address")
                  item.postcode = result.stringForColumn("postcode")
            item.currentAddress = result.stringForColumn("currentAddress")
        }
        print("update addressTable \(result)")
        dbGlobal.close()
        return item
    }
    
}





























