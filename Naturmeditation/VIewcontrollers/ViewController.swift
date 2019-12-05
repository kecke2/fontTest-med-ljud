//
//  ViewController.swift
//  fontTest
//
//  Created by Kristin Vågberg on 2018-10-01.
//  Copyright © 2018 Kristin Vågberg. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
     }
  
    //NÄR VYN LADDAS IN SÅ GÖMS NAVIGATIONSMENYN TITELN:
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  }



