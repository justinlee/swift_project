//
//  JHAlertView.swift
//  SwiftTest
//
//  Created by meteoswarm on 16/09/2017.
//  Copyright © 2017 meteoswarm. All rights reserved.
//

import UIKit

private let UIAlertControllerBlocksCancelButtonIndex = 0
private let UIAlertControllerBlocksDestructiveButtonIndex = 1
private let UIAlertControllerBlocksFirstOtherButtonIndex = 2

public typealias UIAlertControllerCompletionBlock = (UIAlertController, UIAlertAction, NSInteger) -> Void

extension UIAlertController {

    public class func show (target: UIViewController,
                            alert_title: String?,
                            alert_message:String?,
                            style : UIAlertControllerStyle,
                            cancelButtonTitle : String,
                            destructiveButtonTitle : String?,
                            otherButtonTitles : NSArray?,
                            completionBlock: @escaping UIAlertControllerCompletionBlock) -> Void {
        

        let controller = UIAlertController(title:alert_title, message: alert_message, preferredStyle : style)
        
        if (cancelButtonTitle != "") {
            
            let cancelAction: UIAlertAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { action -> Void in
                    completionBlock(controller, action, UIAlertControllerBlocksCancelButtonIndex)
            }
            controller.addAction(cancelAction)
        }
        
        if destructiveButtonTitle != nil {
            let destructiveAction: UIAlertAction = UIAlertAction(title: destructiveButtonTitle, style: .destructive) { action -> Void in
                completionBlock(controller, action, UIAlertControllerBlocksDestructiveButtonIndex)
            }

            controller.addAction(destructiveAction)
        }
        if otherButtonTitles != nil{
            for (index, otherButtonTitle) in (otherButtonTitles?.enumerated())! {
                let otherAction: UIAlertAction = UIAlertAction(title: otherButtonTitle as? String, style: .default, handler: { (action: UIAlertAction) in
                    completionBlock(controller, action, UIAlertControllerBlocksFirstOtherButtonIndex+index)
                })
                controller.addAction(otherAction)
            }
        }
        
        
        target.present(controller, animated: true, completion: nil)
    }
}
