//
//  Entry+CoreDataProperties.swift
//
//
//  Created by Роман on 02.10.2024.
//
//  This file was automatically generated and should not be edited.
//

import UIKit
import CoreData


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
    @NSManaged public var materials: String?
    @NSManaged public var style: String?
    @NSManaged public var titleWork: String?

}

extension Entry : Identifiable {

}
