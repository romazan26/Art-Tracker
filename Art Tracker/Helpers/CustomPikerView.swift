//
//  PickerGoalView.swift
//  CorrectLifestyle
//
//  Created by Роман on 30.06.2024.
//

import SwiftUI

struct CustomPikerView: View {
    var maxWidth: CGFloat = 150
    var cornerRadius: CGFloat = 15
    @Binding var selection: String
    @State var text: String
    @State private var showOptions = false
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            VStack(spacing: 0) {
                if showOptions {Optionsview()}
                    HStack(spacing: 10) {
                        Text(text).foregroundStyle(.white)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                            .rotationEffect(.init(degrees: showOptions ? -100 : 0))
                        
                    }
                    .padding(.horizontal, 15)
                    .frame(width: size.width, height: size.height)
                    .contentShape(.rect)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            showOptions.toggle()
                        }
                    }
            }
            .background {
                Color.white.opacity(0.05)
                    .cornerRadius(18)
            }
            
        }.frame(width: maxWidth, height: 74)
        
    }
    
    @ViewBuilder
    func Optionsview() -> some View {
        VStack(spacing: 10){
            ForEach(Category.allCases) {  category in
                HStack {
                    Text(text)
                        .foregroundStyle(.gray)
                        .frame(height: 30)
                    // .foregroundStyle(selection == car.image ? Color.white : Color.gray)
                        .animation(.none, value: selection)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                selection = category.rawValue
                                text = category.rawValue
                                showOptions = false
                            }
                        }
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    ZStack {
        Color.black
        CustomPikerView(selection: .constant(Category.painting.rawValue), text: Category.painting.rawValue)
    }
}
