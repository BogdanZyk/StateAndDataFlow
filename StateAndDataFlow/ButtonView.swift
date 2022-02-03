//
//  ButtonView.swift
//  StateAndDataFlow
//
//  Created by Богдан Зыков on 06.01.2022.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let color: Color
    let action: () -> Void
    var body: some View {
        Button(action: action){
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .buttonAppearance(color)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Some Action", color: .red, action: {})
            
    }
}
