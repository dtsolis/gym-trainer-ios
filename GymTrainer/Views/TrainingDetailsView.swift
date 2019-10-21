//
//  TrainingDetailsView.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 21/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import SwiftUI

struct TrainingDetailsView: View {
    var training: Training?
    
    init() {
        
    }
    
    init(training: Training) {
        self.training = training
    }
    
    func formattedDate() -> String {
        guard let d = training?.createdAt else { return "" }
        let formatter = DateFormatter()
        formatter.dateFormat = "eeee, dd MMM yyyy"
        return formatter.string(from: d)
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Ημερομηνία")
                    .font(.headline)
                Text(self.formattedDate())
                    .padding(.bottom, 20)
                Text("Περιγραφή").font(.headline)
                Text(self.training?.about ?? "")
                Spacer()
            }
//            .background(Color.red)
//            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
//            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
            .padding(12)
        }
        .navigationBarTitle("Details")
    }
}
