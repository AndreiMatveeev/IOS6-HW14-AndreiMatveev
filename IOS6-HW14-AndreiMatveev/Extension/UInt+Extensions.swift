//
//  UInt+Extensions.swift
//  IOS6-HW14-AndreiMatveev
//
//  Created by Владелец on 12.06.2022.
//

import Foundation

 extension UInt {

     var formattedWithSeparator: String {
         return Formatter.withSeparator.string(for: self) ?? ""
     }
 }
