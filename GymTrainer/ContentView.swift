//
//  ContentView.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 12/10/2019.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var tabManager = MainTabBarManager(initialIndex: 1, customItemIndex: 2)
    @State private var isOptionsMenuVisible: Bool = false

    var actionSheet: ActionSheet {
        ActionSheet(
            title: Text("What do you want to do?"),
            message: Text(""),
            buttons: [
                .default(Text("Training")),
                .default(Text("Payment")),
                .cancel(Text("Cancel"))
            ]
        )
    }
    
    var body: some View {
        ZStack {
            TabView (selection: $tabManager.selectedItem) {
                TrainingsListView()
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Trainings")
                }.tag(1)
                
                Text("placeholder tab for adding the center icon")
                    .tabItem {
                        Image(systemName: "plus.circle")
                }
                .tag(2)
                .disabled(true)
                
                MoreScreenView()
                    .tabItem {
                        Image(systemName: "ellipsis")
                        Text("More")
                }.tag(3)
            }
            .font(.headline)
            .accentColor(.red)
            .sheet(isPresented: $isOptionsMenuVisible, onDismiss: {
                print("dismiss")
                
            }) {
                Text("provide options for:")
                Text("1. creating a new training")
                Text("2. creating a new payment")
            }
            
            CreateButton {
                self.isOptionsMenuVisible = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
