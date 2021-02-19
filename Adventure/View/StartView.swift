//
//  StartView.swift
//  Adventure
//
//  Created by Dan Beers on 2/16/21.
//

import SwiftUI
import AVKit

struct StartView: View {
    
    @State var musicPlayer: AVAudioPlayer!
    @State var thunderEffect: AVAudioPlayer!
    @State var flashEffect = false
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(flashEffect ? .white : .black)
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
                        destination: OnceUponView(), tag: 1, selection: $action) {
                        EmptyView()
                    }
                    NavigationLink(
                        destination: StoryView(), tag: 2, selection: $action) {
                        EmptyView()
                    }
                    .navigationBarHidden(true)
                }
                
                VStack {
                    Text("New Game")
                        .foregroundColor(.white)
                        .font(Font.custom("Hoefler Text", size: 30))
                        .onTapGesture {
                            thunderEffect.play()
                            flashEffect.toggle()
                            musicPlayer.setVolume(0, fadeDuration: 2)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                musicPlayer.stop()
                                action = 1
                            }
                            withAnimation(Animation
                                            .easeInOut(duration: 0.1)
                                            .repeatCount(4, autoreverses: true)) {
                                flashEffect.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    flashEffect.toggle()
                                }
                            }
                    }
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(Font.custom("Hoefler Text", size: 30))
                        .onTapGesture {
                            thunderEffect.play()
                            flashEffect.toggle()
                            musicPlayer.setVolume(0, fadeDuration: 2)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                musicPlayer.stop()
                                action = 2
                            }
                            withAnimation(Animation
                                            .easeInOut(duration: 0.1)
                                            .repeatCount(4, autoreverses: true)) {
                                flashEffect.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    flashEffect.toggle()
                                }
                            }
                    }
                    Text("Quit")
                        .foregroundColor(.white)
                        .font(Font.custom("Hoefler Text", size: 20))
                        .padding()
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
