//
//  FAKEVIEW.swift
//  Adventure
//
//  Created by Dan Beers on 3/26/21.
//

import AVKit
import SwiftUI
import Unrealm

struct FAKEVIEW: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @StateObject var soundManager = SoundManager()
    @State var blurry = true

    var body: some View
    {
        VStack
        {
            Text("Turn it on!")
                .onTapGesture
                {
                    SoundManager.shared.playMusicFile(data: Constants.ONE_ONE_THRU_ONE_THREE_MUSIC!.data)
                }
            Divider().background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white, Color.black]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .frame(height: 100)
                .blur(radius: blurry ? 1000 : 0)
            Text("Turn it off!")
                .onTapGesture
                {
                    SoundManager.shared.stopMusicFile()
                }
        }
                    
    }
}

struct FAKEVIEW_Previews: PreviewProvider
{
    static var previews: some View
    {
        FAKEVIEW()
    }
}
