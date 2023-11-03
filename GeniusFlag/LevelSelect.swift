//
//  LevelSelect.swift
//  GeniusFlag
//
//  Created by Миржигит Суранбаев on 2/11/23.
//

import SwiftUI

struct LevelSelect: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
     Text("ВЫБЕРИТЕ РЕЖИМ")
        
        
    }
}

#Preview {
    LevelSelect(isShowing: .constant(true))
}
