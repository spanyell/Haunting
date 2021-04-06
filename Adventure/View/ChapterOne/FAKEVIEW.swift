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

    var body: some View
    {
        VStack
        {
            Text("Turn it on!")
                .onTapGesture
                {
                    soundManager.playAmbienceFile(data: Constants.RAIN_AMBIENCE!.data)
                    soundManager.ambiencePlayer!.volume = 0.3
                }
            Text("Turn it off!")
                .onTapGesture
                {
                    soundManager.ambiencePlayer?.setVolume(0, fadeDuration: 2)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                    {
                        soundManager.ambiencePlayer?.stop()
                    }
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
