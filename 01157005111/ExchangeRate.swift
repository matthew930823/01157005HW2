//
//  ExchangeRate.swift
//  01157005111
//
//  Created by user11 on 2024/11/5.
//

import SwiftUI

struct ExchangeRate: View {
    @State private var baseAmount: String = ""
    @State private var convertedAmount: String = "0.00"
    @State private var isConvertingToTWD: Bool = true
    @State private var exchangeRateEURtoTWD: Double = 35.5 // 歐元到台幣的假設匯率
    @State private var exchangeRateTWDtoEUR: Double = 0.028 // 台幣到歐元的假設匯率
    let number : [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0", ".", "←"]
    var body: some View {
        VStack(spacing: 5) {
            Text("匯率換算")
                .font(.largeTitle)
                .padding()
            
            // 顯示當前的轉換方向
            Text(isConvertingToTWD ? "EUR to TWD" : "TWD to EUR")
                .font(.title)
                .padding()
            
            // 顯示輸入的金額
            Text("\(baseAmount) \(isConvertingToTWD ? "EUR" : "TWD")").font(.title)
            Text("\(convertedAmount) \(isConvertingToTWD ? "TWD" : "EUR")")
                .font(.title)
            // 自訂數字鍵盤
            VStack(spacing: 10) {
                let columns = Array(repeating: GridItem(), count: 3)
                LazyVGrid(columns: columns) {
                    ForEach(number, id: \.self) { key in
                        Button(action: {
                            handleKeyPress(key)
                        }) {
                            Text(key)
                                .font(.title)
                                .frame(width: 80, height: 80)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .frame(width: 250)
            
            Button("轉換") {
                calculateConversion()
            }
            .font(.headline)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            
            // 切換匯率方向的按鈕
            Button("切換匯率") {
                isConvertingToTWD.toggle()
                baseAmount = "" // 切換後清空輸入
                convertedAmount = "0.00"
            }
            .font(.subheadline)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding()
    }
    
    private func handleKeyPress(_ key: String) {
        switch key {
        case "←":
            if !baseAmount.isEmpty {
                baseAmount.removeLast()
            }
        case ".":
            if !baseAmount.contains(".") {
                baseAmount += key
            }
        default:
            baseAmount += key
        }
    }
    
    private func calculateConversion() {
        if let amount = Double(baseAmount) {
            let result = isConvertingToTWD ? amount * exchangeRateEURtoTWD : amount * exchangeRateTWDtoEUR
            convertedAmount = String(format: "%.2f", result)
        }
    }
}

#Preview {
    ExchangeRate()
}
