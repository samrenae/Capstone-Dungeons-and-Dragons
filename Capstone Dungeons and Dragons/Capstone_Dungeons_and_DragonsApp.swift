//
//  Capstone_Dungeons_and_DragonsApp.swift
//  Capstone Dungeons and Dragons
//
//  Created by Samantha Hunt on 1/28/23.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct Capstone_Dungeons_and_DragonsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var characterVM = CharacterViewModel()
    @StateObject var userVM = UserViewModel()
    var body: some Scene {
        WindowGroup {
            LoginView(user: User())
                .environmentObject(userVM)
                .environmentObject(characterVM)
        }
    }
}
