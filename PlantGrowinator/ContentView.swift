
import SwiftUI

struct ContentView: View {
    @Binding var plants: [Plant]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isCreatingNewPlantView = false
    
    let saveAction: ()->Void

    var body: some View {
        NavigationStack {
            List($plants, id: \.name) {$plant in
                NavigationLink(destination: onePlantView(plant: $plant)) {
                    plantRowView(plants: plant)
                }
            }
            .navigationTitle(Text("Your Plants"))
            .toolbar {
                Button(action: {
                    isCreatingNewPlantView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Add New Plant")
            }
        }
        .sheet(isPresented: $isCreatingNewPlantView) {
            newPlantView(isCreatingNewPlantView: $isCreatingNewPlantView, plants: $plants)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(plants: .constant(Plant.testData), saveAction: {})
    }
}
