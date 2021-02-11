//
//  Style.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import UIKit
import SwiftUI

struct Style {
    struct ColorStyle {
        static let primaryBackground = UIColor(named: "primaryBackground")!
        static let secondaryBackground = UIColor(named: "secondaryBackground")!
        static let brandBlue = UIColor(named: "brandBlue")!
        static let brandOrange = UIColor(named: "brandOrange")!
        static let textPrimary = UIColor(named: "textPrimary")!
        static let textSecondary = UIColor(named: "textSecondary")!
        static let greyPrimary = UIColor(named: "greyPrimary")! // Light Text
        static let greySecondary = UIColor(named: "greySecondary")! // Strokes and Borders
    }
    
    struct FontStyle {
        static let title = UIFont(name: "Avenir-Black", size: 24)!
        static let title2 = UIFont(name: "Avenir-Heavy", size: 18)!
        static let header = UIFont(name: "Avenir-Heavy", size: 16)!
        static let header2 = UIFont(name: "Avenir-Heavy", size: 14)!
        static let body = UIFont(name: "Avenir-Roman", size: 14)!
        static let caption = UIFont(name: "Avenir-Medium", size: 12)!
    }
    
    struct Icon {
        static let share = UIImage(named: "share")
        static let backArrow = UIImage(named: "back-arrow")
        static let plus = UIImage(named: "plus")
        static let check = UIImage(named: "check")
        static let calendar = UIImage(named: "calendar")
    }
    
    struct Layout {
        static let small: CGFloat = 4
        static let padding: CGFloat = 8
        static let margin: CGFloat = 16
        static let marginXL: CGFloat = 24
        static let marginMax: CGFloat = 32
    }
}
