//
//  Components.swift
//  CruiserTeste
//
//  Created by thaxz on 26/02/23.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    let name: String
    let type: GameLevels
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(type == .earth ? Color.theme.mediumPurple : Color.theme.mediumBlue)
                .border(.white, width: 2)
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .bold))
        }
        .frame(height: 50)
    }
}

struct SecondaryButton: View {
    let name: String
    var body: some View {
        ZStack{
            Rectangle()
                .border(.white, width: 2)
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .bold))
        }
        .frame(height: 50)
    }
}

struct DialogueContainer: View {
    var text: String
    let type: GameLevels
    var body: some View {
        ZStack(alignment: .topLeading){
            Rectangle()
                .foregroundColor(type == .earth ? Color.theme.darkerPurple : Color.theme.darkerBlue)
                .opacity(0.80)
                .border(.white, width: 3)
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
                .padding(16)
        }
        .frame(height: 140)
    }
}

struct LevelContainer: View {
    let type: GameLevels
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150,height: 150)
                    .foregroundColor(Color.theme.darkerGray)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.white, lineWidth: 2)
                            .shadow(color: .white, radius: 5)
                    )
                Image(type == .earth ? "earthPH" : "moonPH")
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

struct TutorialContainer: View {
    let type: Int
    var body: some View {
        ZStack(alignment: type == 0 ? .bottomLeading : .bottom){
            ZStack(alignment: .bottomTrailing){
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150,height: 150)
                    .foregroundColor(Color.theme.darkerPurple)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(.white, lineWidth: 2)
                )
                Image(type == 0 ? "xmarkPH" : "checkmarkPH")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .offset(x: 10, y: 15)
            }
                Image(type == 0 ? "wrongSpaceshipPH" : "rightSpaceshipPH")
                    .resizable()
                    .frame(
                        width: type == 0 ? 110 : 70,
                        height: type == 0 ? 100 : 85)
                    .scaledToFit()
        }
    }
}

struct LocationContainer: View {
    let type: GameLevels
    var body: some View{
        HStack {
            Text(type == .earth ? "EARTH SPACE STATION" : "MOON SPACE STATION")
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .center)
                .frame(height: 55)
                .background(type == .earth ? Color.theme.darkerPurple : Color.theme.darkerBlue)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 3)
            Spacer()
                .frame(width: 60)
        }
    }
}

struct InstructionsBanner: View {
    let timeNedeed: Int
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(.black.opacity(0.80))
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(.white, lineWidth: 2))
            ZStack {
                HStack{
                    Image("leftArrow")
                    Spacer()
                    Image("rightArrow")
                } .padding(4)
                
                HStack {
                    Spacer()
                    Text("TILT FOR \n \(timeNedeed) \n SECONDS")
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .bold))
                    .multilineTextAlignment(.center)
                    Spacer()
                }
            }
        }
        .frame(width: 260,height: 150)
    }
}

struct ComponentsTest_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack {
                PrimaryButton(name: "Primary", type: .earth)
                SecondaryButton(name: "Secondary")
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
