//
//  AddHistory.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct AddHistory: View {
    @StateObject var vm: CollectionsViewModel
    var body: some View {
        ZStack {
            Color.mainBack.ignoresSafeArea()
            VStack(alignment: .leading,spacing: 20) {
                VStack{
                    //MARK: - View title
                    Text("Add an entry")
                        .foregroundStyle(.white)
                        .font(.system(size: 30, weight: .heavy))
                    
                    //MARK: - Switch sale
                    CustomSwithHistoryView(simpleHistoryView: $vm.switchAddHistory)
                }
            }
        }
    }
}

#Preview {
    AddHistory(vm: CollectionsViewModel())
}
