//
//  UIApplication.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 23/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    static var appVersion: String? {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    static var appBuild: String? {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
}
