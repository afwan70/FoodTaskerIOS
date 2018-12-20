//
//  LoginViewController.swift
//  FoodTaskerIOS
//
//  Created by AMIR AFWAN on 12/20/18.
//  Copyright © 2018 AMIR AFWAN. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    var fbLoginSuccess = false

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (FBSDKAccessToken.current() != nil && fbLoginSuccess == true) {
            performSegue(withIdentifier: "CustomerView", sender: self)
        }
    }
    
    @IBAction func facebookLogin(_ sender: Any) {
        
        if (FBSDKAccessToken.current() != nil) {
            fbLoginSuccess = true
            self.viewDidAppear(true)
        } else {
            FBManager.shared.logIn(withReadPermissions: ["public_profile","email"], from: self) { (result, error) in
                if (error == nil) {
                    self.fbLoginSuccess = true
                }
            }
        }
    } 

    

}
