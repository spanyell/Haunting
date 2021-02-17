//
//  AdventureApp.swift
//  Adventure
//
//  Created by Larry Burris on 2/14/21.
//
import SwiftUI
import Unrealm

@main

struct AdventureApp: App
{
    //  The adaptor which allows us to have an AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene
    {
        WindowGroup
        {
            ContentView()
        }
    }
}

//  This is the old AppDelegate file that was removed in the latest version of Swift.  I'm adding it back so that we can register the Realm objects
//  in the didFinishLaunchingWithOptions method and to call the database code for testing.
class AppDelegate: NSObject, UIApplicationDelegate
{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool
    {
        //  Register the database table objects
        Realm.registerRealmables(StoryData.self)
        
        //  Test the code by adding a record to the database
        saveAndPrintStoryData()
        
        return true
    }
}

func saveAndPrintStoryData()
{
    let realm = try! Realm()
    
    //  Create an object which represents a single row of data in the StoryData table in the database
    let storyDataItem = StoryData(id: "1",
                              chapter: "1",
                              paragraph: "1",
                              dataDescription: "When you open your eyes, you find yourself sitting on a large canopy bed. You have no recollection of how you got here or where you are. The room is dark save for the flashes of sporadic lightning from the window on the opposite side of the room. What do you do?",
                              choices: "Try to remember how you got there.,Look around the room.,Stand up.",
                              isCompleted: false)
    
    try! realm.write
    {
        //  Add the row into the table.  If row exists, it is updated, otherwise a new row is added.
        realm.add(storyDataItem, update: .all)
    }
    
    //  Retrieve the saved row and populate the data into a new StoryData object
    let savedStoryDataItem = realm.object(ofType: StoryData.self, forPrimaryKey: "1")
    
    //  Print the dataDescription field data
    print("\n\n" + savedStoryDataItem!.dataDescription + "\n\nChoices:\n")
    
    //  The choices were saved as three different comma-delimited statements.  We need make each statement an element of an array.
    let choiceArray = savedStoryDataItem!.choices.components(separatedBy: ",")
    
    //  Print the choices
    for choice in choiceArray
    {
        print(choice)
    }
    
    print("\n\n")
    
    //  Print the database file URL
    print(Realm.Configuration.defaultConfiguration.fileURL!)
}


