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
    @Published var materials: [Material] = []
    
    @Published var simpleAuthor: String = ""
    @Published var simpleCategory: Category = .animation
    @Published var simpleDate: Date = Date()
    @Published var simpleDiscript: String = ""
    @Published var simpleDesmensions: String = ""
    @Published var simpleImage: UIImage?
    @Published var simpleStyle: Style = .artNouveau
    @Published var simpleTitle: String = ""
    
    @Published var countMaterials = 0
    @Published var simplleMalerials: [String] = []
    @Published var simpleMaterial: String = ""
    
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
        fetchMaterials()
    }
    
    //MARK: - Delete data
    func deleteEntry(entry: Entry) {
        if let materials = entry.materials?.allObjects as? [Material] {
            for material in materials {
                manager.context.delete(material)
            }
            saveMaterial()
        }
        manager.context.delete(entry)
        saveEntry()
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
        entry.style = simpleStyle.rawValue
        entry.titleWork = simpleTitle
        for material in simplleMalerials  {
            addOneMaterial(materialName: material, entry: entry)
        }
        saveEntry()
        clear()
    }
    
    func addOneMaterial(materialName: String, entry: Entry){
        let newMaterial = Material(context: manager.context)
        newMaterial.nameMaterial = materialName
        newMaterial.entry = entry
        saveMaterial()
    }
    
    func oneMoreMaterials() {
        simplleMalerials.append(simpleMaterial)
        countMaterials += 1
        simpleMaterial = ""
    }
    
    //MARK: - Clear data
    func clear(){
        simpleAuthor = ""
        simpleCategory = .animation
        simpleDate = Date()
        simpleDiscript = ""
        simpleDesmensions = ""
        simpleImage = nil
        simpleStyle = .artNouveau
        simpleTitle = ""
        countMaterials = 0
        simplleMalerials = []
        simpleMaterial = ""
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
    
    func fetchMaterials() {
        let request = NSFetchRequest<Material>(entityName: "Material")
        do{
            materials = try manager.context.fetch(request)
        }catch let error{
            print("error fetching materials: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save data
    func saveEntry() {
        entrys.removeAll()
        manager.save()
        fetchEntrys()
    }
    func saveMaterial() {
        materials.removeAll()
        manager.save()
        fetchMaterials()
    }
}
