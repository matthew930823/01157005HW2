//
//  SwiftUIView.swift
//  01157005111
//
//  Created by user11 on 2024/10/9.
//

import SwiftUI

struct Question:Equatable{
    let Q:String
    let A:Bool
    let Img:ImageResource
}
let questions = [
    Question(Q: "皮卡丘是第一代寶可夢嗎？", A: true,Img: .Q_1),
    Question(Q: "超夢是一種水屬性寶可夢嗎？", A: false,Img: .Q_2),
    Question(Q: "伊布可以進化成八種不同的形態嗎？", A: true,Img: .Q_3),
    Question(Q: "小火龍的最終進化型是噴火龍嗎？", A: true,Img: .Q_4),
    Question(Q: "寶可夢的等級上限是100級嗎？", A: true,Img: .Q_5),
    Question(Q: "卡比獸是草屬性寶可夢嗎？", A: false,Img: .Q_6),
    Question(Q: "雷吉艾斯是傳說中的寶可夢嗎？", A: true,Img: .Q_7),
    Question(Q: "所有寶可夢都能學習飛行技能嗎？", A: false,Img: .Q_8),
    Question(Q: "比比鳥的初始形態是火屬性嗎？", A: false,Img: .Q_9),
    Question(Q: "惡屬性是寶可夢中的一種屬性嗎？", A: true,Img: .Q_10)
]
struct SwiftUIView: View {
    @State private var currentQuestion: Question?
    @State private var selectedQuestions: [Question] = []
    @State private var ImgshowTrue:Bool = false
    @State private var ImgshowFalse:Bool = false
    @State private var Score:Int = 0
    @State private var Finish:Bool = false
    var body: some View {
        ZStack{
            Image(.lab)
                .resizable()
                .scaledToFill()
                .opacity(0.2)
                .ignoresSafeArea()
            Image(.dr1)
                .resizable()
                .scaledToFit()
                .opacity(0.7)
                .offset(x:-180)
            Image(.pokeQuiz)
                .offset(x:70,y:-350)
            if let question = currentQuestion {
                Text(question.Q)
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .frame(width: 250, height: 100)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(10)
                    .offset(x:70,y:-250)
                Image(question.Img)
                    .resizable()
                    .frame(width:200,height: 250)
                    .opacity(0.8)
                    .offset(x:70,y:-70)
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 250, height: 80)
                        .foregroundColor(.green)
                        .opacity(0.5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 7)
                        )
                        .offset(x:100,y:100)
                    Image(.O)
                        .resizable()
                        .frame(width:50,height: 50)
                        .opacity(0.6)
                        .offset(x:20,y:100)
                    Text("True")
                        .foregroundStyle(.black)
                        .font(.custom("PokemonSolidNormal", size: 50))
                        .opacity(0.6)
                        .offset(x:115,y:105)
                }
                .onTapGesture {
                    if question.A == true {
                        ImgshowTrue.toggle()
                        Score+=10
                    }
                    else{
                        ImgshowFalse.toggle()
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 250, height: 80)
                        .foregroundColor(.red)
                        .opacity(0.5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 7)
                        )
                        .offset(x:100,y:230)
                    Image(.X)
                        .resizable()
                        .frame(width:50,height: 50)
                        .opacity(0.6)
                        .offset(x:20,y:230)
                    Text("False")
                        .foregroundStyle(.black)
                        .font(.custom("PokemonSolidNormal", size: 50))
                        .opacity(0.6)
                        .offset(x:115,y:235)
                }
                .onTapGesture {
                    if question.A == false {
                        ImgshowTrue.toggle()
                        Score+=10
                    }
                    else{
                        ImgshowFalse.toggle()
                    }
                }
                Text("Score : \(Score)/100")
                    .foregroundStyle(.black)
                    .font(.custom("PokemonSolidNormal", size: 30))
                    .opacity(0.8)
                    .offset(x:55,y:320)
            }
            if ImgshowTrue {
                ZStack{
                    Color.gray
                        .opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                    Image(.good)
                        .resizable()
                        .scaledToFit()
                        .frame(height:500)
                        .offset(y:100)
                    Image(.goodText)
                        .resizable()
                        .scaledToFit()
                        .frame(width:300)
                        .offset(y:-200)
                }
                .onTapGesture {
                    ImgshowTrue.toggle()
                    selectNewQuestion()
                }
            }
            if ImgshowFalse{
                ZStack{
                    Color.gray
                        .opacity(0.5)
                        .edgesIgnoringSafeArea(.all)
                    Image(.ohoh)
                        .resizable()
                        .scaledToFit()
                        .frame(height:500)
                        .offset(y:100)
                    Image(.ohohText)
                        .resizable()
                        .scaledToFit()
                        .frame(width:300)
                        .offset(y:-200)
                }
                .onTapGesture {
                    ImgshowFalse.toggle()
                    selectNewQuestion()
                }
            }
            if Finish{
                ZStack{
                    Color.gray
                        .edgesIgnoringSafeArea(.all)
                    Image(.finish)
                        .resizable()
                        .scaledToFit()
                        .frame(width:350)
                        .offset(y:-200)
                    Image(.finishimg)
                        .resizable()
                        .scaledToFit()
                        .frame(height:300)
                    Text("Score : \(Score)/100")
                        .foregroundStyle((Score>=80) ? .green : (Score >= 50 ? .yellow : .red))
                        .font(.custom("PokemonSolidNormal", size: 45))
                        .opacity(0.8)
                        .offset(y:230)
                    
                }
                .onTapGesture {
                    Finish.toggle()
                    Score=0
                }
            }
            
        }
        
        .onAppear {
            selectNewQuestion()
        }
    }
    private func selectNewQuestion() {
        
            var newQuestion: Question?
            guard selectedQuestions.count < questions.count else {
                // 如果所有問題都已選擇過，重置選擇
                Finish.toggle()
                selectedQuestions.removeAll()
                newQuestion = questions.randomElement()
                if let question = newQuestion {
                    currentQuestion = question
                    selectedQuestions.append(question)
                }
                return
            }
            
            repeat {
                newQuestion = questions.randomElement()
            } while newQuestion == currentQuestion || (newQuestion != nil && selectedQuestions.contains(newQuestion!))
            
            if let question = newQuestion {
                currentQuestion = question
                selectedQuestions.append(question) // 添加到已選擇問題列表
            }
        }
}

#Preview {
    SwiftUIView()
}
