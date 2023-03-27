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
            Image("levelBgPH")
                .resizable()
                VStack(spacing: 20){
                    Spacer()
                    
                    Text("CREDITS")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white)
                    
                    ScrollView(showsIndicators: false) {
                        CreditsSection(haveHeader: true, headerName: "Design", type: "design", source: "some link", author: "someone")
                        
                        CreditsSection(haveHeader: true, headerName: "Sound Effects", type: "design", source: "some link", author: "someone")
                        
                        CreditsSection(haveHeader: true, headerName: "Custom Fonts", type: "design", source: "some link", author: "someone")
                        
                        CreditsSection(haveHeader: true, headerName: "Information", type: "design", source: "some link", author: "someone")
                        
                        CreditsSection(haveHeader: false, headerName: "Anything else", type: "design", source: "some link", author: "someone")
                    }
                    
                    Button {
                        gameViewModel.gameScene = .home
                    } label: { PrimaryButton(name: "Back to Menu", type: .earth) }
                    
                    
                    Spacer()
                        .frame(height: 50)
                }
                .padding(16)
        }
        .ignoresSafeArea()
    }
}

struct CreditsSection: View {
    let haveHeader: Bool
    let headerName: String
    let type: String
    let source: String
    let author: String
    var body: some View {
        VStack(spacing: 8){
            if haveHeader{
                Text(headerName)
                    .font(.system(size: 22, weight: .bold))
            }
            Spacer()
                .frame(height: 8)
            HStack {
                Text("Type:")
                    .font(.system(size: 16, weight: .medium))
                Spacer()
                Text(type)
                    .font(.system(size: 16, weight: .medium))
            }
            HStack {
                Text("Source:")
                    .font(.system(size: 16, weight: .medium))
                Spacer()
                Text(source)
                    .font(.system(size: 16, weight: .medium))
            }
            HStack {
                Text("Author:")
                    .font(.system(size: 16, weight: .medium))
                Spacer()
                Text(author)
                    .font(.system(size: 16, weight: .medium))
            }
            
        } .foregroundColor(.white)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .environmentObject(dev.gameVM)
    }
}
