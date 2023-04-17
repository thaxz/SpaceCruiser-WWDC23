//
//  TutorialView.swift
//  CruiserTeste
//
//  Created by thaxz on 23/02/23.
//

import SwiftUI

// MARK: Tutorial View that appears before playing the game

struct TutorialView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            GameGradient()
                .ignoresSafeArea()
            VStack(spacing: 50){
                
                Text("TUTORIAL")
                    .font(.system(size: 42, weight: .heavy))
                    .foregroundColor(.white)
                Spacer()
                Text("This is a game of equilibrium")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.white)
                HStack{
                    TutorialContainer(type: 1)
                    Spacer()
                        .frame(width: 30)
                    TutorialContainer(type: 0)
                }
                Text("Tilt your device so that the spaceship is at the same angle as the guidelines")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                
                PrimaryButton(action: {
                    gameViewModel.gameScene = .levels
                }, name: "Next").tint(.clear)
                
            }
            .padding(16)
            .padding(.vertical, 16)
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
            .environmentObject(GameViewModel())
    }
}
