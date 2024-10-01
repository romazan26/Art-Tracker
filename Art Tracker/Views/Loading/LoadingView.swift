//
//  ContentView.swift
//  Art Tracker
//
//  Created by Роман on 01.10.2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var timeLoading: Int = 0
    @State private var isPresent: Bool = false
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool?
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            Image(.logo)
                .resizable()
                .frame(width: scaleScreen_x(200), height: scaleScreen_x(200))
            ProgressView()
                .padding(.top, scaleScreen_y(350))
        }
        .fullScreenCover(isPresented: $isPresent, content: {
            if isFirstLaunch ?? true {
                IntroView()
            }else{
                MainView()
            }
        })
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                if timeLoading < 20{
                    timeLoading += 1
                }else {
                    timer.invalidate()
                    isPresent = true
                }
            }
        })

    }
}

#Preview {
    LoadingView()
}
