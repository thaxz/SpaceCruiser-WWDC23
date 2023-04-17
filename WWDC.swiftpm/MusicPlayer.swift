//
//  SoundEffects.swift
//  WWDC
//
//  Created by thaxz on 07/04/23.
//

import Foundation
import AVFoundation
import MediaPlayer
import SwiftUI

var player: AVAudioPlayer!

// MARK: Play music

func play(_ sound: String) {
    let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
    guard url != nil else {
        return
    }
    do {
        player = try AVAudioPlayer(contentsOf: url!)
        player.volume = 1
        if sound == "musicaTest"{
            player?.play()
            player.numberOfLoops = -1
        } else {
            player?.play()
        }
    } catch {
        print("error")
    }
}


