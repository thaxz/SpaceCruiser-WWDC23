//
//  StringExtension.swift
//  CruiserTeste
//
//  Created by thaxz on 24/03/23.
//

import Foundation
import SwiftUI

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
