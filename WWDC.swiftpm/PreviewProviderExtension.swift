//
//  PreviewProviderExtension.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview{
        return DeveloperPreview.shared
    }
    
}

class DeveloperPreview {
    // Creating singleton
    static let shared = DeveloperPreview()
    private init() {}
    // To acess ViewModel in providers
    let gameVM = GameViewModel()
    
}
