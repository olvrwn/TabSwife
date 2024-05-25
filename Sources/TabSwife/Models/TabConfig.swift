//
//  TabConfig.swift
//
//
//  Created by Oliver Dieke on 24.03.24.
//

import SwiftUI

/// Configuration of the TabSwift tab navigation system
struct TabConfig {
    
    /// All tabs that will be shown within the TabSwife tab navigation system and their metadata
    let tabs: [Tab]
    /// Buttons that will be shown bottom centered on top of the tabs content, starting with index 0 to max
    let buttons: [AnyView]?
    /// Styling of the TabSwife tab navigation system
    let style: TabStyle
}



// MARK: - Mock

extension TabConfig {
    
    static let mock: Self = .init(
        tabs: [.mock1, .mock2, .mock3],
        buttons: [
            AnyView(button)
        ],
        style: .mock
    )
    
    private static let button: some View = {
        
        Button {
            print("pressed")
        } label: {
            Text("I'm a button")
        }
        .buttonStyle(.borderedProminent)
    }()
}
