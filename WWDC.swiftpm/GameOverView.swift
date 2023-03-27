//
//  GameOverView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct GameOverView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.theme.darkerPurple)
                .border(.white, width: 3)
            VStack(spacing: 16){
                Spacer()
                Text("DIZZY \n FLIGHT")
                    .font(.system(size: 40, weight: .black))
                    .foregroundColor(.white)
                    
                Text("It looks like you lost some balance!")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.white)
                
                Image("failPH")

                Text("Your mission lasted \(gameViewModel.secondsPlayed)s")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("Try to leave your device within the indicated area!")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(.white)
                
                    Spacer()
                
                    Button {
                        gameViewModel.playAgain()
                        gameViewModel.showGameOver = false
                    } label: { PrimaryButton(name: "Try Again", type: .earth) }
                
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
        .padding(.horizontal ,8)
        .padding(.vertical, 30)
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            GameOverView()
                .environmentObject(dev.gameVM)
        }
    }
}
