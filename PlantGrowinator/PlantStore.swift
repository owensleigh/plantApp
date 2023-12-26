//
//  PlantStore.swift
//  PlantGrowinator
// This file ensures persistibility of plants across different loads of the app
//  Created by Owen Sleigh on 11/15/23.
//

import SwiftUI

@MainActor
class PlantStore : ObservableObject {
    @Published var plants : [Plant] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("plants.data")
    }
    
    func load() async throws {
        let task = Task<[Plant], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                            return []
            }
            let plants = try JSONDecoder().decode([Plant].self, from: data)
            return plants
        }
        let plants = try await task.value
        self.plants = plants
    }
    
    func save(plants: [Plant]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(plants)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
