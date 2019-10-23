//
//  MoreScreenView.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 23/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import SwiftUI

struct Row: View {
    var title: String
    var subtitle: String?
    
    init(title: String) {
        self.title = title
    }
    
    init(title: String, subtitle: String?) {
        self.title = title
        self.subtitle = subtitle
    }
    
    var body: some View {
        HStack {
            Text(self.title)
            Spacer()
            Text(self.subtitle ?? "")
                .font(.subheadline)
        }
    }
}

struct MoreScreenView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Payments")) {
                    RecentPaymentView()
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    NavigationLink(destination: PaymentsListView()) {
                                               Text("Previous payments")
                                           }
                }
                Section(header: Text("Settings")) {
                    Text("Gym details")
                    Row(title: "Default pre-paid days", subtitle: "8")
                }
                Section(header: Text("Application")) {
                    Row(title: "Version", subtitle: UIApplication.appVersion)
                    Row(title: "Build", subtitle: UIApplication.appBuild)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("More"))
        }
    }
}

struct MoreScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MoreScreenView()
    }
}
