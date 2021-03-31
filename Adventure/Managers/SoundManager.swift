//
//  SoundManager.swift
//  Adventure
//
//  Created by Dan Beers on 3/26/21.
//

import Foundation
import AVKit

class SoundManager: ObservableObject
{
    @Published var player: AVAudioPlayer?
    private var currentPlayer: AVAudioPlayer?
    
    func playMusicFile(data: Data)
    {
        var currentPlayerTime: Double
        var timeLeft: Double

        do
        {
            self.player = try AVAudioPlayer(data: data, fileTypeHint: "mp3")
            self.currentPlayer = player
            currentPlayerTime = player!.currentTime
            timeLeft = 4.00 - currentPlayerTime
            
            
            
            if self.player != nil
            {
                self.player!.play()
                currentPlayerTime = player!.currentTime
                
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + timeLeft)
            {
                self.player!.play()
            }
        }
        
        catch
        {
            print(error.localizedDescription)
        }
    }
}
