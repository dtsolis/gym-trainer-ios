//
//  TrainingsTabView.swift
//  GymTrainer
//
//  Created by Dimitris-Sotiris Tsolis on 22/10/19.
//  Copyright © 2019 DFG Team. All rights reserved.
//

import SwiftUI

struct TrainingsListView: View {
    
    @FetchRequest(fetchRequest: Training.getAllToTrainings()) var trainings:FetchedResults<Training>
    
    @State private var newTrainingItem = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    Section(header: Text("Next training")){
                        HStack{
                            TextField("Short description", text: self.$newTrainingItem)
                            Button(action: {
                                do {
                                    try TrainingsService.createTraining(self.newTrainingItem)
                                } catch {
                                    print(error)
                                }
                                self.newTrainingItem = ""
                            }){
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                                    .imageScale(.large)
                            }
                        }
                    }.font(.headline)
                    Section(header: Text("Trainings")) {
                        ForEach(self.trainings) { training in
                            NavigationLink(destination: TrainingDetailsView(training: training)) {
                                TrainingRow(training: training)
                            }
                        }.onDelete { indexSet in
                            do {
                                try TrainingsService.deleteTraining(self.trainings[indexSet.first!])
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("My trainings"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct TrainingsListView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingsListView()
    }
}
