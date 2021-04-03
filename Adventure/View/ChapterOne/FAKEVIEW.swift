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
        
    var body: some View
    {
        Text("Hello, World!")
            .onTapGesture {
                SoundManager.shared.playMusicFile(data: Constants.ONE_ONE_MUSIC!.data)
            }
    }
}

struct FAKEVIEW_Previews: PreviewProvider {
    static var previews: some View {
        FAKEVIEW()
    }
}
