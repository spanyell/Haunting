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
        let startTime = Date().timeIntervalSince1970
        var currentPlayerTime = 0.0
        var timeLeft = 0.0

        do
        {
            player = try AVAudioPlayer(data: data, fileTypeHint: "mp3")
        
            if currentPlayer != nil
            {
                currentPlayer!.numberOfLoops = 0
                currentPlayerTime = currentPlayer!.currentTime
                print("\n\nCurrent player time is: \(currentPlayerTime)")
                timeLeft = 4.00 - currentPlayerTime
                print("\n\nTime left is: \(timeLeft)\n\n")
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + timeLeft)
            {
                print("\n\nTime left is: \(timeLeft)\n\n")
                self.player!.numberOfLoops = -1
                self.player!.play()
                self.currentPlayer = self.player
            }
        }

        catch
        {
            print(error.localizedDescription)
        }
        print("\nTotal elapsed time to play music file is: \((Date().timeIntervalSince1970 - startTime).rounded()) seconds.")
        
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
