//
//  Formatter+Extensions.swift
//  IOS6-HW14-AndreiMatveev
//
//  Created by Владелец on 12.06.2022.
//

import UIKit

 extension Formatter {

     static let withSeparator: NumberFormatter = {
         let formatter = NumberFormatter()
         formatter.groupingSeparator = "."
         formatter.numberStyle = .decimal
         return formatter
     }()
 }
