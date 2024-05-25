//
//  Tab.swift
//
//
//  Created by Oliver Dieke on 24.03.24.
//

import SwiftUI

/// A tab within the TabSwife tab navigation system
struct Tab: Identifiable {
    
    /// UUID, will be initialized automatically
    let id = UUID()
    /// The name of the tab, will be displayed and, if selected, hihlighted on top of the tabs
    let name: String
    /// The actual view
    let content: AnyView
}

// MARK: - Mock

extension Tab {
    
    static let mock1: Self = .init(name: "one", content: AnyView(TabOne()))
    static let mock2: Self = .init(name: "two", content: AnyView(TabTwo()))
    static let mock3: Self = .init(name: "three", content: AnyView(TabThree()))
    
    private struct TabOne: View {
        
        var body: some View {
            
            ScrollView {
                
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFill()
                
                Text("Hello, World! This is a text which is a bit longer just to try out some limits of my FIRST LIBRARY WOOHOOO lets go!! I am just listening to Charli XCX' boiler room set and theres the part of A. G. Cook and holy sh!t he's cooking !!!")
                
                Image(systemName: "party.popper")
                
                HStack {
                    
                    Image(systemName: "party.popper")
                    Image(systemName: "party.popper")
                }
                
                HStack {
                    
                    Rectangle()
                        .fill(.cyan)
                        .frame(minHeight: 150)
                    Rectangle()
                        .fill(.teal)
                        .frame(minHeight: 250)
                }
            }
            .background(Color.yellow)
        }
    }
    
    private struct TabTwo: View {
        
        var body: some View {
            
            VStack {
                
                Text("This is the second tab with a bit less text")
                
                Image(systemName: "plus")
                    .background(.green)
            }
        }
    }
    
    private struct TabThree: View {
        
        var body: some View {
            
            Rectangle()
                .fill(.brown)
        }
    }
}
