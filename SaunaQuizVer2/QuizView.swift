//
//  QuizView.swift
//  SaunaQuizVer2
//

import SwiftUI

struct QuizItem {
    let question: String
    var choices: [String]
    let correctAnswer: String
}

struct QuizView: View {
    @State var isShowingScoreView = false
    let choices = ["ライオン", "ウサイン・ボルト", "チーター", "馬"]
    
    let quizItems = [
        QuizItem(
            question: "次のうち、世界で最も速く走る動物はどれですか？",
            choices: ["ライオン", "ウサイン・ボルト", "チーター", "馬"],
            correctAnswer: "ウサイン・ボルト"
        ),
        QuizItem(
            question: "次のうち、飛ぶことができない鳥はどれですか？",
            choices: ["ペンギン", "フクロウ", "ハト", "スズメ"],
            correctAnswer: "ペンギン"
        ),
        QuizItem(
            question: "次のうち、哺乳類でない動物はどれですか？",
            choices: ["イルカ", "カメ", "コウモリ", "ヒト"],
            correctAnswer: "カメ"
        ),
        QuizItem(
            question: "次のうち、夜行性でない動物はどれですか？",
            choices: ["ライオン", "コアラ", "ゾウ", "フクロウ"],
            correctAnswer: "ゾウ"
        ),
        QuizItem(
            question: "次のうち、最も長い首を持つ動物はどれですか？",
            choices: ["キリン", "アルパカ", "象", "馬"],
            correctAnswer: "キリン"
        )
    ]
    
    var body: some View {
        VStack {
            Text("問題番号: 1/5")
                .font(.headline)
                .padding(10)
                .background(.originalGreen)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(quizItems[0].question)
                .font(.title)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.originalLightGreen)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.originalGreen, lineWidth: 5)
                )
                .frame(maxHeight: .infinity)
            
            
            ForEach(quizItems[0].choices, id: \.self) { choice in
                Button() {
                    print("\(choice)を選択しました。")
                    print("正解は\(quizItems[1].correctAnswer)でした。")
                    
                    if choice == quizItems[1].correctAnswer {
                        print("正解です")
                    } else {
                        print("不正解です")
                    }
                    
                } label: {
                    Text(choice)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .font(.title.bold())
                        .background(Color.originalSkin)
                        .foregroundStyle(.originalBrown)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .fullScreenCover(isPresented: $isShowingScoreView) {
                            ScoreView()
                        }
                }
            }
        }
        .padding()
        .backgroundImage()
    }
}

#Preview {
    QuizView()
}
