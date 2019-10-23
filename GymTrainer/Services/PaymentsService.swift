//
//  PaymentsService.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 23/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import Foundation

struct PaymentsService {
    static func createPayment(_ paidAt: Date, paidTrainings: Int32, paidAmount: Float) throws {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let payment = Payment(context: context)
        payment.paidAt = paidAt
        payment.paidTrainings = paidTrainings
        payment.amount = paidAmount
        
        try context.save()
    }
    
    static func deletePayment(_ payment: Payment) throws {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        context.delete(payment)
        
        try context.save()
    }
}
