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
                .background(.thinMaterial)
                .ignoresSafeArea()
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(Color.theme.secondaryColor)
                
                VStack(spacing: 8){
                    Spacer()
                    Text("MISSION COMPLETED")
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
                        VStack(spacing: 16){
                            Text("Congratulations! You had a nice flight")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                            
                            Image("winImage")

                            
                            Text("Check your relatory to see the information you've collected")
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.white)
                        }
                        .padding(22)
                    }
                    .frame(height: 350)
                    
                    Spacer()
                    
                    HStack{
                        Button {
                            gameViewModel.showGameOver = false
                            gameViewModel.pauseGame()
                            gameViewModel.gameScene = .home
                        } label: { SmallSecondaryButton(name: "Main Menu", width: 150, heigth: 50 )}
                        
                        Spacer()
                            .frame(width: 16)
                        
                        Button {
                            gameViewModel.showGameOver = false
                            gameViewModel.pauseGame()
                            gameViewModel.gameScene = .relatory
                        } label: { SmallPrimaryButton(name: "See Relatory", width: 150, heigth: 50 )} .tint(.clear)
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

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
            WinView()
                .environmentObject(dev.gameVM)
        }
    }
}
