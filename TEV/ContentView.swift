//
//  ContentView.swift
//  TEV
//
//  Created by VM on 11/02/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var display = "0"
    
    
    // MARK: UI
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            Text(display)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
            
            HStack {
                Button("1") { appendNumber("1") }
                Button("2") { appendNumber("2") }
                Button("3") { appendNumber("3") }
                Button("+") { setOperation("+") }
            }
            
            HStack {
                Button("4") { appendNumber("4") }
                Button("5") { appendNumber("5") }
                Button("6") { appendNumber("6") }
                Button("-") { setOperation("-") }
            }
            
            HStack {
                Button("7") { appendNumber("7") }
                Button("8") { appendNumber("8") }
                Button("9") { appendNumber("9") }
                Button("*") { setOperation("*") }
            }
            
            HStack {
                Button("0") { appendNumber("0") }
                Button("C") { clear() }
                Button("=") {calculate() }
                Button("/") { setOperation("/") }
            }
        }
        .padding()
        .buttonStyle(.borderedProminent)
    }
    
    // MARK: - Lógica
    @State private var firstNumber = 0
    @State private var operation: String? = nil
    
    func appendNumber(_ num: String) {
        if display == "0" {
            display = num
        } else {
            display += num
        }
    }
    
    func setOperation(_ op: String) {
        firstNumber = Int(display) ?? 0
        operation = op
        display = "0"
    }
    
    func calculate() {
        let secondNumber = Int(display) ?? 0
        switch operation {
        case "+": display = "\(firstNumber + secondNumber)"
        case "-": display = "\(firstNumber - secondNumber)"
        case "*": display = "\(firstNumber * secondNumber)"
        case "/": display = "\(firstNumber / secondNumber)"
        default: break
        }
        operation = nil
    }
    
    func clear() {
        display = "0"
        firstNumber = 0
        operation = nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
