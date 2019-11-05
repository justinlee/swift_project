//
//  ViewController.swift
//  JHLibForSwift
//
//  Created by 이재훈 on 16/09/2017.
//  Copyright © 2017 이재훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIAlertController.show(target: self, alert_title: "Title Test", alert_message: "Test Message", style: UIAlertControllerStyle.alert, cancelButtonTitle: "Cancel", destructiveButtonTitle: "OK", otherButtonTitles: nil) { (alert, action, number) in
            NSLog("Alert Done")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

