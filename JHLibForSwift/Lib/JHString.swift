//
//  JHString.swift
//  SwiftTest
//
//  Created by 이재훈 on 18/09/2017.
//  Copyright © 2017 이재훈. All rights reserved.
//

import UIKit

extension String {
    public func urlEncodeUTF8() -> String{
        return self.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)!
    }
    public func urlDecodeUTF8() -> String{
        return self.removingPercentEncoding!
    }
    
    public func numberFormat() -> String{
        if let integer = Int(self) {
            let number = NSNumber(value:integer)
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.maximumFractionDigits = 0;
            
            return formatter.string(from: number)!
        }
        
        return "0"
    }
}
