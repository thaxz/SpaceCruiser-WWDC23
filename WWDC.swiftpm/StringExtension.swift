//
//  StringExtension.swift
//  CruiserTeste
//
//  Created by thaxz on 24/03/23.
//

import Foundation
import SwiftUI

// MARK: The extension adds a subscript and The subscript takes an offset parameter of type Int and returns the corresponding character at the specified position. It's used on the TypeWritter effect

extension String {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
