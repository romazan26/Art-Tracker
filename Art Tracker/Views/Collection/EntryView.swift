//
//  EntryView.swift
//  Art Tracker
//
//  Created by Роман on 04.10.2024.
//

import SwiftUI

struct EntryView: View {
    @StateObject var vm: CollectionsViewModel
    @Environment(\.dismiss) var dismiss
    let entry: Entry
    var body: some View {
        ZStack {
            
            Color.mainBack.ignoresSafeArea()
            VStack(alignment: .leading) {
                //MARK: - Title work
                Text("Symphony of Time")
                    .foregroundStyle(.white)
                    .font(.system(size: 34, weight: .heavy))
                
                //MARK: - Image  work
                HStack{
                    Spacer()
                if let image = entry.image {
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: scaleScreen_x(228), height: scaleScreen_x(228))
                        .cornerRadius(12)
                        .scaledToFit()
                }else{
                    Image(systemName: "photo.artframe")
                        .resizable()
                        .frame(width: scaleScreen_x(228), height: scaleScreen_x(228))
                        .cornerRadius(12)
                        .scaledToFit()
                }
                    Spacer()
            }
                
                //MARK: - data author and size
                HStack {
                    imageAndTextView(imageName: "calendar", text: Dateformatter(date: entry.date ?? Date()))
                        .padding(8)
                        .background {
                            Color.second.cornerRadius(12)
                        }
                    imageAndTextView(imageName: "person.fill", text: entry.author ?? "")
                    imageAndTextView(imageName: "map", text: entry.desmensions ?? "")
                }
                
                //MARK: - Materials
                if let materials = entry.materials?.allObjects as? [Material] {
                    HStack{
                        ForEach(materials) { material in
                            Text(material.nameMaterial ?? "")
                                .foregroundStyle(.white)
                                .font(.headline)
                                .padding(8)
                                .background {
                                    Color.second.cornerRadius(12)
                                }
                        }
                    }
                }
                
                //MARK: - Description entry
                Text(entry.descript ?? "")
                    .foregroundStyle(.white)
                
                Spacer()
                
                    //MARK: - Delete button
                Button {
                    vm.deleteEntry(entry: entry)
                    dismiss()
                } label: {
                    ZStack{
                        Color.second.cornerRadius(12)
                            .frame(maxWidth: .infinity)
                            .frame(height: scaleScreen_x(50))
                        Text("Delete")
                            .foregroundStyle(.white)
                            .font(.system(size: 17, weight: .bold))
                            .padding(8)
                    }
                        
                }

            }.padding()
        }
    }
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M.yyyy"
        return dateFormatter.string(from: date)
    }

}

//#Preview {
//    EntryView(vm: CollectionsViewModel(), entry: Entry())
//}
