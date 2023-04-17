//
//  GameOverView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

// MARK: Appears when you lose the game

struct GameOverView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Rectangle()
                .background(.thinMaterial)
                .ignoresSafeArea()
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color.theme.secondaryColor)
                
                VStack(spacing: 8){
                    Spacer()
                    Text("DIZZY FLIGHT")
                        .font(.system(size: 42, weight: .heavy))
                        .foregroundColor(.white)
                    Spacer()
                    
                    ZStack(alignment: .center){
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(Color.theme.primaryColor.opacity(0.30))
                            .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.theme.terciaryColor, lineWidth: 1)
                            )
                        VStack(spacing: 8){
                            Text("It looks like you lost some balance!")
                                .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            
                            Image("failImage")
                            
                            Text("Your mission lasted \(gameViewModel.secondsPlayed)s")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("Try to leave your device within the indicated area!")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.white)
                        }
                        .padding(22)
                    }
                    .frame(height: 350)
                    
                   Spacer()
                    
                    HStack{
                        SmallSecondaryButton(action: {
                            gameViewModel.showGameOver = false
                            gameViewModel.pauseGame()
                            gameViewModel.gameScene = .home
                        }, name: "Main Menu", width: 150, heigth: 50)
                        
                        Spacer()
                            .frame(width: 16)
                        
                        SmallPrimaryButton(action: {
                            gameViewModel.playAgain()
                            gameViewModel.showGameOver = false
                            
                        }, name: "Try Again", width: 150, heigth: 50)
                    }
                    Spacer()
                }
                .padding(24)
                .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 16)
            .frame(height: UIScreen.main.bounds.height * 3/4)
        }
        
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
