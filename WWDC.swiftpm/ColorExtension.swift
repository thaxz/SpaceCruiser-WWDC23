//
//  ColorExtension.swift
//  CruiserTeste
//
//  Created by thaxz on 26/02/23.
//

import Foundation
import SwiftUI

// MARK: Creating a color extension to organize all custom colors used through the game

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    
    let primaryColor = Color("primaryColor")
    let secondaryColor = Color("secondaryColor")
    let terciaryColor = Color("terciaryColor")
    let firstGradientColor = Color("firstGradientColor")
    let secondGradientColor = Color("secondGradientColor")
    
}

