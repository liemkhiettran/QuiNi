//
//  BreedsTableViewController.swift
//  QuiNi
//
//  Created by Liemkhiet Tran on 1/14/18.
//  Copyright © 2018 liem-khiet tran. All rights reserved.
//

import UIKit

class BreedsTableViewController: UITableViewController {

  override public func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ponyCellReuseIdentifier")
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 3
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ponyCellReuseIdentifier", for: indexPath as IndexPath)
    
    if let textLabel = cell.textLabel {
      switch indexPath.row {
      case 0:
        textLabel.text = "Shetland"
      case 1:
        textLabel.text = "Welsh"
      case 2:
        textLabel.text = "Exmoor"
      default:
        break
      }
    }
    
    if let imageView = cell.imageView {
      switch indexPath.row {
      case 0:
        let imageName = "shetland"
        imageView.image = UIImage(named: imageName)
        imageView.accessibilityIdentifier = imageName
      case 1:
        let imageName = "Welsh"
        imageView.image = UIImage(named: imageName)
        imageView.accessibilityIdentifier = imageName
      case 2:
        let imageName = "exmoor"
        imageView.image = UIImage(named: imageName)
        imageView.accessibilityIdentifier = imageName
      default:
        break
      }
    }
    
    return cell
  }
}

//extension BreedsTableViewController: UITableViewDataSource {
//
//  func numberOfSections(in tableView: UITableView) -> Int {
//
//    return 1
//  }
//
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    return 3
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    let cell = tableView.dequeueReusableCell(withIdentifier: "ponyCellReuseIdentifier", for: indexPath as IndexPath)
//
//    if let textLabel = cell.textLabel {
//      switch indexPath.row {
//      case 0:
//        textLabel.text = "Shetland"
//      case 1:
//        textLabel.text = "Welsh"
//      case 2:
//        textLabel.text = "Exmoor"
//      default:
//        break
//      }
//    }
//
//    if let imageView = cell.imageView {
//      switch indexPath.row {
//      case 0:
//        let imageName = "shetland"
//        imageView.image = UIImage(named: imageName)
//        imageView.accessibilityIdentifier = imageName
//      case 1:
//        let imageName = "welsh"
//        imageView.image = UIImage(named: imageName)
//        imageView.accessibilityIdentifier = imageName
//      case 2:
//        let imageName = "exmoor"
//        imageView.image = UIImage(named: imageName)
//        imageView.accessibilityIdentifier = imageName
//      default:
//        break
//      }
//    }
//
//    return cell
//  }
//}

