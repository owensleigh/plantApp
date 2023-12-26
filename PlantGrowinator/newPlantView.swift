//
//  newPlantView.swift
//  PlantGrowinator
//
//  Created by Owen Sleigh on 11/15/23.
//

import SwiftUI

struct newPlantView: View {
    @Binding var isCreatingNewPlantView: Bool
    @Binding var plants: [Plant]
    @State private var newPlant = Plant.emptyPlant
    
    var body: some View {
        NavigationStack {
            editPlantView(plant: $newPlant)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isCreatingNewPlantView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            plants.append(newPlant)
                            isCreatingNewPlantView = false
                        }
                    }
                }
        }
    }
}

struct newPlantView_Previews: PreviewProvider {
    static var previews: some View {
        newPlantView(isCreatingNewPlantView: .constant(true), plants: .constant(Plant.testData))
    }
}
