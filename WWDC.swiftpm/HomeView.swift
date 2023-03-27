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
            Color.theme.darkerPurple
            Image("mainMenuPH")
                .resizable()
            VStack(spacing: 20){
                Spacer()
                    .frame(height: 30)
                Text("SOME BIG NAME")
                    .font(.system(size: 64, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Spacer()
                Button {
                    gameViewModel.gameScene = .levels
                } label: { PrimaryButton(name: "Play", type: .earth) }
                
                Button {
                    gameViewModel.gameScene = .tutorial
                } label: { SecondaryButton(name: "Tutorial") } .tint(.clear)
                Spacer()
                    .frame(height: 20)
                Button {
                    gameViewModel.gameScene = .credits
                } label: {
                    ZStack{
                        Text("credits")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .bold)).underline()
                    } .tint(.clear)
                    .frame(height: 50)
                }
            }
            .padding(16)
            .padding(.bottom, 16)
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(dev.gameVM)
    }
}
