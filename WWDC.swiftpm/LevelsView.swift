//
//  LevelsView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct LevelsView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Color.theme.darkerPurple
            Image("levelBgPH")
                .resizable()
            VStack(spacing: 60){
                Spacer()
                Text("Choose your mission")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                VStack(spacing: 25) {
                    Button {
                        gameViewModel.selectedLevel = .earth
                        gameViewModel.gameScene = .dialogue
                        gameViewModel.playAgain()
                    } label: { LevelContainer(type: .earth) }
                    Button {
                        gameViewModel.selectedLevel = .planet
                        gameViewModel.gameScene = .dialogue
                        gameViewModel.playAgain()
                    } label: { LevelContainer(type: .planet)}
                    Spacer()
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct LevelsView_Previews: PreviewProvider {
    static var previews: some View {
        LevelsView()
            .environmentObject(dev.gameVM)
    }
}
