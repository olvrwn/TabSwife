//
//  TabStyle.swift
//
//
//  Created by Oliver Dieke on 24.05.24.
//

import SwiftUI

/// Styling of the TabSwife tab navigation system
struct TabStyle {
    
    /// Color for the name  of the currently selected tab
    var activeColor: Color = .primary
    /// Color for all names of currently not selected tabs
    var inactiveColor: Color = .secondary
    /// Color for the background, visible around the tab and buttons and within the safe area
    var backgroundColor: Color = .clear
    /// Font of the tab names
    var font: Font = .title
    /// Spacing and padding of the top navigation bar and bottom buttons bar
    var spacing: CGFloat = 8
}

// MARK: - Mock

extension TabStyle {
    
    static let mock: Self = .init(
        activeColor: .green,
        inactiveColor: .red,
        backgroundColor: .indigo
    )
}
