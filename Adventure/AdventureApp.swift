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
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        //  Register the database table objects
        Realm.registerRealmables(StoryData.self)
        UserDefaults.standard.set("1", forKey: "chapter")
        UserDefaults.standard.set("1", forKey: "paragraph")

        DatabaseManager().saveAndPrintStoryData()

        StoryDataViewModel().retrieveChapterData(chapter: "1")

        let storyDataList = loadCSVFileData()
        
        print("Number of records in storyDataList is: \(storyDataList.count)")

        return true
    }
}

func loadCSVFileData() -> [StoryData]
{
    var storyDataList = [StoryData]()
    
    guard let filepath = Bundle.main.path(forResource: "Haunting", ofType: "csv") else { return  storyDataList}

    var data = ""

    do
    {
        //  Load the data using the file path as one long string
        data = try String(contentsOfFile: filepath)

        //  Populate a rows array
        var rows = data.components(separatedBy: "\n")

        //  Remove the headers in the first row
        rows.removeFirst()

        //  Create columns for each row
        for row in rows
        {
            let columns = row.components(separatedBy: ",")
            
            print("Column count is \(columns.count) for row \(row)")

            //  Ensure that we have 6 columns of data
            if columns.count == 7
            {
                //  Get the data from the colunms and populate the field values
                let chapter = columns[0]
                let paragraph = columns[1]
                let subparagraph = columns[2]
                let dataDescription = columns[3]
                let choices = columns[4]
                let isCompleted = columns[5] == "False"
                let choiceDestination = columns[6]
                
                //  Create a new StoryData object with the field values
                let storyData = StoryData(id: UUID().uuidString, chapter: chapter, paragraph: paragraph,
                                          subparagraph: subparagraph, dataDescription: dataDescription, choices: choices, isCompleted: isCompleted, choiceDestination: choiceDestination)
                
                //  Add the row to the storyDataList
                storyDataList.append(storyData)
            }
        }
        
        print("Number of records in storyDataList in loadCSVFileData is: \(storyDataList.count)")
    }
    catch
    {
        print(error)

        return storyDataList
    }
    
    return storyDataList
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
                                  isCompleted: false,
                                  choiceDestination: "1.4.1*1.2.1*1.3.1")

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
