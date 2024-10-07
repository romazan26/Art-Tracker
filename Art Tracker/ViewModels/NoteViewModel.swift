//
//  NoteViewModel.swift
//  Art Tracker
//
//  Created by Роман on 07.10.2024.
//

import Foundation
import CoreData

final class NoteViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    
    @Published var notes: [Note] = []
    @Published var simpleNote: Note?
    @Published var simpleTitleNote: String = ""
    @Published var simpleDescriptionNote: String = ""
    @Published var isAddNote: Bool = false
    @Published var isEdit = false
    
    init(){
        getNote()
    }
    
    //MARK: - Delete data
    func deleteNote(note: Note){
        manager.context.delete(note)
        saveNote()
    }
    
    //MARK: - Edit data
    func editNote(){
        let request = NSFetchRequest<Note>(entityName: "Note")
        do{
            notes = try manager.context.fetch(request)
            let note = notes.first(where: { $0.id == simpleNote?.id })
            note?.titleNote = simpleTitleNote
            note?.descriptNote = simpleDescriptionNote
        }catch let error{
            print(error)
        }
        saveNote()
        clear()
        isAddNote.toggle()
        isEdit = false
    }
    
    //MARK: - Fill data
    func fillData(){
        simpleTitleNote = simpleNote?.titleNote ?? ""
        simpleDescriptionNote = simpleNote?.descriptNote ?? ""
    }
    
    //MARK: - Clear data
    func clear(){
        simpleTitleNote = ""
        simpleDescriptionNote = ""
    }
    
    //MARK: - Add data
    func addNote() {
        let newNote = Note(context: manager.context)
        newNote.titleNote = simpleTitleNote
        newNote.descriptNote = simpleDescriptionNote
        saveNote()
        clear()
        isAddNote.toggle()
    }
    
    //MARK: - Save data
    func saveNote() {
        notes.removeAll()
        manager.save()
        getNote()
    }
    
    //MARK: - Get data
    func getNote() {
        let request = NSFetchRequest<Note>(entityName: "Note")
        do{
            notes = try manager.context.fetch(request)
        }catch let error{
            print(error)
        }
    }
}
