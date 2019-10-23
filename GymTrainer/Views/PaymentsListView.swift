//
//  PaymentsListView.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 23/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import SwiftUI

struct PaymentsListView: View {
    @FetchRequest(fetchRequest: Payment.getAllPayments()) var payments: FetchedResults<Payment>
    
    var body: some View {
        VStack {
            if self.payments.count == 0 {
                Text("There are no payments available")
            } else {
                List {
                    ForEach(self.payments) { payment in
                        Text("a payment should be here...")
                    }.onDelete { indexSet in
                        do {
                            try PaymentsService.deletePayment(self.payments[indexSet.first!])
                        } catch {
                            print(error)
                        }
                    }
                    
                }
            }
        }
        .navigationBarTitle(Text("Previous payments"))
        .navigationBarItems(trailing: EditButton())
    }
}

struct PaymentsListView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsListView()
    }
}
