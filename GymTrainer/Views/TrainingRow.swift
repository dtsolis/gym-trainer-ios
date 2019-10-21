//
//  TrainingRow.swift
//  GymTrainer
//
//  Created by Theodoshs Koutsias on 12/10/2019.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import SwiftUI

struct TrainingRow: View {
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
        HStack {
            VStack(alignment: .leading) {
                Text(formattedDate())
                    .font(.headline)
//                Text(training?.about ?? "")
//                    .font(.caption)
            }
        }
    }
}

struct TrainingRow_Previews: PreviewProvider {
    static var previews: some View {
        TrainingRow()
    }
}
