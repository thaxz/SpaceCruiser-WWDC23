//
//  ContentView.swift
//  CruiserTeste
//
//  Created by thaxz on 15/02/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        switch gameViewModel.gameScene {
        case .home:
            HomeView()
                .environmentObject(gameViewModel)
        case .levels:
            LevelsView()
                .environmentObject(gameViewModel)
        case .dialogue:
            DialogueView(level: gameViewModel.selectedLevel)
                .environmentObject(gameViewModel)
        case .gameScreen:
            GameView(level: gameViewModel.selectedLevel)
                .environmentObject(gameViewModel)
        case .credits:
            CreditsView()
                .environmentObject(gameViewModel)
        case .tutorial:
            TutorialView()
                .environmentObject(gameViewModel)
        case .relatory:
            RelatoryView(level: gameViewModel.selectedLevel)
                .environmentObject(gameViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(dev.gameVM)
    }
}
