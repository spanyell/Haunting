//
//  SoundManager.swift
//  Adventure
//
//  Created by Dan Beers on 3/26/21.
//

import Foundation
import Unrealm
import AVKit

class SoundManager: ObservableObject
{
    @Published private var soundFile = Constants.EMPTY_STRING
    
    func playThunderEffect()
    {
        try! AVAudioPlayer(data: Constants.THUNDERCLAP_AND_RAIN!.data, fileTypeHint: "mp3").play()
    }

    func playMusicFile(data: Data)
    {
        try! AVAudioPlayer(data: data, fileTypeHint: "mp3").play()
    }

    func playDrawCurtains()
    {
        try! AVAudioPlayer(data: Constants.DRAW_CURTAINS!.data, fileTypeHint: "mp3").play()
    }
    
    func playOpenDoorAndCreak()
    {
        try! AVAudioPlayer(data: Constants.DOOR_OPEN_AND_CREAK!.data, fileTypeHint: "mp3").play()
    }

}

