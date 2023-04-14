//
//  CreditsView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct CreditsView: View {
    @EnvironmentObject var gameViewModel: GameViewModel
    var body: some View {
        ZStack{
            GameGradient()
                .ignoresSafeArea()
                VStack(spacing: 20){
                    
                    Text("CREDITS")
                        .font(.system(size: 42, weight: .bold))
                        .foregroundColor(.white)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 16){
                            CreditsSection(haveHeader: true, headerName: "Design", type: "design", source: "some link", author: "someone")
                            
                            CreditsSection(haveHeader: true, headerName: "Sound Effects", type: "design", source: "some link", author: "someone")
                            
                            CreditsSection(haveHeader: true, headerName: "Custom Fonts", type: "design", source: "some link", author: "someone")
                            
                            CreditsSection(haveHeader: true, headerName: "Information", type: "design", source: "some link", author: "someone")
                            
                            CreditsSection(haveHeader: false, headerName: "Anything else", type: "design", source: "some link", author: "someone")
                        }
                    }
                    PrimaryButton(action: {
                        gameViewModel.gameScene = .home
                    }, name: "Main Menu")
                    
                    
                }
                .padding(16)
        }
    }
}

struct CreditsSection: View {
    let haveHeader: Bool
    let headerName: String
    let type: String
    let source: String
    let author: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.primaryColor.opacity(0.30))
                .overlay (
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.theme.terciaryColor, lineWidth: 2)
                )
            VStack(alignment: .leading, spacing: 8){
                if haveHeader{
                    HStack{
                        Text(headerName)
                            .font(.system(size: 22, weight: .semibold))
                        Spacer()
                    }
                    Spacer()
                        .frame(height: 4)
                }
               
                HStack {
                    Text("Type:")
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(type)
                        .font(.system(size: 16, weight: .regular))
                }
                HStack {
                    Text("Source:")
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(source)
                        .font(.system(size: 16, weight: .regular))
                }
                HStack {
                    Text("Author:")
                        .font(.system(size: 16, weight: .regular))
                    Spacer()
                    Text(author)
                        .font(.system(size: 16, weight: .regular))
                }
            }
            .padding(16)
            .foregroundColor(.white)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .environmentObject(dev.gameVM)
    }
}
