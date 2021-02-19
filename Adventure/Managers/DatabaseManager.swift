//  DatabaseManager.swift
//  Adventure
//
//  Created by Larry Burris on 2/17/21.
//
import Foundation
import Unrealm

class DatabaseManager
{
    let realm = try! Realm()
    
    func saveAndPrintStoryData()
    {
        let previousStoryDataItemRecords = StoryData.all(in: realm)
                
                if(!previousStoryDataItemRecords.isEmpty)
                {
                    return
                }
        //  Declare an empty storyDataList array
        var storyDataList = [StoryData]()
        
        //  Create three objects which represent a single row of data in the StoryData table in the database
        let storyDataItem = StoryData(id: UUID().uuidString,
                                  chapter: "1",
                                  paragraph: "1",
                                  subparagraph: "1",
                                  dataDescription: "When you open your eyes, you find yourself sitting on a large canopy bed. You have no recollection of how you got here or where you are. The room is dark save for the flashes of sporadic lightning from the window on the opposite side of the room. What do you do?",
                                  choices: "Try to remember how you got there.*Look around the room.*Stand up.",
                                  isCompleted: false)
        
        //  Add the storyDataItem to the array
        storyDataList.append(storyDataItem)
        
        let storyDataItem2 = StoryData(id: UUID().uuidString,
                                  chapter: "1",
                                  paragraph: "2",
                                  subparagraph: "1",
                                  dataDescription: "When you open your eyes, you find yourself sitting on a large canopy bed. You have no recollection of how you got here or where you are. The room is dark save for the flashes of sporadic lightning from the window on the opposite side of the room. What do you do?",
                                  choices: "Try to remember how you got there.*Look around the room.*Stand up.",
                                  isCompleted: false)
        
        //  Add the storyDataItem to the array
        storyDataList.append(storyDataItem2)
        
        let storyDataItem3 = StoryData(id: UUID().uuidString,
                                  chapter: "1",
                                  paragraph: "3",
                                  subparagraph: "1",
                                  dataDescription: "When you open your eyes, you find yourself sitting on a large canopy bed. You have no recollection of how you got here or where you are. The room is dark save for the flashes of sporadic lightning from the window on the opposite side of the room. What do you do?",
                                  choices: "Try to remember how you got there.*Look around the room.*Stand up.",
                                  isCompleted: false)
        
        //  Add the storyDataItem to the array
        storyDataList.append(storyDataItem3)
        
        //  Add the rows into the table from the array using the class method called add().
        StoryData.add(dataItems: storyDataList, in: realm)
        
        //  Retrieve the saved rows and populate the data into a new StoryData array
        let savedStoryDataItemList = StoryData.all(in: realm)
        
        print("----------------------------------------------")
        
        //  Spin through the array and print the chapters and paragraphs
        for savedStoryDataItem in savedStoryDataItemList
        {
            print("\nPrimary Key: " + savedStoryDataItem.id)
            print("Chapter: " + savedStoryDataItem.chapter)
            print("Paragraph: " + savedStoryDataItem.paragraph + "\n")
        }
        
        print("----------------------------------------------")
        
        print("\n\n")
        
        //  Print the database file URL
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}
