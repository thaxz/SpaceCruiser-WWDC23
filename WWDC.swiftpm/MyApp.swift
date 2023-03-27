import SwiftUI

@main
struct MyApp: App {
    @StateObject private var gameViewModel = GameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameViewModel)
        }
    }
}
