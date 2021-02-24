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
    
    func loadCSVFileData()
    {
        //  Only load the file if it hasn't been loaded already
        if !StoryData.all(in: realm).isEmpty
        {
            return
        }
        
        var storyDataList = [StoryData]()
        
        guard let filepath = Bundle.main.path(forResource: Constants.CSV_FILE_NAME, ofType: Constants.CSV_FILE_TYPE) else { return }

        var data = Constants.EMPTY_STRING

        do
        {
            //  Load the data using the file path as one long string
            data = try! String(contentsOfFile: filepath)

            //  Populate a rows array
            let rows = data.components(separatedBy: "\n")

            //  Create columns for each row
            for row in rows
            {
                let columns = row.components(separatedBy: ",")
                
                print("Column count is \(columns.count) for row \(row)")

                //  Ensure that we have 5 columns of data
                if columns.count == 5
                {
                    //  Get the data from the colunms and populate the field values
                    let chapter = columns[0]
                    let paragraph = columns[1]
                    let dataDescription = columns[2].replacingOccurrences(of: "*", with: ",")
                    let choices = columns[3]
                    
                    //  Create a new StoryData object with the field values
                    let storyData = StoryData(id: UUID().uuidString, chapter: Int(chapter)!, paragraph: Int(paragraph)!, dataDescription: dataDescription, choices: choices, isCompleted: false)
                    
                    //  Add the row to the storyDataList
                    storyDataList.append(storyData)
                    
                    //  Add the rows into the table from the array using the class method called add().
                    StoryData.add(dataItems: storyDataList, in: realm)
                    
                    //  Retrieve the saved rows and populate the data into a new StoryData array
                    let savedStoryDataItemList = StoryData.all(in: realm)
                    
                    print("----------------------------------------------")
                    
                    //  Spin through the array and print the chapters and paragraphs
                    for savedStoryDataItem in savedStoryDataItemList
                    {
                        print("\nPrimary Key: " + savedStoryDataItem.id)
                        print("Chapter: " + "\(savedStoryDataItem.chapter)")
                        print("Paragraph: " + "\(savedStoryDataItem.paragraph)" + "\n")
                    }
                    
                    print("----------------------------------------------")
                    
                    print("\n\n")
                    
                    //  Print the database file URL
                    print(Realm.Configuration.defaultConfiguration.fileURL!)
                }
            }
            
            print("Number of records in storyDataList in loadCSVFileData is: \(storyDataList.count)")
        }
    }
}

