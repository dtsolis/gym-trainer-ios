//
//  CreateButton.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 24/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import SwiftUI

struct CreateButton: View {
    
    var actionClosure: (() -> Void)?
    
    init() {}
    
    init(action: @escaping () -> Void) {
        self.actionClosure = action
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.actionClosure?()
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(width: 70, height: 70)
                })
                    .background(Color.blue)
                    .cornerRadius(35)
                    .shadow(color: Color.black.opacity(0.3),
                            radius: 3,
                            x: 3,
                            y: 3)
                Spacer()
            }
        }
    }
}

struct CreateButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateButton()
    }
}
