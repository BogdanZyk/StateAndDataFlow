//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Богдан Зыков on 06.01.2022.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject var userManager: UserManager
    var body: some View {
        Group{
            if userManager.user.isRegistered{
                ContentView()
            }else{
                LoginView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
