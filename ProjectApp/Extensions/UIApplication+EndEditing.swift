//
//  UIApplication+EndEditing.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
