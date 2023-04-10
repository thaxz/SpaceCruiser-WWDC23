//
//  Buttons.swift
//  WWDC
//
//  Created by thaxz on 10/04/23.
//

import Foundation
import SwiftUI

struct PrimaryButton: View {
    let name: String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.primaryColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white, lineWidth: 2)
                )
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
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.secondaryColor.opacity(0.30))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white, lineWidth: 2)
                )
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .bold))
        }
        .frame(height: 50)
    }
}

struct SmallPrimaryButton: View {
    let name: String
    let width: CGFloat
    let heigth: CGFloat
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(Color.theme.primaryColor)
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.white, lineWidth: 2)
                )
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .bold))
        }
        .frame(width: width ,height: heigth)
    }
}

struct SmallSecondaryButton: View {
    let name: String
    let width: CGFloat
    let heigth: CGFloat
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color.theme.secondaryColor.opacity(0.30))
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.white, lineWidth: 2)
                )
            Text(name)
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .bold))
        }
        .frame(width: width ,height: heigth)
    }
}

struct Buttons_PreviewProvider: PreviewProvider {
    static var previews: some View {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack {
                    SmallPrimaryButton(name: "small", width: 100, heigth: 40)
                    SmallSecondaryButton(name: "medium", width: 150, heigth: 50)
                    PrimaryButton(name: "primary")
                    SecondaryButton(name: "secondary")
                }
            }
        
    }
}
