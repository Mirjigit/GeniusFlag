//
//  GameSettings.swift
//  GeniusFlag
//
//  Created by Миржигит Суранбаев on 11/11/23.
//

import Foundation
import SwiftUI

class GameSettings: ObservableObject {
    @Published var score = 0
    @Published var showingResultView = false

    func resetGame() {
        score = 0
        showingResultView = false
    }
}
