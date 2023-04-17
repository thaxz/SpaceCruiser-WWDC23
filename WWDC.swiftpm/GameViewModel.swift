//
//  GameViewModel.swift
//  CruiserTeste
//
//  Created by thaxz on 16/02/23.
//

import SwiftUI
import CoreMotion
import AVFoundation

// MARK: - Main ViewModel that was used for coordinating the logic of the game

class GameViewModel: ObservableObject {
    
    @Published var gameScene: GameScenes = .home
    @Published var selectedLevel: GameLevels = .earth
    
    @Published var index = 0
    @Published var secondsPlayed: String = "00"
    @Published var secondsPlaying = 00
    @Published var secondsNeeded: Int = 00
    
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
  
    // Responsible for running the spaceship spritesheet animation
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
    
    // Changing values according to each level
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
    
    // Called to setup the game
    func setUpGame(){
        changeValues()
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { (timer) in
            self.startGame()
            self.showGameOver = false
        }
    }
    
    // Invalidate timers and pause game
    func pauseGame(){
        secondsPlaying = secondsNeeded
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
    
    // Starts gamelogic
    func startGame(){
        UIApplication.shared.isIdleTimerDisabled = true
        self.showInstructions = true
        self.animateSpaceship()
        secondsPlaying = secondsNeeded
        self.checkWin()
        showGameOver = false
        isMoving = false
        startDate = Date()

        // Setting angles to 0
        self.playerRotation = CGAffineTransform(rotationAngle: 0)
        self.planetRotation = CGAffineTransform(rotationAngle: 0)
        
        rotatePlayer()
      
        // Rotates planet according to timer
        rotationTimer = Timer.scheduledTimer(withTimeInterval: self.rotationInterval, repeats: true, block: { (timer) in
            if self.showGameOver == false {
                self.rotateWorld()
            }
        })
        
        Timer.scheduledTimer(withTimeInterval: 6, repeats: false, block: { (timer) in
                self.showInstructions = false
        })
    }
    
    // Updates the rotation of the player based on the current values of the accelerometer data. Calculates the angle using the atan2 function with the x and y values of the accelerometer data and subtracts pi to obtain the correct orientation.
    // The calculated angle is then used to update the rotation of the player
    func rotatePlayer(){
        // Checks if motionManager is avaliable
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
    }
    
    // Generates a random angle value in radians between -0.6 and 0.6 and uses to rotate the planet
    func rotateWorld(){
        let randomAngle = Double(arc4random_uniform(120))/100 - 0.6
        print(randomAngle)
        withAnimation(.spring()){
            isMoving = true
            print("Is moving!")
            planetRotation = CGAffineTransform(rotationAngle: randomAngle)
        }
        Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false, block: { (timer) in
            self.isMoving = false
            print("Stopped moving!")
        })
    }
    
    // Checks if the player has been playing for the maximum time. If the limit has been reached, showWin is triggered.
    func checkWin(){
        winTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { time in
            if self.secondsPlaying > 0 {
                self.secondsPlaying -= 1
                print("\(self.secondsPlaying) SEGUNDOS" )
            } else {
                print("WIN#######333333")
                self.showWin = true
                self.pauseGame()
                self.secondsPlaying = 0
            }
        }
    }
    
    // Checks if the difference between the player's angle and the world angle is within the allowed range.
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
        }
    }
    
    func playAgain(){
        startGame()
    }
    
}
