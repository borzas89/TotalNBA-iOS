//
//  Color.swift
//  TotalNBA
//
//  Created by Borza Zsolt on 2022. 12. 19..
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    static let launch = LaunchTheme()
    
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let secondaryText = Color("SecondaryTextColor")
    let splash = Color("SplashColor")
    let teamBlue = Color("TeamBlue")
    let teamGreen = Color("TeamGreen")
    let teamOrange = Color("TeamOrange")
    let teamPurple = Color("TeamPurple")
    let teamRed = Color("TeamRed")
    let teamWine = Color("TeamWine")
}

struct LaunchTheme {
    let accent = Color("LaunchAccentColor")
    let background = Color("LaunchBackgroundColor")
}

