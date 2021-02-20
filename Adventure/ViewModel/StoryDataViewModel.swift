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
    
    //  This is a dictionary where the key is the paragraph string and the value is the array of choice strings
    var choicesDictionary = [String : [String]]()
    
    init()
    {
        retrieveChapterData(chapter: "\(UserDefaults.standard.string(forKey: "chapter") ?? "1")")
        populateChoicesDictionary()
    }
    
    func retrieveChapterData(chapter: String)
    {
        self.storyDataList = StoryData.retrieveStoryDataByChapter(chapter: chapter)
        
        print("Size of storyDataList is: \(storyDataList.count)")
    }
    
    func populateChoicesDictionary()
    {
        //  Spin through the storyDataList to get each individual story data object
        for storyData in storyDataList
        {
            //  Get the choices string and paragraph from the story data object
            let choiceString = storyData.choices
            let paragraph = storyData.paragraph
            
            //  Create the choices array
            let choicesList = choiceString.components(separatedBy: "*")
            
            for choice in choicesList
            {
                print("Paragraph is: \(paragraph)\nChoice is: \(choice)")
            }
            
            //  Assign the choices array to the dictionary using the paragraph as the key.
            choicesDictionary[paragraph] = choicesList
        }
    }
}
