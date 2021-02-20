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
            StartView()
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
        UserDefaults.standard.set("1", forKey: "chapter")
        UserDefaults.standard.set("1", forKey: "paragraph")
        
        //  Test the code by adding a record to the database
 //           saveAndPrintStoryData()
                
        DatabaseManager().saveAndPrintStoryData()
        
        StoryDataViewModel().retrieveChapterData(chapter: "1")
        

        
        return true
    }
}



func saveAndPrintStoryData()
{
    let realm = try! Realm()
    
    //  Create an object which represents a single row of data in the StoryData table in the database
    let storyDataItem = StoryData(id: UUID().uuidString,
                              chapter: "1",
                              paragraph: "1",
                              subparagraph: "1",
                              dataDescription: "With a gasp, you open your eyes. You lay on a canopy bed, the curtains drawn. It is dark, save for the intermittent flashes of lightning. You are above the covers, though judging how stiff you feel, it is obvious you have been sleeping for some time. You had been dreaming, though with each passing second, it fades. Who are you? Where are you?",
                              isCompleted: false)
    
    try! realm.write
    {
        //  Add the row into the table.  If row exists, it is updated, otherwise a new row is added.
        realm.add(storyDataItem, update: .all)
    }
    
    //  Retrieve the saved row and populate the data into a new StoryData object
    let savedStoryDataItem = realm.objects(StoryData.self).last
    
    //  Print the dataDescription field data
    print("\n\n" + savedStoryDataItem!.dataDescription + "\n\nChoices:\n")
    
    //  The choices were saved as three different comma-delimited statements.  We need make each statement an element of an array.
    let choiceArray = savedStoryDataItem!.choices.components(separatedBy: "*")
    
    //  Print the choices
    for choice in choiceArray
    {
        print(choice)
    }
    
    print("\n\n")
    
    //  Print the database file URL
    print(Realm.Configuration.defaultConfiguration.fileURL!)
}

func getNextPrimaryKey() -> Int
{
    let realm = try! Realm()
    
    //  Retrieve the saved row and return the id + 1
    if let savedStoryDataItem = realm.objects(StoryData.self).sorted(byKeyPath: "id", ascending: true).last
    {
        //  Print the primary key
        print("\n\nPrimary key in getNextPrimaryKey is:" + savedStoryDataItem.id + "\n\n")
        
        return Int(savedStoryDataItem.id) ?? 0
    }
    
    return 0
}
