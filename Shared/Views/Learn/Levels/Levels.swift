//
//  Levels.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/10/22.
//

import SwiftUI

struct Levels: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color("BackgroundColor")
            
            AppHeader()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack() {
                        cell(header: "Text Here", image: "calendar")
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors:  [
                                        Color(#colorLiteral(red: 0.5019607843, green: 0.7490196078, blue: 0.9490196078, alpha: 1)), Color(#colorLiteral(red: 0.5058823529, green: 0.6112407243, blue: 0.9450980392, alpha: 1))]),
                                    startPoint: .leading, endPoint: .trailing
                                )
                            )
                            .cornerRadius(10)
                            .opacity(0.8)
                    }
                    HStack {
                        cell(header: "Word - translation",  image: "cube.transparent")
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors:  [
                                        Color(#colorLiteral(red: 0.9215686275, green: 0.3882352941, blue: 0.5450980392, alpha: 1)), Color(#colorLiteral(red: 0.9176470588, green: 0.3411764706, blue: 0.5450980392, alpha: 1))]),
                                    startPoint: .leading, endPoint: .trailing
                                )
                            )
                            .cornerRadius(10)
                            .opacity(0.8)
                        cell(header: "Translation - word",  image: "cube.transparent.fill")
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors:  [
                                        Color(#colorLiteral(red: 0.8549019608, green: 0.1333333333, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.5921568627, green: 0.2869313973, blue: 0.9333333333, alpha: 1))]),
                                    startPoint: .leading, endPoint: .trailing
                                )
                            )
                            .cornerRadius(10)
                            .opacity(0.7)
                    }
                    HStack {
                        cell(header: "Listening",  image: "airpodsmax")
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors:  [
                                        Color(#colorLiteral(red: 1, green: 0.3725490196, blue: 0.4274509804, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.7647058824, blue: 0.4431372549, alpha: 1))]),
                                    startPoint: .leading, endPoint: .trailing
                                )
                            )
                            .cornerRadius(10)
                            .opacity(0.8)
                        cell(header: "Word - Builder",  image: "rectangle.and.pencil.and.ellipsis")
                            .background(
                                LinearGradient(
                                    gradient: Gradient(colors:  [
                                        Color(#colorLiteral(red: 0.4078431373, green: 0.8901960784, blue: 0.7725490196, alpha: 1)), Color(#colorLiteral(red: 0.4705882353, green: 0.9058823529, blue: 0.7074894033, alpha: 1))]),
                                    startPoint: .leading, endPoint: .trailing
                                )
                            )
                            .cornerRadius(10)
                            .opacity(0.8)
                    }
                }
                .padding()
            }
            .offset(y: 110)
        }
        .ignoresSafeArea()
    }

    @ViewBuilder
    func cell(header: String, image: String) -> some View {
        NavigationLink(destination: Level()) {
            VStack {
                Text(header)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            .frame(height: 180)
            .frame(maxWidth: .infinity)
        }
    }
}

struct Levels_Previews: PreviewProvider {
    static var previews: some View {
        Levels()
//            .preferredColorScheme(.dark)
    }
}
