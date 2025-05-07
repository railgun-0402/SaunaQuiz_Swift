//
//  ContentView.swift
//  SaunaQuizVer2
//

import SwiftUI

struct StartView: View {
    @State var isShowingQuizView = false
    
    var body: some View {
        VStack {
            Spacer()
            Text("新！サウナ\nクイズ")
                .font(.system(size: 70).bold())
                .foregroundStyle(.originalYellow)
                .stroke(color: .originalGreen, width: 5)
            Spacer()
            Button {
                isShowingQuizView = true
            } label: {
                Image(.startButton)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
            }
            Button("スタート") {
                isShowingQuizView = true
            }
            .fullScreenCover(isPresented: $isShowingQuizView) {
                QuizView()
            }
        }
        .padding()
        .backgroundImage()
    }
}

#Preview {
    StartView()
}
