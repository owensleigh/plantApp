//
//  editPlantView.swift
//  PlantGrowinator
//
//  Created by Owen Sleigh on 10/19/23.
//

import SwiftUI

struct editPlantView: View {
    @Binding var plant : Plant
    
    var body: some View {
        Form {
            Section(header: Text("Plant Info")) {
                TextField("Plant Name", text: $plant.name)
                VStack {
                    HStack {
                        Text("Time Between Waterings")
                        Spacer()
                    }
                    
                    HStack {
                        Slider(value: $plant.timeToWaterAsDouble, in: 1...20, step: 1) {
                            Text("watering")
                        }
                        Spacer()
                        Text("\(plant.timeToWater) days")
                    }
                }
                
                VStack {
                    HStack {
                        Text("Time Between Fertilizer Dosages")
                        Spacer()
                    }
                    
                    HStack {
                        Slider(value: $plant.timeToFertilizeAsDouble, in: 1...30, step: 1) {
                            Text("Fertilizer")
                        }
                        Spacer()
                        Text("\(plant.timeToFertilize) days")
                    }
                }
                Button(action : { }) {
                    Text("Add Picture")
                }
            }
        }
    }
}

struct editPlantView_Previews: PreviewProvider {
    static var previews: some View {
        editPlantView(plant: .constant(Plant.testData[0]))
    }
}
