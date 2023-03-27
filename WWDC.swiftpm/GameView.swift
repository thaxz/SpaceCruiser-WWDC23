//
//  GameView.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import SwiftUI

struct GameView: View {
    
    let images = (0...3).map { UIImage(named: "spaceship_0\($0)")!}
    var backgroundImage: String
    var groundImage: String
    let level: GameLevels
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    init(level: GameLevels){
        self.level = level
        switch level {
        case .earth:
            self.backgroundImage = "earthSkyPH"
            self.groundImage = "earthGroundPH"
        case .planet:
            self.backgroundImage = "bgMoon"
            self.groundImage = "moonGroundPH"
        }
    }
    
    var body: some View {
        ZStack {
            Color.theme.darkerPurple
            Image(backgroundImage)
                .resizable()
                    ZStack(){
                        VStack {
                            Spacer()
                            Image(groundImage)
                                .resizable()
                                .frame(height: 610)
                                .transformEffect(
                                    withAnimation(.spring()){
                                        gameViewModel.planetRotation
                                    }
                            )
                        }
                        VStack{
                            Spacer()
                                .frame(height: 50)
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 135, height: 40)
                                    .foregroundColor(.clear)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.white, lineWidth: 2)
                                )
                                Text("00:\(gameViewModel.secondsPlaying)")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            Image(uiImage: images[gameViewModel.index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                                .transformEffect(gameViewModel.playerRotation)
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                    }
            
            if gameViewModel.showGameOver {
                GameOverView()
            }
            if gameViewModel.showWin {
                WinView()
            }
            if gameViewModel.showInstructions {
                VStack{
                    Spacer()
                        .frame(height: 50)
                    InstructionsBanner(timeNedeed: gameViewModel.secondsNeeded)
                    Spacer()
                }
            }
        }
        .ignoresSafeArea()
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(level: .earth)
            .environmentObject(dev.gameVM)
    }
}
