//
//  DialogueView.swift
//  CruiserTeste
//
//  Created by thaxz on 22/02/23.
//

import SwiftUI

struct DialogueView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    
    let level: GameLevels
    let dialogue: [String]
    var background: String
    var location: String
    @State var text: String = ""
    @State var dialoguePosition: Int = 0
    
    @State var isAnimating: Bool = false
    
    init(level: GameLevels){
        self.level = level
        switch level {
        case .earth:
            self.background = "labEarth"
            self.location = "EARTH STATION"
            self.dialogue = Dialogues().earth
        case .planet:
            self.background = "labMoon"
            self.location = "PLANET STATION"
            self.dialogue = Dialogues().planet
        }
    }
    
    var body: some View {
        ZStack{
            Image(background)
                .resizable()
            VStack(){
                Spacer()
                    .frame(height: 60)
                LocationContainer(type: gameViewModel.selectedLevel)
                Spacer()
                VStack(spacing: 24){
                    DialogueContainer(text: text, type: gameViewModel.selectedLevel)
                    HStack {
                        Button {
                            if !isAnimating {
                                gameViewModel.gameScene = .gameScreen
                                gameViewModel.setUpGame()
                                dialoguePosition = 0
                                gameViewModel.showWin = false
                            }
                        } label: { SmallSecondaryButton(name: "skip", width: 100, heigth: 40) } .tint(.clear)
                        Spacer()
                        Button {
                            if !isAnimating {
                                typeWriter()
                                dialoguePosition += 1
                                if dialoguePosition == 7 {
                                    dialoguePosition = 0
                                    gameViewModel.showWin = false
                                    gameViewModel.gameScene = .gameScreen
                                    gameViewModel.setUpGame()
                                }
                            }
                        } label: { SmallPrimaryButton(name: "next", width: 100, heigth: 40) } .tint(.clear)
                    }
                    Spacer()
                        .frame(height: 20)
                } .padding(.horizontal, 16)
            }
        }
        .ignoresSafeArea()
        .onAppear{
            typeWriter()
            gameViewModel.pauseGame()
        }
    }
    
    
    func typeWriter(at position: Int = 0) {
        isAnimating = true
            if position == 0 {
                text = ""
            }
            if position < dialogue[dialoguePosition].count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.015) {
                    text.append(dialogue[dialoguePosition][position])
                    typeWriter(at: position + 1)
                }
            }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isAnimating = false
        }
        }
    
}


struct DialogueView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueView(level: .earth)
            .environmentObject(dev.gameVM)
    }
}
