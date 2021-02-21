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
                                  dataDescription: "With a gasp, you open your eyes. You lay on a canopy bed, the curtains drawn. It is dark, save for the intermittent flashes of lightning. You are above the covers, though judging how stiff you feel, it is obvious you have been sleeping for some time. You had been dreaming, though with each passing second, it fades. Who are you? Where are you?",
                                  choices: "Try to remember your dream.*Try to remember who and where you are.*Rise and open the curtains.",
                                  isCompleted: false,
                                  choiceDestination: "1.4.1*1.2.1*1.3.1")
        
        //  Add the storyDataItem to the array
        storyDataList.append(storyDataItem)
        
        let storyDataItem2 = StoryData(id: UUID().uuidString,
                                  chapter: "1",
                                  paragraph: "2",
                                  subparagraph: "1",
                                  dataDescription: "The events of the dreams are vague, as all dreams are, but you remember the need to move quickly. You wanted to run with a great desperation in your heart, but it felt as though you were getting nowhere. Was someone or something chasing you? You cannot be certain. You do know that after feelings of extreme exhaustion, you decided to give up the struggle and relent. You were overcome with fear in the moments before you awoke, but the dream has faded before you can recall what.",
                                  choices: "Try to remember who you are.*Rise and open the curtains.",
                                  isCompleted: false,
                                  choiceDestination: "1.4.1*1.3.1")
        
        //  Add the storyDataItem to the array
        storyDataList.append(storyDataItem2)
        
        let storyDataItem3 = StoryData(id: UUID().uuidString,
                                  chapter: "1",
                                  paragraph: "3",
                                  subparagraph: "1",
                                  dataDescription: "While it first, you find it silly to question your identity, it remains elusive. You fight off a sense of panic as your mind whirls through the remnants of the dream and what little else is there in the way of memory.  But it seems the harder you try, the less you understand.",
                                  choices: "Try to remember your dream.*Rise and open the curtains.",
                                  isCompleted: false,
                                  choiceDestination: "1.4.1*1.2.1")
        
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


// /Users/danbeers/Library/Developer/CoreSimulator/Devices/D426985F-0782-4F97-A551-5B8A481EC47F/data/Containers/Data/Application/D53F2501-81B0-4FAE-A243-7433356A3784/Documents/default.realm
