//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Богдан Зыков on 06.01.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimerCounter()
    @EnvironmentObject var userManager: UserManager
    var body: some View {
        
        VStack {
            Text("Hi, \(userManager.user.name)!")
                .offset(x:0, y: 100)
                .font(.title)
            Text("\(timer.counter)")
                .font(.largeTitle)
            .offset(x:0, y: 200)
            Spacer()
            VStack{
                Spacer()
                ButtonView(title: timer.buttonTitle, color: .red){
                    timer.startTimer()
                }
                Spacer()
                ButtonView(title: "LogOut", color: .blue){
                    DataManager.shared.clear(userManager: userManager)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager())
    }
}


