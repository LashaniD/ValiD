//
//  ContentView.swift
//  Valid
//
//  Created by Shani Dharmasena on 2024-05-27.
//

import SwiftUI

struct ContentView: View {
    @State private var moveLeft = false
    @State private var showTextAndSecondRectangle = false
    @State private var navigateToNextPage = false
    
    var body: some View {
        ZStack {
            // Background gradient layer
            LinearGradient(
                gradient: Gradient(colors: [.gray, .black]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            if navigateToNextPage {
                //NextPageView()
            } else {
                HStack(spacing: 0) {
                    Spacer()
                    // Image within a Rectangle
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 212, height: 206)
                        .background(
                            Image("logo1")  // Make sure "logo1" is correctly named in your assets
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 212, height: 206)
                                .clipped()
                        )
                    Spacer()
                    if showTextAndSecondRectangle{
                        VStack {
                            // Text component
                            Text("alid")
                                .font(
                                    Font.custom("Istok Web", size: 120)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.76, green: 0.66, blue: 0.46))
                                .frame(width: 285, height: 144, alignment: .center)
                            .padding(.top, 100)
                            .padding(.trailing, 30)
                            
                            // Bottom thin rectangle
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 92, height: 12)
                                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                                .padding(.leading, 150)
                                .padding(.top, 230)
                            }
                        .transition(.move(edge: .trailing))
                    }
                    Spacer()
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            moveLeft = true
                        }
                        withAnimation(Animation.spring().delay(0.5)) {
                            showTextAndSecondRectangle = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                navigateToNextPage = true
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
