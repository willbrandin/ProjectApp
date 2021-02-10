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
        static let tintedWhite = UIColor(hexString: "F9FAFF")
        static let brandBlue = UIColor(hexString: "4B6CDD")
        static let brandOrange = UIColor(hexString: "EE9A4D")
        static let darkText = UIColor(hexString: "1F1F1F")
        static let darkTitle = UIColor(hexString: "2E2E2E")
        static let greyPrimary = UIColor(hexString: "CECECE") // Light Text
        static let greySecondary = UIColor(hexString: "E7E7E7") // Strokes and Borders

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

extension Color {
    static let tintedWhite = Color(Style.ColorStyle.tintedWhite)
    static let brandBlue = Color(Style.ColorStyle.brandBlue)
    static let brandOrange = Color(Style.ColorStyle.brandOrange)
    static let darkText = Color(Style.ColorStyle.darkText)
    static let darkTitle = Color(Style.ColorStyle.darkTitle)
    static let greyPrimary = Color(Style.ColorStyle.greyPrimary)
    static let greySecondary = Color(Style.ColorStyle.greySecondary)
}

extension CGFloat {
    static let small = Style.Layout.small
    static let padding = Style.Layout.padding
    static let margin = Style.Layout.margin
    static let marginXL = Style.Layout.marginXL
    static let marginMax = Style.Layout.marginMax
}
