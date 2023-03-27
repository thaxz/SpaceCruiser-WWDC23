//
//  RelatoryView.swift
//  CruiserTeste
//
//  Created by thaxz on 12/03/23.
//

import SwiftUI

struct RelatoryView: View {
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
        case .planet:
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
            Color.theme.darkerPurple
                .ignoresSafeArea()
            VStack(spacing: 30){
                Text(title)
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(.white)
                
                Image(image)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20){
                        RelatorySection(title: "About", textBody: aboutText)
                        
                        RelatorySection(title: "Surface", textBody: surfaceText)
                        
                        Text("Characteristics")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        
                        VStack(spacing: 10){
                            CollectedInfo(text: "Atmosphere:", info: atmosphere)
                            CollectedInfo(text: "Surface Gravity:", info: gravity)
                            CollectedInfo(text: "Surface Pressure:", info: pressure)
                            CollectedInfo(text: "Orbital Speed:", info: speed)
                            CollectedInfo(text: "Orbital Period:", info: period)
                        }
                    }
                }
                    
                Button {
                    gameViewModel.gameScene = .home
                } label: { PrimaryButton(name: "Main Menu", type: .earth) }
                Spacer()

            }
            .padding(20)
        }
    }
}

struct RelatorySection: View {
    let title: String
    let textBody: String
    var body: some View {
        VStack(spacing: 20){
            Text(title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
            Text(textBody)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct CollectedInfo: View{
    let text: String
    let info: String
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Spacer()
            Text(info)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct RelatoryView_Previews: PreviewProvider {
    static var previews: some View {
        RelatoryView(level: .earth)
            .environmentObject(dev.gameVM)
    }
}
