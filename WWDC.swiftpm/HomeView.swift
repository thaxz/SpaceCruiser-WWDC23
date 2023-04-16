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
            VStack(spacing: 20){
                Spacer()
                    .frame(height: 30)
                Image("gameLogo")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical, 16)
                Spacer()
                
                
                PrimaryButton(action: {
                    gameViewModel.gameScene = .levels
                }, name: "Play")
                
                SecondaryButton(action: {
                    gameViewModel.gameScene = .tutorial
                }, name: "Tutorial")
                
                SecondaryButton(action: {
                    gameViewModel.gameScene = .tutorial
                }, name: "Credits")
                
                Spacer()
                    .frame(height: 30)
//                Button {
//                    gameViewModel.gameScene = .credits
//                } label: {
//                    ZStack{
//                        Text("credits")
//                            .foregroundColor(.black)
//                            .font(.system(size: 22, weight: .bold)).underline()
//                    } .tint(.clear)
//                    .frame(height: 50)
//                }
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
