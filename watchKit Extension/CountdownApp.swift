//
//  CountdownApp.swift
//  watchKit Extension
//
//  Created by cnwang on 2021/7/1.
//

import SwiftUI

@main
struct CountdownApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
