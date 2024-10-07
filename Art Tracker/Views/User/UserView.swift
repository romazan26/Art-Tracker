//
//  UserView.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import SwiftUI

struct UserView: View {
    @StateObject var vm: UserViewModel
    var body: some View {
        ZStack {
            Color.second.ignoresSafeArea()
            VStack {
                Text("Profile")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold))
                Image(.userTest)
                    .resizable()
                    .frame(width: scaleScreen_x(112), height: scaleScreen_x(112))
                VStack(alignment: .leading) {
                    Text("Name")
                        .foregroundStyle(.gray)
                    CustomTextFieldView(text: $vm.userName)
                }
                Button {
                    vm.saveName()
                    vm.isPresentUser = false
                } label: {
                    MainButtonView(text: "Save")
                }
                Spacer()
            }.padding()
        }
    }
}

#Preview {
    UserView(vm: UserViewModel())
}
