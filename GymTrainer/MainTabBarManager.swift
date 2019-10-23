//
//  MainTabBarManager.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 22/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import Foundation
import Combine

final class MainTabBarManager: ObservableObject {

    /// This is the index of the item that fires a custom action
    let customActionteminidex: Int

    let objectWillChange = PassthroughSubject<MainTabBarManager, Never>()

    var selectedItem: Int {
        didSet {
            if selectedItem == customActionteminidex {
                selectedItem = oldValue
                isCustomItemSelected = true
            }
            objectWillChange.send(self)
        }
    }

    /// This is true when the user has selected the Item with the custom action
    var isCustomItemSelected: Bool = false

    init(initialIndex: Int = 1, customItemIndex: Int) {
        self.customActionteminidex = customItemIndex
        self.selectedItem = initialIndex
    }
}
