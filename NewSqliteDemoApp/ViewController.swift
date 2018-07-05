//
//  ViewController.swift
//  NewSqliteDemoApp
//
//  Created by MAC-PC on 06/02/18.
//  Copyright © 2018 Chitra Sambare. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
  
  @IBOutlet var tableView: UITableView!
  @IBOutlet var viewModelNew: viewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    viewModelNew.fetchData {
      DispatchQueue.main.async(execute: {
         self.tableView.reloadData()
      })
    }
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModelNew.numberOfItemsInSection(section: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    
    configureCell(cell: cell, forRowIndexPath: indexPath as NSIndexPath)
    
    return cell
  }
  
  func configureCell(cell: UITableViewCell, forRowIndexPath indexpath: NSIndexPath) {
    cell.textLabel?.text = viewModelNew.titleForText(indexpath: indexpath)
  }


}

