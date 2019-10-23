//
//  RecentPaymentView.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 23/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import SwiftUI

struct RecentPaymentView: View {
    
    @FetchRequest(fetchRequest: Payment.getAllPayments()) var payments: FetchedResults<Payment>
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "eee, dd MMM yyyy"
        return formatter
    }()
    
    func getPaymentDate() -> String {
        guard let d = self.payments.first?.createdAt else {
            return "No payments available"
        }
        return Self.dateFormatter.string(from: d)
    }
    
    var body: some View {
        HStack {
            Image(systemName: "eurosign.circle")
                .font(.title)
                .padding(.trailing, 8)
            VStack(alignment: .leading, spacing: CGFloat(0)) {
                Text("Most recent payment")
                    .font(.headline)
                    .padding(.bottom, 4)
                Text(self.getPaymentDate())
                    .font(.subheadline)
            }
        }
    }
}

struct RecentPaymentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentPaymentView()
    }
}
