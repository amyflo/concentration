//
//  concentrationApp.swift
//  concentration
//
//  Created by Amy Lo on 7/16/21.
//

import SwiftUI

@main
struct concentrationApp: App {
    let game = EmojiConcentrationGame()
    
    var body: some Scene {
        WindowGroup{
            ContentView(viewModel: game)
        }
    }
}
