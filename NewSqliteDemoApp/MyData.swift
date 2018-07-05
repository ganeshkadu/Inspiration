//
//  MyData.swift
//  NewSqliteDemoApp
//
//  Created by MAC-PC on 06/02/18.
//  Copyright © 2018 Chitra Sambare. All rights reserved.
//

import Foundation

class MyData:NSObject {
  var name: String!
  var desc: String!
  
  init(name: String,desc: String) {
    self.name = name
    self.desc = desc
  }
}
