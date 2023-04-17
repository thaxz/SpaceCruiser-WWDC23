//
//  ReportView.swift
//  CruiserTeste
//
//  Created by thaxz on 12/03/23.
//

import SwiftUI

// MARK: Report screen that appears if the player wins the game.

struct ReportView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    let level: GameLevels
    let data: PlanetsInfo = PlanetsInfo()
    
    let title: String
    let image: String
    let aboutText: String
    let surfaceText: String
    let atmosphere: String
    let gravity: String
    let pressure: String
    let speed: String
    let period: String
    
    init(level: GameLevels){
        self.level = level
        switch level {
        case .earth:
            self.title = data.earthTitle
            self.image = data.earthImage
            self.aboutText = data.aboutEarth
            self.surfaceText = data.earthSurface
            self.atmosphere = data.earthAtmosphere
            self.gravity = data.earthGravity
            self.pressure = data.earthPressure
            self.speed = data.earthSpeed
            self.period = data.earthPeriod
        case .moon:
            self.title = data.moonTitle
            self.image = data.moonImage
            self.aboutText = data.aboutMoon
            self.surfaceText = data.moonSurface
            self.atmosphere = data.moonAtmosphere
            self.gravity = data.moonGravity
            self.pressure = data.moonPressure
            self.speed = data.moonSpeed
            self.period = data.moonPeriod
        }
    }
    
    var body: some View {
        ZStack {
            GameGradient()
                .ignoresSafeArea()
            VStack(spacing: 30){
                HStack(spacing: 16){
                        Image(image)
                            .resizable()
                            .frame(width: 110, height: 110)
                            .scaledToFit()
                        
                    Text(title)
                        .font(.system(size: 40, weight: .heavy))
                        .foregroundColor(.white)
                }
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20){
                        ReportSection(title: "About", textBody: aboutText)
                        ReportSection(title: "Surface", textBody: surfaceText)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .foregroundColor(Color.theme.primaryColor.opacity(0.30))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.theme.terciaryColor, lineWidth: 1)
                                )
                            VStack(alignment: .leading, spacing: 12){
                                Text("Characteristics")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundColor(.white)
                                
                                    CollectedInfo(text: "Atmosphere:", info: atmosphere)
                                    CollectedInfo(text: "Surface Gravity:", info: gravity)
                                    CollectedInfo(text: "Surface Pressure:", info: pressure)
                                    CollectedInfo(text: "Orbital Speed:", info: speed)
                                    CollectedInfo(text: "Orbital Period:", info: period)
                            }
                            .padding(16)
                        }
                    }
                }                    
                PrimaryButton(action: {
                    gameViewModel.gameScene = .home
                }, name: "Main Menu")
            }
            .padding(20)
        }
    }
}

struct ReportSection: View {
    let title: String
    let textBody: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.primaryColor.opacity(0.30))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.theme.terciaryColor, lineWidth: 1)
                )
            VStack(alignment: .leading,spacing: 8){
                Text(title)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.white)
                Text(textBody)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(.white)
            }
            .padding(16)
        }
    }
}

struct CollectedInfo: View{
    let text: String
    let info: String
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
            Spacer()
            Text(info)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(.white)
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView(level: .earth)
            .environmentObject(dev.gameVM)
    }
}
