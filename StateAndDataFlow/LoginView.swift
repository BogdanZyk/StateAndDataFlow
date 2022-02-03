//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Богдан Зыков on 06.01.2022.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userManager: UserManager
    var body: some View {
        VStack{
            UserNameTF(
                name: $userManager.user.name,
                nameIsValid: userManager.nameIsValid
            )
            Button(action: registerUser){
                HStack{
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
            .disabled(!userManager.nameIsValid)
        }
        .padding()
    }
}

extension LoginView{
    func registerUser(){
        if !userManager.user.name.isEmpty{
            userManager.user.isRegistered.toggle()
            DataManager.shared.saveUser(user: userManager.user)
        }
    }
}

struct UserNameTF: View {
    @Binding var name: String
    var nameIsValid = false
    var body: some View{
        ZStack{
            TextField("Type your name...", text: $name)
                .multilineTextAlignment(.center)
            HStack{
                Spacer()
                Text("\(name.count)")
                    .font(.callout)
                    .foregroundColor(nameIsValid ? .green : .red)
                    .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(UserManager())
    }
}
