//
//  StoryData.swift
//  Adventure
//
//  Created by Larry Burris on 2/14/21.
//
import Foundation
import Unrealm

struct StoryData: Realmable
{
    var id = UUID().uuidString
    var chapter = ""
    var paragraph = ""
    var subparagraph = ""
    var dataDescription = ""
    var choices = ""
    var isCompleted = false
    var choiceDestination = ""
    
    static func primaryKey() -> String?
    {
        return "id"
    }
}

extension Unrealm.Results
{
    func toArray<T>(type: T.Type) -> [T]
    {
        return compactMap { $0 as? T }
    }
}

extension StoryData
{
    //  Retrieve all StoryData objects from the database as an array
    static func all(in realm: Realm = try! Realm()) -> [StoryData]
    {
        return realm.objects(StoryData.self).toArray(type: StoryData.self)
    }
    
    //  Retrieve a row from the database based on chapter, paragraph and (optionally) subparagraph
    static func retrieveStoryDataByChapterAndParagraph(chapter: String, paragraph: String, subparagraph: String = "1", in realm: Realm = try! Realm()) -> [StoryData]
    {
        return realm.objects(StoryData.self).filter("chapter == '\(chapter)' AND paragraph == '\(paragraph)' AND subparagraph == '\(subparagraph)'").toArray(type: StoryData.self)
    }

    //  Save a list of populated StoryData objects to the database
    @discardableResult
    static func add(dataItems: [StoryData], in realm: Realm = try! Realm()) -> Bool
    {
        for dataItem in dataItems
        {
            try! realm.write
            {
                realm.add(dataItem)
            }
        }
        
        return true
    }

    //  Toggles the isCompleted value to true and saves it to the database
    mutating func toggleCompleted()
    {
        guard let realm = try? Realm() else { return }
        
        isCompleted.toggle()
        
        try! realm.write
        {
            realm.add(self, update: .all)
        }
    }

    //  Deletes the record from the database
    func delete()
    {
        guard let realm = try? Realm() else { return }
        
        try! realm.write
        {
            realm.delete(self)
        }
    }
    //  Retrieve rows from the database based on chapter
        static func retrieveStoryDataByChapter(chapter: String, in realm: Realm = try! Realm()) -> [StoryData]
        {
            return realm.objects(StoryData.self).filter("chapter == '\(chapter)'").sorted(byKeyPath: "paragraph", ascending: true).toArray(type: StoryData.self)
        }
}

