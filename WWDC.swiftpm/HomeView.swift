//
//  HomeView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

// MARK: Initial screen of the game

struct HomeView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Image("initialBackground")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 20){
                Image("gameLogo")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, 16)
                Spacer()
        
                PrimaryButton(action: {
                    gameViewModel.gameScene = .tutorial
                }, name: "Play")
                
                SecondaryButton(action: {
                    gameViewModel.gameScene = .credits
                }, name: "Credits")
            }
            .padding(16)
            .padding(.bottom, 16)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(dev.gameVM)
    }
}
