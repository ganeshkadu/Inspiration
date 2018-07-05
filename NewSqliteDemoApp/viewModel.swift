//
//  viewModel.swift
//  NewSqliteDemoApp
//
//  Created by MAC-PC on 06/02/18.
//  Copyright © 2018 Chitra Sambare. All rights reserved.
//

import UIKit

class viewModel: NSObject {
  
  var myData = [MyData]()
  var dbmanager = DBManager()
  
  
  func fetchData(completion: ()->()) {
    self.myData = dbmanager.getUserDevice()
    completion()
  }
  
  func numberOfItemsInSection(section:Int) -> Int {
    return myData.count
  }
  
  func titleForText(indexpath: NSIndexPath) -> String {
    return myData[indexpath.row].name
  }

}
