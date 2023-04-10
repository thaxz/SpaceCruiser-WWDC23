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
            LinearGradient(colors: [Color.theme.firstGradientColor, Color.theme.secondGradientColor], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 30){
                
                Text("TUTORIAL")
                    .font(.system(size: 40, weight: .heavy))
                    .foregroundColor(.white)
                Spacer()
                Text("This is a game of equilibrium")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.white)
                HStack{
                    TutorialContainer(type: 0)
                    Spacer()
                        .frame(width: 30)
                    TutorialContainer(type: 1)
                }
                Text("Tilt your device so that the spaceship is at the same angle as the guidelines")
                    .font(.system(size: 22, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                Button {
                    gameViewModel.gameScene = .home
                } label: { PrimaryButton(name: "Main Menu")} .tint(.clear)
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
