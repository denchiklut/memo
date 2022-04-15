//
//  PagerHelper.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/15/22.
//

import SwiftUI

struct TabsHero<Content: View, Label: View>: View {
    var content: Content
    var label: Label
    var tint: Color
    
    @State var offset: CGFloat = 0
    @State var tabsCount: CGFloat = 0
    @State var tabOffset: CGFloat = 0
    @Binding var current: Int
    
    init(
        tint: Color,
        current: Binding<Int>,
        @ViewBuilder label: @escaping () -> Label,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.tint = tint
        self._current = current
        self.label = label()
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                label
            }
            .overlay(
                HStack(spacing: 0) {
                    ForEach(0..<Int(tabsCount), id: \.self) { index in
                        Rectangle()
                            .padding()
                            .background(.black.opacity(0.01))
                            .onTapGesture {
                                let newOffset = CGFloat(index) * getRect().width
                                self.offset = newOffset
                            }
                    }
                }
            )
            .foregroundColor(tint)

            Capsule()
                .fill(tint)
                .frame(width: tabsCount == 0 ? 0 : (getRect().width / tabsCount) , height: 4)
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x:  tabOffset)
            
            OffsetTabView(current: $current, offset: $offset) {
                HStack(spacing: 0) {
                    content
                }
                .overlay(
                    GeometryReader { proxy in
                        return Color.clear
                            .preference(key: TabPreferenceKey.self, value: proxy.frame(in: .global))
                    }
                )
                .onPreferenceChange(TabPreferenceKey.self) { proxy in
                    let minX = -proxy.minX
                    let maxWidth = proxy.width
                    let screenWidth = getRect().width
                    let tabsCount = (maxWidth / screenWidth).rounded()
                    
                    let proggress = minX / screenWidth
                    let tabOffset = proggress * (screenWidth / tabsCount)
                    
                    self.tabOffset = tabOffset
                    self.tabsCount = tabsCount
                }
            }
        }
        .ignoresSafeArea()
    }
}


extension View {
    func pageLabel() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func pageView (ignoreSafeArea: Bool = false, edges: Edge.Set = []) -> some View {
        self
            .frame(width: getRect().width, alignment: .center)
            .ignoresSafeArea(ignoreSafeArea ? .container : .init(), edges: edges)
    }
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGRect = .init()
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

struct TabsHero_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
