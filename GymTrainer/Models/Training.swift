//
//  Training.swift
//  GymTrainer
//
//  Created by Theodoshs Koutsias on 12/10/2019.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import Foundation
import CoreData

public class Training: NSManagedObject, Identifiable {
    @NSManaged public var createdAt: Date?
    @NSManaged public var about: String?
}

extension Training {
    static func getAllToTrainings() -> NSFetchRequest<Training> {
        let request:NSFetchRequest<Training> = Training.fetchRequest() as!
            NSFetchRequest<Training>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}
