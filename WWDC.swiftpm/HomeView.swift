//
//  HomeView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            Image("initialBackground")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing: 20){
//                Spacer()
//                    .frame(height: 30)
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
                
//                Spacer()
//                    .frame(height: 30)

            }
            .padding(16)
            .padding(.bottom, 16)
        }
        //.ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(dev.gameVM)
    }
}
