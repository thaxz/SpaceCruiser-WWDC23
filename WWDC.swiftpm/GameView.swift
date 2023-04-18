//
//  GameView.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import SwiftUI

// MARK: Where the game happens

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
            self.backgroundImage = "skyEarth"
            self.groundImage = "groundEarth"
        case .moon:
            self.backgroundImage = "skyMoon"
            self.groundImage = "groundMoon"
        }
    }
    
    var body: some View {
        ZStack {
            Image(backgroundImage)
                .resizable()
            ZStack(){
                VStack {
                    Spacer()
                    Image(groundImage)
                        .resizable()
                        .frame(height: 495)
                        .transformEffect(
                            withAnimation(.spring()){
                                gameViewModel.planetRotation
                            }
                        )
                }
                VStack{
                    Spacer()
                        .frame(height: 50)
                    TimeContainer(time: gameViewModel.secondsPlaying)
                    Spacer()
                    Image(uiImage: images[gameViewModel.index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .transformEffect(gameViewModel.playerRotation)
                    Spacer()
                    Spacer()
                }
            }
            // Changes popup according to game status
            if gameViewModel.showGameOver {
                GameOverView()
            } // game over
            if gameViewModel.showWin {
                WinView()
            } // win
            if gameViewModel.showInstructions {
                VStack{
                    Spacer()
                        .frame(height: 50)
                    InstructionsBanner(timeNedeed: gameViewModel.secondsNeeded)
                    Spacer()
                }
                .onAppear{
                    play("gameMusicGBand")
                }
            } // showing instructions at the beginning
        }
        // Music stops if the game is interrupted
        .onChange(of: gameViewModel.showWin || gameViewModel.showGameOver, perform: { _ in
            player.pause()
        })
        .ignoresSafeArea()
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(level: .earth)
            .environmentObject(dev.gameVM)
    }
}
