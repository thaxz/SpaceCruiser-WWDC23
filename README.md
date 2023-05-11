# Space Cruiser - WWDC Scholarship Application [ACCEPTED] 

The Swift Playgound App was created for <a href="https://developer.apple.com/wwdc23/swift-student-challenge/">WWDDC23 Swift Student Challenge</a>

## Introduction

Space Cruiser is a pixel art-style game where the player is a pilot who has been selected for a space exploration program. The player's mission is to visit different planets, and even our moon, to gather information about them. The spaceship is controlled by tilting your device, which adds a level of immersion to the game. The player must navigate through each planet's unique environment and maintain control of your ship for a specific amount of time before moving on to the next one.

## Project

This app was built with SwiftUI and utilizes the framework of CoreMotion, as well as the MVVM architecture. It was my first time working with all of these technologies, and creating every pixel art asset was a challenging (yet rewarding) experience.
Space Cruiser's logic involves piloting a spacecraft and the device's motion is used to control the ship's rotation. The formula for rotating the player involves checking if the motionManager is available and then using the gravity data to calculate the device's orientation based on its accelerometer. To be more specific, using the 'atan2(_:_)' function to calculate the angle between the device's (x, y) accelerations and subtracting π to get radians from it. Then, the resulting angle is then converted to a CGFloat and used to set the spaceship rotation property, finally is a CGAffineTransform that applies a rotation transformation to the spachip.  
   
## How to play

First, download the code project and open the app in Xcode/Playground. After that, since this game needs the accelerometer data, you need to built on an actual device.

## Credits
- "Close Icon" by Pixel Perfect (https://www.flaticon.com/free-icons/close)
- "Tick Icon" by Icon Wind (https://www.flaticon.com/free-icons/tick)
- "Nancy Grace Biography" by Nasa (https://solarsystem.nasa.gov/people/225/nancy-roman-1925-2018/)
- "Mae Jemison Biography" by Kerri Lee Alexander (https://www.womenshistory.org/education-resources/biographies/mae-jemison)
- "Earth Characteristics" by Nasa (https://solarsystem.nasa.gov/planets/earth/overview/)
- "Moon Characteristics" by Nasa (https://solarsystem.nasa.gov/moons/earths-moon/overview/)
- "Background Music" by Thaís Monteiro, using Garage Band (Owner)
-  Besides, every other asset was totally made by Thaís Monteiro (Owner)
