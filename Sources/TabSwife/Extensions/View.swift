//
//  View.swift
//
//
//  Created by Oliver Dieke on 30.03.24.
//

import SwiftUI

// HUGE THANKS TO THIS LEGEND ON STACKOVERFLOW https://stackoverflow.com/a/60643762/17660037

extension View {
    
    func rectReader(_ binding: Binding<CGRect>, in space: CoordinateSpace) -> some View {
        
        self.background(GeometryReader { (geometry) -> AnyView in
            
            let rect = geometry.frame(in: space)
            DispatchQueue.main.async {
                binding.wrappedValue = rect
            }
            return AnyView(Rectangle().fill(Color.clear))
        })
    }
}

extension View {
    
    func ifVisible(in rect: CGRect, in space: CoordinateSpace, execute: @escaping (CGRect) -> Void) -> some View {
        
        self.background(GeometryReader { (geometry) -> AnyView in
            
            let frame = geometry.frame(in: space)
            if frame.intersects(rect) {
                execute(frame)
            }
            return AnyView(Rectangle().fill(Color.clear))
        })
    }
}
