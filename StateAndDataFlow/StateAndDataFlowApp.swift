//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Богдан Зыков on 06.01.2022.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var userManager = UserManager(user: DataManager.shared.loadUser())
    //private let user = DataManager.shared.loadUser()
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userManager)
        }
    }
}
