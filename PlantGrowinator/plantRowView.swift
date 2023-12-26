//
//  PlantsView.swift
//  PlantGrowinator
//
//  Created by Owen Sleigh on 9/23/23.
//

import SwiftUI

struct plantRowView: View {
    let plants: Plant
    var body: some View {
        VStack {
            Text(plants.name)
                .font(.title)
                .padding(10)
            HStack {
                HStack {
                    Text("Time between waterings: ")
                    Text(String(plants.timeToWater))
                    Text("days")
                }
                HStack {
                    Text ("Time btwn fertilizer: ")
                    Text(String(plants.timeToFertilize))
                    Text("days")
                }
            }
        }
    }
}

struct plantRowView_Preview: PreviewProvider {
    static var plants = Plant.testData[0]
    static var previews: some View {
        plantRowView(plants: plants)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
