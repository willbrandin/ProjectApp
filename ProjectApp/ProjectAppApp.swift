//
//  ProjectAppApp.swift
//  ProjectApp
//
//  Created by Will Brandin on 2/10/21.
//

import SwiftUI
import IQKeyboardManagerSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "Done"
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
        
        return true
    }
}

@main
struct ProjectAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate // add this line in the struct

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
