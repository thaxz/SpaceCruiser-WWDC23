//
//  TutorialView.swift
//  CruiserTeste
//
//  Created by thaxz on 23/02/23.
//

import SwiftUI

struct TutorialView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Color.theme.darkerPurple
            Image("levelBgPH")
                .ignoresSafeArea()
            VStack(spacing: 50){
                Spacer()
                Text("This is a game of equilibrium")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                HStack{
                    TutorialContainer(type: 0)
                    Spacer()
                    TutorialContainer(type: 1)
                }
                Text("Tilt your device so that the spaceship is at the same angle as the guidelines")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Button {
                    gameViewModel.gameScene = .home
                } label: { PrimaryButton(name: "Back to Menu", type: .earth)} .tint(.clear)
                Spacer()
            }.padding(16)
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
            .environmentObject(GameViewModel())
    }
}
