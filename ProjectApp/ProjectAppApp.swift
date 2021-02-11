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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @Environment(\.scenePhase) var scenePhase
    @StateObject private var appStore = AppStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(appStore)
            .onAppear {
                appStore.dispatch(action: .loadProjects)
            }
            .onChange(of: scenePhase) { scenePhase in
                switch scenePhase {
                case .active:
                    appStore.dispatch(action: .loadProjects)
                    print("FOREGROUND")
                    
                case .background:
                    print("BACKGROUND")
                    
                default:
                    print("\(scenePhase)")
                    break
                }
            }
        }
    }
}
