//
//  Components.swift
//  CruiserTeste
//
//  Created by thaxz on 26/02/23.
//

import Foundation
import SwiftUI

// MARK: Creating components in order to build reusable blocks of functionality and making code modular


// Gradient that is used on CreditsView, ReportView and TutorialView
struct GameGradient: View{
    var body: some View {
        LinearGradient(colors: [Color.theme.firstGradientColor, Color.theme.secondGradientColor], startPoint: .top, endPoint: .bottom)
    }
}

// Container that holds the dialogue and it's used on DialogueView
struct DialogueContainer: View {
    var text: String
    let type: GameLevels
    var body: some View {
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.secondaryColor)
                .opacity(0.80)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white, lineWidth: 3)
                )
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding(16)
        }
        .frame(height: 140)
    }
}

// Customizable container that displays available levels and it's used on LevelsView
struct LevelContainer: View {
    let type: GameLevels
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 24)
                    .frame(width: 150,height: 150)
                    .foregroundColor(Color.theme.secondaryColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(.white, lineWidth: 3)
                            .shadow(color: .white, radius: 1)
                    )
                Image(type == .earth ? "earthPlanet" : "moonPlanet")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .scaledToFit()
            }
            Text(type == .earth ? "Earth" : "Moon")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
        }
    }
}

// Customizable container that displays tutorial illustrations and it's used on TutorialView
struct TutorialContainer: View {
    let type: Int
    var body: some View {
        ZStack(alignment: type == 0 ? .bottomLeading : .bottom){
            ZStack(alignment: .bottomTrailing){
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 150,height: 150)
                    .foregroundColor(Color.theme.primaryColor.opacity(0.30))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.white, lineWidth:3)
                )
                Image(type == 0 ? "xmarkPH" : "checkmarkPH")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .offset(x: 10, y: 15)
            }
                Image(type == 0 ? "wrongTutorial" : "rightTutorial")
                    .resizable()
                    .scaledToFit()
        }
        .frame(width: 150,height: 150)
    }
}

// Customizable container that displays selected level location and it's used on DialogueView
struct LocationContainer: View {
    let type: GameLevels
    var body: some View{
        HStack {
            Text(type == .earth ? "EARTH SPACE STATION" : "MOON SPACE STATION")
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 55)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(Color.theme.secondaryColor)
                    )
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.5), radius: 3)
            Spacer()
                .frame(width: 60)
        }
    }
}

// Component that displays how much time you need to play according to each level. It's used on GameView
struct InstructionsBanner: View {
    let timeNedeed: Int
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 24)
                .foregroundColor(Color.theme.secondaryColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.theme.terciaryColor, lineWidth: 1))
            VStack {
                    Text("Tilt for \n \(timeNedeed) seconds")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .heavy))
                    .multilineTextAlignment(.center)
                HStack{
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .frame(width: 28, height: 23)
                        .foregroundColor(.white)
                    Spacer()
                        .frame(width: 40)
                    Image(systemName: "arrow.forward")
                        .resizable()
                        .frame(width: 28, height: 23)
                        .foregroundColor(.white)
                }
            }
        }
        .frame(width: 250,height: 150)
    }
}


struct ComponentsTest_PreviewProvider: PreviewProvider {
    static var previews: some View {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack {
                    DialogueContainer(text: "Testing dialogue", type: .planet)
                    HStack{
                        LevelContainer(type: .earth)
                        TutorialContainer(type: 1)
                    }
                    LocationContainer(type: .earth)
                    InstructionsBanner(timeNedeed: 2)
                }
            }
    }
}
