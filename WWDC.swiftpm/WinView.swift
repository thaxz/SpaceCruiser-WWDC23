//
//  WinView.swift
//  CruiserTeste
//
//  Created by thaxz on 27/02/23.
//

import SwiftUI

struct WinView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.theme.darkerBlue)
            VStack(spacing: 20){
                Spacer()
                Text("MISSION COMPLETED")
                    .font(.system(size: 40, weight: .black))
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("Congratulations! You managed to have a nice flight")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                
                Image("winPH")
                
                Text("Check your relatory to see what infos you collected")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    gameViewModel.showGameOver = false
                    gameViewModel.pauseGame()
                    gameViewModel.gameScene = .relatory
                } label: { PrimaryButton(name: "See Relatory", type: .planet) }
                
                Button {
                    gameViewModel.showGameOver = false
                    gameViewModel.pauseGame()
                    gameViewModel.gameScene = .home
                } label: { SecondaryButton(name: "Main Menu") } .tint(.clear)
                Spacer()
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .ignoresSafeArea()
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            WinView()
                .environmentObject(dev.gameVM)
        }
    }
}
