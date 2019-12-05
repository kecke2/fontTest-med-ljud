//
//  ViewController_Mer_info.swift
//  fontTest
//
//  Created by Kristin Vågberg on 2019-11-26.
//  Copyright © 2018 Kristin Vågberg. All rights reserved.
//

import UIKit

class ViewController_Merinfo: UIViewController {
    
    
    @IBAction func Btn_support(_ sender: UIButton) {
       // print("Hello world")
        guard let url = URL(string: "http://www.tarsoul.se/support.html") else{ return }
        UIApplication.shared.open(url)
    }
    
    
    @IBAction func Btn_PrivatPolicy(_ sender: UIButton) {
        guard let url = URL(string: "http://www.tarsoul.se/privacy-policy.html") else{ return }
        UIApplication.shared.open(url)
        
    }
    
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






