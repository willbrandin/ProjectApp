//
//  ProjectColors.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import UIKit

enum ProjectColor: String, Codable, CaseIterable, Identifiable {
    case brown, maroon, tan, teal, blue, purple
    
    var id: String {
        return self.rawValue
    }
    
    var colorRepresentation: UIColor {
        switch self {
        case .brown:
            return UIColor(hexString: "AC7F6D")
            
        case .maroon:
            return UIColor(hexString: "BD8C84")
            
        case .tan:
            return UIColor(hexString: "CCA16E")
            
        case .teal:
            return UIColor(hexString: "8FA4A2")
            
        case .blue:
            return UIColor(hexString: "879CB3")
            
        case .purple:
            return UIColor(hexString: "ABA6B6")
        }
    }
}
