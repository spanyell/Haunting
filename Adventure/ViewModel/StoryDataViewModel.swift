//
//  StoryDataViewModel.swift
//  Adventure
//
//  Created by Larry Burris on 2/14/21.
//
import Foundation

class StoryDataViewModel: ObservableObject
{
    @Published var storyDataList = [StoryData]()
    
    //  This is a dictionary where the key is the paragraph string and the value is the array of choice and choiceDestination strings
    var choicesDictionary = [Int : [String]]()
    var destinationsDictionary = [String :[String]]()
    
    init()
    {
        retrieveChapterData(chapter: UserDefaults.standard.integer(forKey: "chapter"))
        populateChoicesAndDestinationsDictionary()
    }
    
    func retrieveChapterData(chapter: Int)
    {
        self.storyDataList = StoryData.retrieveStoryDataByChapter(chapter: chapter)
        
        print("Size of storyDataList is: \(storyDataList.count)")
    }
    
    func populateChoicesAndDestinationsDictionary()
    {
        //  Spin through the storyDataList to get each individual story data object
        for storyData in storyDataList
        {
            //  Get the choices string, choiceeDestination and paragraph from the story data object
            let choiceString = storyData.choices
            let paragraph = storyData.paragraph
            
            //  Create the choices array
            let choicesList = choiceString.components(separatedBy: "*")
            
            for choice in choicesList
            {
                print("Paragraph is: \(paragraph)\nChoice is: \(choice)")
            }
            
            //  Assign the choice and destinations arrays to the dictionary using the paragraph as the key.
            choicesDictionary[paragraph] = choicesList
        }
    }
}

