//
//  CollectionsViewModel.swift
//  Art Tracker
//
//  Created by Роман on 02.10.2024.
//
import CoreData
import UIKit
import PhotosUI

final class CollectionsViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var entrys: [Entry] = []
    
    @Published var simpleAuthor: String = ""
    @Published var simpleCategory: Category = .animation
    @Published var simpleDate: Date = Date()
    @Published var simpleDiscript: String = ""
    @Published var simpleDesmensions: String = ""
    @Published var simpleImage: UIImage?
    @Published var simpleMaterials: String = ""
    @Published var simpleStyle: Style = .artNouveau
    @Published var simpleTitle: String = ""
    
    @Published var isPresentedPiker = false
    @Published var isPresentAddEntry = false
    
    var config: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        
        return config
    }
    
    init() {
        fetchEntrys()
    }
    
    //MARK: - Add data
    func addEntry() {
        let entry = Entry(context: manager.context)
        entry.author = simpleAuthor
        entry.category = simpleCategory.rawValue
        entry.date = simpleDate
        entry.descript = simpleDiscript
        entry.desmensions = simpleDesmensions
        entry.image = simpleImage
        entry.materials = simpleMaterials
        entry.style = simpleStyle.rawValue
        saveEntry()
    }
    
    //MARK: - Get data
    func fetchEntrys() {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        do{
            entrys = try manager.context.fetch(request)
        }catch let error{
            print("error fetching entries: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save data
    func saveEntry() {
        entrys.removeAll()
        manager.save()
        fetchEntrys()
    }
}
