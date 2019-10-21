//
//  TrainingService.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 21/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import Foundation


struct TrainingsService {
    static func createTraining(_ about: String) throws {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        
        let training = Training(context: context)
        training.about = about
        training.createdAt = Date()
        
        try context.save()
    }
    
    static func deleteTraining(_ training: Training) throws {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        context.delete(training)
        
        try context.save()
    }
}
