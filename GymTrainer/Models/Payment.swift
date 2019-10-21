//
//  Payment.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 21/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import Foundation
import CoreData

public class Payment: NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date?
    @NSManaged public var updatedAt:Date?
}

extension Payment {
    public override func awakeFromInsert() {
        let now = Date()
        setPrimitiveValue(now, forKey: "createdAt")
        setPrimitiveValue(now, forKey: "updatedAt")
    }
    
    public override func willSave() {
        /*
         If updatedAt is not equal to nil, we make sure the time difference between the value of updateAt and the current date is bigger than ten seconds. Why is that important?

         By setting the value of the updatedAt property, we invoke another save operation because Core Data detects a change was made. This means that the willSave() method is invoke again. This causes an infinite loop. Apple’s documentation emphasizes that this should be avoided at any cost.
         */
        if let updatedAt = updatedAt {
            if updatedAt.timeIntervalSinceNow > 10.0 {
                self.updatedAt = Date()
            }
        } else {
            self.updatedAt = Date()
        }
    }
}

extension Payment {
    static func getAllPayments() -> NSFetchRequest<Payment> {
        let request:NSFetchRequest<Payment> = Payment.fetchRequest() as!
            NSFetchRequest<Payment>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
    
    static func getMostRecentPayment() -> NSFetchRequest<Payment> {
        let request = Payment.getAllPayments()
        request.fetchLimit = 1
        return request
    }
}
