//
//  PonyTabController.swift
//  QuiNi
//
//  Created by Liemkhiet Tran on 1/14/18.
//  Copyright © 2018 liem-khiet tran. All rights reserved.
//

import UIKit

class PonyTabController: UITabBarController {

  public override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    let userDefaults = UserDefaults.standard
    
    if !userDefaults.bool(forKey: "appIntroHasBeenPresented") {
      let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      let appIntroViewController = storyboard.instantiateViewController(withIdentifier: "appIntroViewControllerID") as! AppIntroViewController
      
      self.present(appIntroViewController, animated: true) {
        
        appIntroViewController.dismissButtonTapHandler = {
          userDefaults.set(true, forKey: "appIntroHasBeenPresented")
          self.dismiss(animated: true, completion:nil)
        }
      }
    }
  }
}
