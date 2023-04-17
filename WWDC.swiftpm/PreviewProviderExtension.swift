//
//  PreviewProviderExtension.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import Foundation
import SwiftUI

// MARK: Creating singleton to acess GameViewModel on PreviewProviders

extension PreviewProvider {
    
    static var dev: DeveloperPreview{
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    private init() {}
    let gameVM = GameViewModel()
}
