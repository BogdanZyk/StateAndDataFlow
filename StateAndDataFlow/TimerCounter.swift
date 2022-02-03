//
//  TimerCounter.swift
//  StateAndDataFlow
//
//  Created by Богдан Зыков on 06.01.2022.
//

import Foundation
import Combine

class TimerCounter: ObservableObject {
    var objectWillChange = PassthroughSubject<TimerCounter, Never>()
    var counter = 3
    var timer: Timer?
    var buttonTitle = "Start"
    
    func startTimer(){
        if counter > 0 {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
        buttonDidTapped()
    }
    @objc private func updateCounter(){
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        objectWillChange.send(self)
    }
    private func killTimer(){
        timer?.invalidate()
        timer = nil
    }
    private func buttonDidTapped(){
        if buttonTitle == "Reset"{
            counter = 3
            buttonTitle = "Start"
        }else{
            buttonTitle = "Wait... "
        }
        objectWillChange.send(self)
    }
}
