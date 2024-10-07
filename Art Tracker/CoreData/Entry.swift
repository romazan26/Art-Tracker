//
//  Entry+CoreDataProperties.swift
//
//
//  Created by Роман on 06.10.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Entry)
public class Entry: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var author: String?
    @NSManaged public var category: String?
    @NSManaged public var date: Date?
    @NSManaged public var descript: String?
    @NSManaged public var desmensions: String?
    @NSManaged public var image: UIImage?
    @NSManaged public var style: String?
    @NSManaged public var titleWork: String?
    @NSManaged public var materials: NSSet?
    @NSManaged public var sale: Bool
    @NSManaged public var purchase: Bool
    @NSManaged public var dateSale: Date?
    @NSManaged public var datePurchase: Date?
    @NSManaged public var priceSale: Int64
    @NSManaged public var pricePurchase: Int64
    
    

}

// MARK: Generated accessors for materials
extension Entry {

    @objc(addMaterialsObject:)
    @NSManaged public func addToMaterials(_ value: Material)

    @objc(removeMaterialsObject:)
    @NSManaged public func removeFromMaterials(_ value: Material)

    @objc(addMaterials:)
    @NSManaged public func addToMaterials(_ values: NSSet)

    @objc(removeMaterials:)
    @NSManaged public func removeFromMaterials(_ values: NSSet)

}

extension Entry : Identifiable {

}
