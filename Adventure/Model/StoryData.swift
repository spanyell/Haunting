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
    var chapter = 1
    var paragraph = 1
    var dataDescription = Constants.EMPTY_STRING
    var choices = Constants.EMPTY_STRING
    var isCompleted = false
    
    static func primaryKey() -> String?
    {
        return "id"
    }
}

extension Unrealm.Results
{
    //  Converts the <Results> returned from a Realm database query to a standard array
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
    
    //  Retrieve a row from the database based on chapter and paragraph
    static func retrieveStoryDataByChapterAndParagraph(chapter: Int, paragraph: Int, in realm: Realm = try! Realm()) -> [StoryData]
    {
        return realm.objects(StoryData.self).filter("chapter == \(chapter) AND paragraph == \(paragraph)").toArray(type: StoryData.self)
    }

    //  Saves/updates a list of populated StoryData objects to the database.
    @discardableResult
    static func add(dataItems: [StoryData], in realm: Realm = try! Realm()) -> Bool
    {
        for dataItem in dataItems
        {
            try! realm.write
            {
                realm.add(dataItem, update: .all)
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
    static func retrieveStoryDataByChapter(chapter: Int, in realm: Realm = try! Realm()) -> [StoryData]
    {
        return realm.objects(StoryData.self).filter("chapter == \(chapter)").sorted(byKeyPath: "paragraph", ascending: true).toArray(type: StoryData.self)
    }
}
