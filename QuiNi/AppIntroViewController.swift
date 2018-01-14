//
//  AppIntroViewController.swift
//  QuiNi
//
//  Created by Liemkhiet Tran on 1/14/18.
//  Copyright © 2018 liem-khiet tran. All rights reserved.
//

import UIKit

class AppIntroViewController: UIViewController {

  @IBOutlet public var dismissButton: UIButton!
  public var dismissButtonTapHandler: (() -> Void)?
  
  @IBAction public func dismissButtonTapped() {
    
    if let dismissButtonTapHandler = self.dismissButtonTapHandler {
      dismissButtonTapHandler()
    }
  }
}
