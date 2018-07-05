//
//  DBManager.swift
//  NewSqliteDemoApp
//
//  Created by MAC-PC on 06/02/18.
//  Copyright © 2018 Chitra Sambare. All rights reserved.
//

import UIKit

class DBManager: NSObject {
  
  func InsertData(){
    var db: OpaquePointer?
    var stmt: OpaquePointer?
    let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("NewDatabase.sqlite")
    
    if (sqlite3_open(fileUrl.path, &db)) != SQLITE_OK {
      print("Error while opening file")
      return
    }
    
    let name = "Ganesh"
    let desc = "My Name"
    
    let query = String.init(format: "insert into myTable(name,desc) values('%@','%@')",name,desc)
    
    if (sqlite3_prepare(db, query.cString(using: .utf8), -1, &stmt, nil)) != SQLITE_OK {
      print("Error while executing query")
    }
    
    if (sqlite3_step(stmt)) != SQLITE_DONE {
      print("Failed error message")
      return
    }
  }
  
  func getUserDevice()->[MyData] {
    var data: [MyData] = []
    var name = String()
    var desc = String()
    
    var db: OpaquePointer?
    var stmt: OpaquePointer?
    let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("NewDatabase.sqlite")
    
    if (sqlite3_open(fileUrl.path, &db)) != SQLITE_OK {
      print("Error while opening file")
    }
    
    let getMyData = "SELECT * from myTable"
    if (sqlite3_prepare(db, getMyData, -1, &stmt, nil)) != SQLITE_OK {
      print("Error while preparing data")
    }
    
    while sqlite3_step(stmt) == SQLITE_ROW {
      if let cString = sqlite3_column_text(stmt, 1) {
        name = String(cString: cString)
        print("device_mac_id = \(name)")
      } else {
        print("device_mac_id not found")
      }
      
      if let cString = sqlite3_column_text(stmt, 2) {
        desc = String(cString: cString)
        print("device_mac_id = \(desc)")
      } else {
        print("device_mac_id not found")
      }
      
      let myData = MyData(name: name, desc: desc)
      
      data.append(myData)
    }
    
    
    
    return data
  }

}
