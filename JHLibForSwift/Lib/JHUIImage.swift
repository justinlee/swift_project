//
//  JHUIImage.swift
//  SwiftTest
//
//  Created by 이재훈 on 18/09/2017.
//  Copyright © 2017 이재훈. All rights reserved.
//

import UIKit

extension UIImage {
    public func imageWithColorOverlay (color : UIColor) -> UIImage{
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()
        
        let rect = CGRect(x:0.0,y: 0.0, width:self.size.width, height:self.size.height)
        draw(in: rect)
        
        context!.setBlendMode(.multiply)
        
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        draw(in: rect, blendMode: .destinationIn, alpha: 1.0)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    public func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
