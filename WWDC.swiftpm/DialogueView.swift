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
    
    init(level: GameLevels){
        self.level = level
        switch level {
        case .earth:
            self.background = "dialogueEarthPH"
            self.location = "EARTH STATION"
            self.dialogue = Dialogues().earth
        case .planet:
            self.background = "dialogueMoonPH"
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
                            gameViewModel.gameScene = .gameScreen
                            gameViewModel.setUpGame()
                            dialoguePosition = 0
                            gameViewModel.showWin = false
                        } label: { DialogueSecondaryButton(name: "skip") } .tint(.clear)
                        Spacer()
                        Button {
                            typeWriter()
                            dialoguePosition += 1
                            if dialoguePosition == 7 {
                                dialoguePosition = 0
                                gameViewModel.gameScene = .gameScreen
                                gameViewModel.setUpGame()
                            }
                        } label: { DialoguePrimaryButton(type: gameViewModel.selectedLevel, name: "next") } .tint(.clear)
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
            if position == 0 {
                text = ""
            }
            if position < dialogue[dialoguePosition].count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                    text.append(dialogue[dialoguePosition][position])
                    typeWriter(at: position + 1)
                }
            }
        }
    
}

struct DialoguePrimaryButton: View {
    let type: GameLevels
    let name: String
    var body: some View {
        ZStack{
            Rectangle()
                .border(.white, width: 2)
                .foregroundColor(type == .earth ? Color.theme.mediumPurple : Color.theme.mediumBlue)
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .bold))
        }
        .frame(width: 100 ,height: 40)
    }
}

struct DialogueSecondaryButton: View {
    let name: String
    var body: some View {
        ZStack{
            Rectangle()
                .border(.white, width: 2)
                .foregroundColor(.clear)
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .bold))
        }
        .frame(width: 100 ,height: 40)
    }
}

struct DialogueView_Previews: PreviewProvider {
    static var previews: some View {
        DialogueView(level: .earth)
            .environmentObject(dev.gameVM)
    }
}
