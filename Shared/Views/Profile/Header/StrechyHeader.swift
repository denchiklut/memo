//
//  StrechyHeader.swift
//  Memo
//
//  Created by Denis Aleksandrov on 4/9/22.
//

import SwiftUI

struct StrechyHeader: View {
    var image: String
    
    var body: some View {
        VStack(spacing: 0) {
            GeometryReader { proxy -> AnyView in
                let minY = proxy.frame(in: .global).minY
                let height = proxy.frame(in: .global).height
                
                return AnyView(
                    ZStack(alignment: .topLeading) {
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: getRect().width, height: height + (minY > 0 ? minY : 0))
                            .overlay(
                                LinearGradient(colors: [.black.opacity(0.5), .clear], startPoint: .top, endPoint: .center)
                            )
                        
                        Color("MenuColor")
                            .frame(height: getSafeArea().bottom == 0 ? 80 : 110)
                            .overlay(
                                VStack(alignment: .center, spacing: 6) {
                                    Text("Title")
                                        .fontWeight(.semibold)
                                        .lineLimit(1)
                                    
                                    Text("Subtitle")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .lineLimit(1)
                                }
                                .offset(y: getSafeArea().bottom == 0 ? 5 : 15)
                            )
                            .border(width: 0.4, edges: [.bottom], color: Color("BorderColor")
                                .opacity(Double(-minY / getRect().width)))
                            .offset(y: minY < 0 ? -minY : 0)
                            .opacity(Double(-minY / getRect().width))
                    }
                        .offset(y: minY > 0 ? -minY : 0)
                )
            }
            .frame(height: getRect().width)
            .offset(y: -getSafeArea().top)
            .zIndex(1)
            
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Title")
                        .fontWeight(.semibold)
                        .lineLimit(1)
                    
                    Text("Subtitle")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .lineLimit(1)
                }
                
                Spacer()

                HStack(spacing: 15) {
                    Button(action: {}, label: {
                        VStack(spacing: 5){
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .padding(8)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    })
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
            .background(Color("MenuColor"))
            .border(width: 0.4, edges: [.bottom], color: Color("BorderColor"))
            .offset(y: -getSafeArea().top)
            .padding(.bottom, -getSafeArea().top)
        
        }
    }
    
}

struct StrechyHeader_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                StrechyHeader(image: "denchiklut")
                    .zIndex(1)
                    
                ForEach(1...20, id: \.self) { index in
                    Text("\(index)")
                }
                .padding(.top)
           
            }
        }
        .background(Color("BackgroundColor"))
    }
}
