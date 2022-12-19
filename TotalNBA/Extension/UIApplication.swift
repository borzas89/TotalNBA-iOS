//
//  UIApplication.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 14..
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
