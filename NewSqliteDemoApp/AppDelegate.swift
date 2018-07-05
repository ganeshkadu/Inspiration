//
//  AppDelegate.swift
//  NewSqliteDemoApp
//
//  Created by MAC-PC on 06/02/18.
//  Copyright © 2018 Chitra Sambare. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var db: OpaquePointer?
  var dbmanager =  DBManager()


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    createDatabase()
    dbmanager.InsertData()
    return true
  }
  
  func createDatabase() {
    
    let fileUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("NewDatabase.sqlite")
    
    if (sqlite3_open(fileUrl.path, &db)) != SQLITE_OK {
      print("Error while opening file")
      return
    }
    
    let createMyTable = "CREATE TABLE IF NOT EXISTS myTable(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,desc TEXT)"
    
    if (sqlite3_exec(db, createMyTable, nil, nil, nil)) != SQLITE_OK {
      print("Error while creating my table")
      return
    }
    
    print("File Path = \(fileUrl.path)")
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

