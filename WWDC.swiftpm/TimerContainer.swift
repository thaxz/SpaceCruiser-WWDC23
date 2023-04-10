//
//  TimerContainer.swift
//  WWDC
//
//  Created by thaxz on 09/04/23.
//

import Foundation
import SwiftUI

struct TimeContainer: View {
    var time: Int
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 135, height: 70)
                .foregroundColor(Color.theme.primaryColor.opacity(0.30))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.white, lineWidth: 2)
            )
            VStack(spacing: 4){
                if time >= 10 {
                    Text("00:\(time)")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                } else {
                    Text("00:0\(time)")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.white)
                }
                Text("seconds left")
                    .font(.system(size: 15, weight: .regular))
                    .foregroundColor(.white)
            }
        }
    }
}
