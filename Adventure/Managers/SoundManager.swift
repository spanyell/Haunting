//
//  SoundManager.swift
//  Adventure
//
//  Created by Dan Beers on 3/26/21.
//

import AVKit
import Foundation

class SoundManager: ObservableObject
{
    static let shared = SoundManager()
    
    @Published var player: AVAudioPlayer?
    @Published var effectPlayer: AVAudioPlayer?
    private var currentPlayer: AVAudioPlayer?

    func playMusicFile(data: Data)
    {
        var currentPlayerTime = 0.0
        var timeLeft = 0.0

        do
        {
            player = try AVAudioPlayer(data: data, fileTypeHint: "mp3")
            currentPlayerTime = player!.currentTime
            timeLeft = 4.00 - currentPlayerTime
            print(timeLeft)

            if currentPlayer != nil
            {
                currentPlayerTime = player!.currentTime
                print("\n\nCurrent player time is: \(currentPlayerTime)")
                timeLeft = 4.00 - currentPlayerTime
                print("\n\nTime left is: \(timeLeft)\n\n")
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + timeLeft)
            {
                self.player!.numberOfLoops = -1
                self.player!.play()
            }
        }

        catch
        {
            print(error.localizedDescription)
        }
        currentPlayer = player
    }
    
    func playSoundFile(data: Data)
    {
        do
        {
            effectPlayer = try AVAudioPlayer(data: data, fileTypeHint: "mp3")
            self.effectPlayer!.play()
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
}
