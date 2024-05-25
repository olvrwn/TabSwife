//
//  TabSwife.swift
//
//
//  Created by Oliver Dieke on 24.03.24.
//

import SwiftUI

struct TabSwife: View {
    
    // MARK: - Public Properties
    
    let tabConfig: TabConfig
    
    // MARK: - Private Properties
    
    @State private var currentTab: Int = 0
    @State private var scrollToTab: Int? = nil
    @State private var visibleRect: CGRect = .zero
    
    // MARK: - Body
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            self.topNavigationBar
            
            ZStack {
                
                self.tabs
                
                VStack {
                    
                    Spacer()
                    self.bottomButtons
                        .padding()
                }
            }
        }
        .background(self.tabConfig.style.backgroundColor)
        .ignoresSafeArea(.all, edges: .bottom)
    }
    
    // MARK: - Subviews
    
    var topNavigationBar: some View {
        
        HStack(spacing: self.tabConfig.style.spacing) {
            
            ForEach(0 ..< self.tabConfig.tabs.count, id: \.self) { index in
                
                Text(self.tabConfig.tabs[index].name)
                    .foregroundStyle(index == self.currentTab ? self.tabConfig.style.activeColor : self.tabConfig.style.inactiveColor)
                    .font(self.tabConfig.style.font)
                    .onTapGesture {
                        self.scrollToTab = index
                    }
            }
        }
        .padding(.horizontal, self.tabConfig.style.spacing)
    }
    
    var tabs: some View {
        
        GeometryReader { geoProxy in
            
            ScrollViewReader { scrollProxy in
                
                ScrollView(.horizontal) {
                    
                    HStack(spacing: 0) {
                        
                        ForEach(0 ..< self.tabConfig.tabs.count, id: \.self) { index in
                            
                            self.tabConfig.tabs[index].content
                                .frame(width: geoProxy.size.width, height: geoProxy.size.height)
                                .ifVisible(in: self.visibleRect, in: .named("my")) { rect in
                                    
                                    if rect.midX < self.visibleRect.minX {
                                        DispatchQueue.main.async {
                                            self.currentTab = index + 1
                                        }
                                    } else if rect.midX > self.visibleRect.maxX {
                                        DispatchQueue.main.async {
                                            self.currentTab = index - 1
                                        }
                                    } else if self.currentTab != index {
                                        DispatchQueue.main.async {
                                            self.currentTab = index
                                        }
                                    }
                                }
                        }
                    }
                    .onChange(of: self.scrollToTab) {
                        
                        if self.currentTab != self.scrollToTab, let scrollTo = self.scrollToTab {
                            
                            withAnimation {
                                scrollProxy.scrollTo(scrollTo, anchor: .center)
                            }
                        }
                    }
                }
            }
            .rectReader(self.$visibleRect, in: .named("my"))
            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
        }
    }
    
    var bottomButtons: some View {
        
        HStack {
            
            Spacer()
            ForEach(0 ..< (self.tabConfig.buttons?.count ?? 0), id: \.self) { index in
                self.tabConfig.buttons?[index]
            }
            Spacer()
        }
    }
}

#Preview {
    TabSwife(tabConfig: .mock)
}
