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
    
    @Published var simpleEntry: Entry?
    
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
    @Published var isEditMode = false
    
    //MARK: Sorted propertyes
    @Published var simpleSortCategory: Category?
    @Published var simpleSortStyle: Style?
    @Published var sortedCollection: [Entry] = []
    
    //MARK: History propertyes
    @Published var arrayForSale: [Entry] = []
    @Published var arrayForPurchase: [Entry] = []
    
    @Published var simpleHistoryView = false
    
    @Published var saleEntry: [Entry] = []
    @Published var purchaseEntry: [Entry] = []
    
    @Published var simplePriceSale = ""
    @Published var simplePricePurchase = ""
    @Published var simpleDateSale: Date?
    @Published var simpleDatePurchase = Date()
    
    @Published var isPresentAddHistory = false
    
    @Published var switchAddHistory = false
    
    
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
    
    //MARK: - Get budget
    func getBudget() -> Int {
        var budget: Int = 0
        for entry in entrys {
            budget += Int(entry.priceSale)
            budget -= Int(entry.pricePurchase)
        }
        return budget
    }
    
    //MARK: - Dateformatter
    private func Dateformatter(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d.M.yyyy"
        return dateFormatter.string(from: date)
    }
    
    //MARK: - History function
    
    func getHistory() {
        fetchEntrys()
        purchaseEntry.removeAll()
        saleEntry.removeAll()
        for entry in entrys {
            if entry.purchase {
                purchaseEntry.append(entry)
            }
            if entry.sale {
                saleEntry.append(entry)
            }
        }
    }
    
    //MARK: Purchase entry
    func saleEntryPurchase() {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        do{
            entrys = try manager.context.fetch(request)
            let entry = entrys.first(where: {$0.id == simpleEntry?.id})
            entry?.sale = true
            entry?.purchase = false
            entry?.priceSale = Int64(simplePriceSale) ?? 0
            entry?.dateSale = simpleDatePurchase
        }catch let error{
            print("error fetching entries: \(error.localizedDescription)")
        }
        saveEntry()
        getArrayForPurchase()
        getHistory()
    }
    
    func buyEntry() {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        do{
            entrys = try manager.context.fetch(request)
            let entry = entrys.first(where: {$0.id == simpleEntry?.id})
            entry?.purchase = true
            entry?.pricePurchase = Int64(simplePricePurchase) ?? 0
            entry?.datePurhase = simpleDatePurchase
        }catch let error{
            print("error fetching entries: \(error.localizedDescription)")
        }
        saveEntry()
        getArrayForPurchase()
        getHistory()
    }
    
    //Get array for purchase
    func getArrayForPurchase() {
        fetchEntrys()
        arrayForPurchase.removeAll()
        arrayForSale.removeAll()
        for entry in entrys {
            if !entry.purchase {
                arrayForPurchase.append(entry)
            }
        }
        for entry in entrys {
            if entry.purchase {
                arrayForSale.append(entry)
            }
        }
    }
    
    // Метод для сортировки по дате (сначала новые)
    func sortSales() {
        saleEntry.sort { $0.dateSale ?? Date() > $1.dateSale ?? Date()}
    }
    
    // Группировка покупок по дате
    func groupedSalesByDate() -> [String: [Entry]] {
        let groupedDictionary = Dictionary(grouping: saleEntry) { sale in
            Dateformatter(date: sale.dateSale ?? Date()) // Преобразование даты в строку
        }
        return groupedDictionary
    }
    
    // Метод для сортировки по дате (сначала новые)
    func sortPurchases() {
        purchaseEntry.sort { $0.datePurhase ?? Date() > $1.datePurhase ?? Date()}
    }
    
    // Группировка покупок по дате
    func groupedPurchasesByDate() -> [String: [Entry]] {
        let groupedDictionary = Dictionary(grouping: purchaseEntry) { purchase in
            Dateformatter(date: purchase.datePurhase ?? Date()) // Преобразование даты в строку
        }
        return groupedDictionary
    }
    
    //MARK: - Sorted collection
    func sotedCollection(){
        sortedCollection.removeAll()
        var sortCategory: [Entry] = []
        fetchEntrys()
        
        if simpleSortCategory != nil {
            for entry in entrys {
                if entry.category == simpleSortCategory?.rawValue {
                    sortCategory.append(entry)
                }
            }
        }else{
            sortCategory = entrys
        }
        
        if simpleSortStyle != nil {
            for entry in sortCategory {
                if entry.style == simpleSortStyle?.rawValue {
                    sortedCollection.append(entry)
                }
            }
        }else{
            sortedCollection = sortCategory
        }
        
    }
    
    //MARK: - Edite data
    func fillData(entry: Entry){
        simpleAuthor = entry.author ?? ""
        simpleCategory  = Category(rawValue: entry.category ?? "") ?? .animation
        simpleDate = entry.date ?? Date()
        simpleDiscript = entry.descript ?? ""
        simpleDesmensions = entry.desmensions ?? ""
        simpleImage = entry.image ?? UIImage(systemName: "image")
        simpleStyle = Style(rawValue: entry.style ?? "") ?? .artNouveau
        simpleTitle = entry.titleWork ?? ""
        if let materials = entry.materials?.allObjects as? [Material] {
            countMaterials = materials.count
            simplleMalerials = []
            for material in materials {
                simplleMalerials.append(material.nameMaterial ?? "")
            }
        }
        isEditMode = true
        simpleEntry = entry
    }
    
    func editEntry() {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        do{
            entrys = try manager.context.fetch(request)
            if let entry = entrys.first(where: { $0.id == simpleEntry?.id }){
                entry.author = simpleAuthor
                entry.category = simpleCategory.rawValue
                entry.date = simpleDate
                entry.descript = simpleDiscript
                entry.desmensions = simpleDesmensions
                entry.image = simpleImage
                entry.style = simpleStyle.rawValue
                entry.titleWork = simpleTitle
                if let materials = entry.materials?.allObjects as? [Material] {
                    for material in materials {
                        manager.context.delete(material)
                    }
                    saveMaterial()
                }
                for material in simplleMalerials  {
                    addOneMaterial(materialName: material, entry: entry)
                }
            }
        }catch let error{
            print("error fetching entries: \(error.localizedDescription)")
        }
        saveEntry()
        isEditMode.toggle()
        clear()
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
