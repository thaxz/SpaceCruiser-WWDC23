//
//  GameViewModel.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import Foundation
import SwiftUI
import CoreMotion

class GameViewModel: ObservableObject {
    
    @Published var gameScene: GameScenes = .home
    @Published var selectedLevel: GameLevels = .earth
    
    @Published var index = 0
    @Published var secondsPlayed: String = "00"
    @Published var secondsPlaying = 00
    @Published var secondsNeeded: Int = 30
    
    var sprintSheetTimer: Timer?
    var rotationTimer: Timer?
    var startDate: Date?
    var winTimer: Timer?
    var rotationInterval: Double = 4
    
    @Published var isMoving: Bool = false
    @Published var showGameOver: Bool = false
    @Published var showWin: Bool = false
    @Published var showInstructions: Bool = true
    
    @Published var playerRotation = CGAffineTransform(rotationAngle: 0)
    @Published var planetRotation = CGAffineTransform(rotationAngle: 0)
    
    lazy var motionManager = CMMotionManager()
    
    func animateSpaceship() {
            index = 0
            sprintSheetTimer = Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true, block: {_ in
                if self.index < 3 {
                    self.index += 1
                    print(self.index)
                } else if self.sprintSheetTimer != nil {
                    self.index = 0
                    //timer.invalidate()
                }
            })
      }
    
    func changeValues(){
        switch self.selectedLevel {
        case .earth:
            self.secondsNeeded = 30
            self.rotationInterval = 4
        case .planet:
            self.secondsNeeded = 45
            self.rotationInterval = 2
        }
    }
    
    func setUpGame(){
        changeValues()
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
            self.startGame()
            self.showGameOver = false
        }
    }
    
    func pauseGame(){
        secondsPlaying = 00
        showGameOver = false
        isMoving = false
        self.playerRotation = CGAffineTransform(rotationAngle: 0)
        self.planetRotation = CGAffineTransform(rotationAngle: 0)
        motionManager.stopDeviceMotionUpdates()
        self.rotationTimer?.invalidate()
        self.sprintSheetTimer?.invalidate()
        self.winTimer?.invalidate()
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    func startGame(){
        UIApplication.shared.isIdleTimerDisabled = true
        self.showInstructions = true
        self.animateSpaceship()
        secondsPlaying = 00
        self.checkWin()
        showGameOver = false
        isMoving = false
        startDate = Date()

        self.playerRotation = CGAffineTransform(rotationAngle: 0)
        self.planetRotation = CGAffineTransform(rotationAngle: 0)
        
        if motionManager.isDeviceMotionAvailable {
            motionManager.startDeviceMotionUpdates(to: OperationQueue.main) { (data, error) in
                if error == nil {
                    if let data = data {
                        let angle = CGFloat(atan2(data.gravity.x, data.gravity.y) - .pi)
                        self.playerRotation = CGAffineTransform(rotationAngle: angle)
                        if !self.isMoving {
                            self.checkGameOver()
                        }
                    }
                }
            }
        }
      
        rotationTimer = Timer.scheduledTimer(withTimeInterval: self.rotationInterval, repeats: true, block: { (timer) in
            if self.showGameOver == false {
                self.rotateWorld()
            }
        })
        
        Timer.scheduledTimer(withTimeInterval: 6, repeats: false, block: { (timer) in
                self.showInstructions = false
        })
    }
    
    func rotateWorld(){
        let randomAngle = Double(arc4random_uniform(120))/100 - 0.6
        print(randomAngle)
        withAnimation(.spring()){
            isMoving = true
            print("######## IS MOVING")
            planetRotation = CGAffineTransform(rotationAngle: randomAngle)
        }
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
            self.isMoving = false
            print("STOPPED MOVING#####")
        })
    }
    
    func checkWin(){
        winTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { time in
            if self.secondsPlaying < self.secondsNeeded {
                self.secondsPlaying += 1
                print("\(self.secondsPlaying) SEGUNDOS" )
            } else {
                print("WIN#######333333")
                self.showWin = true
                self.pauseGame()
                self.secondsPlaying = 0
            }
        }
    }
    
    func checkGameOver(){
        let worldAngle = atan2(Double(planetRotation.a), Double(planetRotation.b))
        let playerAngle = atan2(Double(playerRotation.a), Double(playerRotation.b))
        let difference = abs(worldAngle - playerAngle)
        
        if difference > 0.35 {
            pauseGame()
            if let startDate = startDate {
                secondsPlayed = String(format: "%.2f", Date().timeIntervalSince(startDate))
            }
            showInstructions = false
            showGameOver = true
            print("GAME OVER!!!!!1")
        }
    }
    
    func playAgain(){
        startGame()
    }
    
}
