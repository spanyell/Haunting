//
//  StoryDataViewModel.swift
//  Adventure
//
//  Created by Larry Burris on 2/14/21.
//
import Foundation
import SwiftUI

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
    }
    
    func populateChoicesAndDestinationsDictionary()
    {
        //  Spin through the storyDataList to get each individual story data object
        for storyData in storyDataList
        {
            //  Get the choices string, choiceDestination and paragraph from the story data object
            let choiceString = storyData.choices
            let paragraph = storyData.paragraph
            
            //  Create the choices array
            var choicesList = choiceString.components(separatedBy: "*")
            
            var i = 0
            
            //  Only add choices if they are not in the viewedChoices array
            for choice in choicesList
            {
                if UtilitiesManager.shared.viewedChoices.contains(choice)
                {
                    //  Remove the choice from the array
                    choicesList.remove(at: i)
                }
                
                i = i + 1
            }
            
            //  Assign the choice and destinations arrays to the dictionary using the paragraph as the key.
            choicesDictionary[paragraph] = choicesList
        }
    }
}
