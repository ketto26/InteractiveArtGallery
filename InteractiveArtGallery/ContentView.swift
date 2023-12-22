//
//  ContentView.swift
//  InteractiveArtGallery
//
//  Created by Keto Nioradze on 22.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var pressed = false
    @State private var longPressed = false
    @State private var offsetSize = CGSize.zero
    @State private var currentValue = CGFloat.zero
    @State private var value: Angle = .degrees(0)
    @State private var finalValue: Angle = .degrees(0)
    @State private var isPressed = false
    
    var body: some View {
        ZStack{
            
            LinearGradient(colors: [.golden, .white, .golden, .white, .golden], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            VStack {
                
                Text("Gustav Klimt Interactive Gallery")
                    .fontWeight(.bold)
                    .font(.system(size: 35))
                    .multilineTextAlignment(.center)
                    .padding()
                
                ScrollView{
                    Text(artWorks[0].name)
                        .font(.system(size: 27))
                    Image(artWorks[0].name)
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            print("The most popular artwork of Gustav Klimt is 'The Kiss'")
                        }
                    Text("/Printing on tap gesture/")
                        .foregroundStyle(.placeholder)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text(longPressed ? "Pressed" : artWorks[1].name)
                    Image(artWorks[1].name)
                        .resizable()
                        .scaledToFit()
                        .onLongPressGesture(minimumDuration: 3,pressing: { pressing in pressed = pressing },
                                            perform: { longPressed.toggle() })
                    Text("/Changed name on tap long press gesture/")
                        .foregroundStyle(.placeholder)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text(artWorks[2].name)
                    Image(artWorks[2].name)
                        .resizable()
                        .scaledToFit()
                        .offset(offsetSize)
                        .gesture(
                            DragGesture()
                                .onChanged { offsetSize = $0.translation }
                        )
                    Text("/Moves on drag gesture/")
                        .foregroundStyle(.placeholder)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text(artWorks[3].name)
                    Image(artWorks[3].name)
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1 + currentValue)
                        .gesture(
                            MagnificationGesture()
                                .onChanged { number in
                                    print("number: \(number)")
                                    currentValue = number - 1
                                }
                        )
                    Text("/Zooms on magnification gesture/")
                        .foregroundStyle(.placeholder)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text(artWorks[4].name)
                    Image(artWorks[4].name)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .rotationEffect(value + finalValue)
                        .gesture(
                            RotationGesture()
                                .onChanged { angle in
                                    value = angle
                                }
                                .onEnded { angle in
                                    finalValue = angle
                                    value = .degrees(0)
                                }
                        )
                    Text("/Rotates on rotation gesture/")
                        .foregroundStyle(.placeholder)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    Text(isPressed ? "👻Boo" : artWorks[5].name)
                    Image(artWorks[5].name)
                        .resizable()
                        .scaledToFit()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 2.0)) {
                                isPressed.toggle()
                            }
                        }
                    Text("/Changes with animation on tap gesture/")
                        .foregroundStyle(.placeholder)
                }
                .padding()
            }
            .padding(.top, 50)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    ContentView()
}

