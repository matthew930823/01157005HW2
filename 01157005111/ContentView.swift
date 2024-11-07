//
//  ContentView.swift
//  01157005111
//
//  Created by user11 on 2024/10/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        Color.red
                            .opacity(0.5)
                            .frame(width: geometry.size.width / 2) // 設置寬度為屏幕的一半
                        Color.purple
                            .opacity(0.5)
                            .frame(width: geometry.size.width / 2)
                    }
                    .ignoresSafeArea(.all)
                    Image(.koraidon)
                        .resizable()
                        .scaledToFit()
                        .opacity(0.5)
                        .position(x: UIScreen.main.bounds.width / 100, y: UIScreen.main.bounds.height / 2)
                    Image(.miraidon)
                        .resizable()
                        .scaledToFit()
                        .opacity(0.5)
                        .position(x: 95*UIScreen.main.bounds.width / 100, y: UIScreen.main.bounds.height / 2)
                    Image(.titleimg)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width / 2)
                        .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 7)
                    NavigationLink{
                        SwiftUIView()
                    }label: {
                        ZStack{
                            Text("Future")
                                .foregroundStyle(.cyan)
                                .font(.custom("AlexanaNeue", size: 50))
                        }
                        
                    }.position(x: 3*UIScreen.main.bounds.width / 4, y: 6*UIScreen.main.bounds.height / 7)
                    NavigationLink{
                        HW2()
                    }label: {
                        ZStack{
                            Text("Ancient")
                                .foregroundStyle(.red)
                                .font(.custom("PokemonSolidNormal", size: 50))
                        }
                        
                    }.position(x: UIScreen.main.bounds.width / 4, y: 6*UIScreen.main.bounds.height / 7)
                }
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}
