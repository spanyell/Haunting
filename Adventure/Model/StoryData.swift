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
    var dataDescription = ""
    var choices = ""
    var isCompleted = false
    
    static func primaryKey() -> String?
    {
        return "id"
    }
}
