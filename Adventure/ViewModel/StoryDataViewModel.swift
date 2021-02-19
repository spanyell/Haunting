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
    
    init()
    {
        retrieveChapterData(chapter: "\(UserDefaults.standard.string(forKey: "chapter") ?? "1")")
    }
    
    func retrieveChapterData(chapter: String)
    {
        self.storyDataList = StoryData.retrieveStoryDataByChapter(chapter: chapter)
        
        print("Size of storyDataList is: \(storyDataList.count)")
    }
}
