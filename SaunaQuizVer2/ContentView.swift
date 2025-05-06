//
//  ContentView.swift
//  SaunaQuizVer2
//

import SwiftUI

struct ContentView: View {
    @State var isShowingQuizView = false
    
    var body: some View {
        VStack {
            Text("新サウナクイズ")
            Button("スタート") {
                isShowingQuizView = true
            }
            .fullScreenCover(isPresented: $isShowingQuizView) {
                QuizView()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
