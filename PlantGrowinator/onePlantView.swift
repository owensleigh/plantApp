//
//  onePlantView.swift
//  PlantGrowinator
//
//  Created by Owen Sleigh on 10/2/23.
//

import SwiftUI

struct onePlantView: View {
    @Binding var plant: Plant
    
    @State private var editingPlant = Plant.emptyPlant
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Button(action: { }) {
                Text("Water")
            }
            .foregroundColor(.blue)
            
            Button(action: { }) {
                Text("Fertilize")
            }
            .foregroundColor(.green)
            Section(header : Text("Plant Info")) {
                HStack {
                    Label("Plant Name", systemImage: "leaf")
                        .font(.headline)
                    Spacer()
                    Text(plant.name)
                        .font(.headline)
                }
                HStack {
                    Label("Time Between Waterings", systemImage: "shower.handheld")
                    Spacer()
                    Text("\(plant.timeToWater) days")
                }
                HStack {
                    Label("Last Watered", systemImage: "shower.handheld.fill")
                    Spacer()
                    Text(" days ago")
                    //TODO: add a button for watering the plant and update it here
                }
                HStack {
                    Label("Time Between Fertilizer", systemImage: "fork.knife.circle")
                    Spacer()
                    Text("\(plant.timeToFertilize) days")
                }
                HStack {
                    Label("Last fertilized", systemImage: "fork.knife.circle.fill")
                    Spacer()
                    Text(" days ago")
                    //TODO: add a button for fertilizing the plant and update it here
                }
            }
        }
        .navigationTitle(plant.name)
        .toolbar {
            Button("Edit Plant") {
                isPresentingEditView = true
                editingPlant = plant
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                editPlantView(plant: $editingPlant)
                    .navigationTitle(plant.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Save") {
                                isPresentingEditView = false
                                plant = editingPlant
                            }
                        }
                    }
            }
        }
    }
}

struct onePlantView_Previews: PreviewProvider {
    static var previews: some View {
        onePlantView(plant: .constant(Plant.testData[0]))
    }
}
