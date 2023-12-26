//
//  PlantGrowinatorApp.swift
//  PlantGrowinator
//
//  Created by Owen Sleigh on 9/14/23.
//

import SwiftUI

@main
struct PlantGrowinatorApp: App {
    
    @StateObject private var store = PlantStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView(plants: $store.plants) {
                Task {
                    do {
                        try await store.save(plants: store.plants)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                }
            }
        }
    }
}
