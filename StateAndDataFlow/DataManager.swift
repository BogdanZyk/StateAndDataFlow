//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Богдан Зыков on 06.01.2022.
//
// два метода использования userDefaults и AppStorage
import SwiftUI


//userDefaults

//
//class DataManager {
//    static let shared = DataManager()
//    private let userDefault = UserDefaults.standard
//    private let userDataKey = "userManager"
//    private init(){}
//
//    func saveUser(user: User){
//        guard let userData = try? JSONEncoder().encode(user) else{return}
//        userDefault.set(userData, forKey: userDataKey)
//    }
//    func loadUser() -> User {
//        guard let userData = userDefault.object(forKey: userDataKey) as? Data else{return User()}
//        guard let user = try? JSONDecoder().decode(User.self, from: userData) else{return User()}
//        return user
//    }
//    func clear(userManager: UserManager){
//        userManager.user.isRegistered = false
//        userManager.user.name = ""
//        userDefault.removeObject(forKey: userDataKey)
//    }
//}

//AppStorage
class DataManager {
    static let shared = DataManager()
    @AppStorage("user") private var userData: Data?
    private init(){}

    func saveUser(user: User){
        userData = try? JSONEncoder().encode(user)
    }
    func loadUser() -> User {
        guard let user = try?JSONDecoder().decode(User.self, from: userData ?? Data()) else{return User()}
        return user
    }
    func clear(userManager: UserManager){
        userManager.user.isRegistered = false
        userManager.user.name = ""
        userData = nil
    }
}
