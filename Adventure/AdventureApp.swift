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

        DatabaseManager().loadCSVFileData()

        StoryDataViewModel().retrieveChapterData(chapter: "1")

        return true
    }
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
