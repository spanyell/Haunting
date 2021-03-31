//
//  FAKEVIEW.swift
//  Adventure
//
//  Created by Dan Beers on 3/26/21.
//

import AVKit
import SwiftUI
import Unrealm

struct FAKEVIEW: View {
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @StateObject var soundManager = SoundManager()
    @State var isInitialLoad = true
        
    var body: some View
    {
        Text("Hello, World!")
            .onAppear()
            {
                if isInitialLoad
                {
  //                  playfirstsong
                }
            }
            .onTapGesture
            {
                if soundManager.player != nil
                {
                    soundManager.player?.play()
                    isInitialLoad = false
           //         playsecond song
                }
                
            }
    }
}

struct FAKEVIEW_Previews: PreviewProvider {
    static var previews: some View {
        FAKEVIEW()
    }
}
