//
//  StartView.swift
//  Adventure
//
//  Created by Dan Beers on 2/16/21.
//

import SwiftUI
import AVKit

struct StartView1: View {
    
    @State var musicPlayer: AVAudioPlayer!
    @State var thunderEffect: AVAudioPlayer!
    @State var flashEffect = false
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .frame(alignment: .center)
                    .opacity(flashEffect ? 0 : 1)
                
                Text("Adventure Game")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 50))
                    .offset(x: 0, y: -200)
                
                Image(systemName: "play")
                    .foregroundColor(.white)
                    .offset(x: -200, y: -300)
                    .onAppear() {
                        if let mainViewMusic = NSDataAsset(name: "MainViewMusic") {
                            musicPlayer = try! AVAudioPlayer(data: mainViewMusic.data, fileTypeHint: "mp3")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                musicPlayer.play()
                            }
                        }
                        if let thunderclapAndRain = NSDataAsset(name: "ThunderclapAndRain") {
                            thunderEffect = try! AVAudioPlayer(data: thunderclapAndRain.data, fileTypeHint: "mp3")
                        }
                    }
                    .onTapGesture {
                        musicPlayer.pause()
                    }
                
                VStack {
                    NavigationLink(
                        destination: OnceUponView(),
                        label: {
                            Text("New Game")
                                .foregroundColor(.white)
                                .font(Font.custom("Hoefler Text", size: 20))
                                .padding()
                    })

                    NavigationLink(
                        destination: OnceUponView(),
                        label: {
                            Text("Continue")
                                .foregroundColor(.white)
                                .font(Font.custom("Hoefler Text", size: 20))
                                .padding()
                                
                                 
                                
                    })
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                    Text("Quit")
                        .foregroundColor(.white)
                        .font(Font.custom("Hoefler Text", size: 20))
                        .padding()
                }
            }
        }
        .preferredColorScheme(.dark)
        .onTapGesture {
            thunderEffect.play()
            musicPlayer.setVolume(0, fadeDuration: 2)
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                musicPlayer.stop()
            }
        }
    }
}

struct StartView1_Previews: PreviewProvider {
    static var previews: some View {
        StartView1()
    }
}
