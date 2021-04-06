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
    @Published var ambiencePlayer: AVAudioPlayer?
    
    private var currentPlayer: AVAudioPlayer?

    func playMusicFile(data: Data)
    {
        print("\n\nIn playMusicFile function...\n\n")
        
        let startTime = Date().timeIntervalSince1970
        
        var currentPlayerTime = 0.0
        var timeLeft = 0.0

        do
        {
            //  Create a new player with the passed in data file
            player = try AVAudioPlayer(data: data, fileTypeHint: "wav")
        
            //  Check to see if there is already a music file playing
            if currentPlayer != nil
            {
                print("\n\nThe current player exists!\n\n")
                
                print("\n\nNumber of loops for current player before setting to zero is \(currentPlayer!.numberOfLoops)\n\n")
                
                //  Set the number of loops to 0 for the music file that is currently playing
                currentPlayer!.numberOfLoops = 0
                
                print("\n\nNumber of loops for current player after setting to zero  is \(currentPlayer!.numberOfLoops)\n\n")
                
                //  Get the number of seconds that the current sound file has been playing
                currentPlayerTime = currentPlayer!.currentTime
                print("\n\nCurrent player time is: \(currentPlayerTime)")
                
                //  Since all sound file are exactly 4 seconds long, subtract the number of seconds played from 4.00
                timeLeft = 4.00 - currentPlayerTime
                print("\n\nTime left is: \(timeLeft)\n\n")
            }
            else
            {
                print("\n\nThe current player DOES NOT exist!\n\n")
            }
            
            //  Wait the number of seconds left to play the current sound file before playing the new sound file
            DispatchQueue.main.asyncAfter(deadline: .now() + timeLeft)
            {
                print("\n\nPlaying new music file...!\n\n")
                
                //  Set the new sound file to loop indefinitely and play the sound
                self.player!.numberOfLoops = -1
                self.player!.play()
                
                print("\n\nSetting player as current player...!\n\n")
                
                //  Set the newly created player as the current player
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
    
    func playAmbienceFile(data: Data)
    {
        do
        {
            ambiencePlayer = try AVAudioPlayer(data: data, fileTypeHint: "mp3")
            
            self.ambiencePlayer!.play()
            self.ambiencePlayer!.volume = 0.2
            self.ambiencePlayer!.numberOfLoops = -1
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
    
//    func stopAmbienceFile(data: Data)
//    {
//        do
//        {
//            self.ambiencePlayer!.setVolume(0, fadeDuration: 2)
//            self.ambiencePlayer!.stop()
//        }
//        catch
//        {
//            print(error.localizedDescription)
//        }
//    }
}
