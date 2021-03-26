//
//  StartView.swift
//  Adventure
//
//  Created by Dan Beers on 2/16/21.
//

import AVKit
import SwiftUI
import Unrealm

struct StartView: View
{
    @State var flashEffect = false
    @State private var action: Int? = 0
    @State var fadeAway = false
    @StateObject var soundManager = SoundManager()

    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                // Inputting black color with a white and black effect.
                Color(flashEffect ? .white : .black)
                    .frame(alignment: .center)
                    .opacity(flashEffect ? 0 : 1)
                    // inits the music
                    .onAppear
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                        {
                            soundManager.playMusicFile(data: Constants.MAIN_VIEW_MUSIC!.data)
                        }
                    }

                // Text UI
                Text("A Haunting at Willowbrook")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 50))
                    .offset(x: 0, y: -200)
                    .opacity(fadeAway ? 0 : 1)
                // Calls the navigation links in order by tag
                VStack
                {
                    NavigationLink(
                        destination: OnceUponView(), tag: 1, selection: $action)
                    {
                        EmptyView()
                    }
                    NavigationLink(
                        destination: OneOneView(), tag: 2, selection: $action)
                    {
                        EmptyView()
                    }
                    .navigationBarHidden(true)
                }
                // Text UI with graphic animations toggling and sound effects playing.
                VStack
                {
                    Text("New Game")
                        .foregroundColor(.white)
                        .font(Font.custom("Hoefler Text", size: 20))
                        .opacity(fadeAway ? 0 : 1)
                        .padding()
                        .onTapGesture
                        {
                            soundManager.playThunderEffect()
                            flashEffect.toggle()
                            //musicPlayer.setVolume(0, fadeDuration: 2)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                            {
                                fadeAway.toggle()
                               // musicPlayer.stop()
                                action = 1
                            }
                            withAnimation(Animation
                                .easeInOut(duration: 0.1)
                                .repeatCount(4, autoreverses: true))
                            {
                                flashEffect.toggle()

                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                                {
                                    flashEffect.toggle()
                                }
                            }
                        }
                    Text("Continue")
                        .foregroundColor(.white)
                        .font(Font.custom("Hoefler Text", size: 20))
                        .opacity(fadeAway ? 0 : 1)
                        .padding()
                        .onTapGesture
                        {
                            soundManager.playThunderEffect()
                            flashEffect.toggle()
                          //  musicPlayer.setVolume(0, fadeDuration: 2)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                            {
                                fadeAway.toggle()
                             //   musicPlayer.stop()
                                action = 2
                            }
                            withAnimation(Animation
                                .easeInOut(duration: 0.1)
                                .repeatCount(4, autoreverses: true))
                            {
                                flashEffect.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                                {
                                    flashEffect.toggle()
                                }
                            }
                        }
                    Text("Quit")
                        .foregroundColor(.white)
                        .font(Font.custom("Hoefler Text", size: 20))
                        .opacity(fadeAway ? 0 : 1)
                        .padding()
                }
            }
        }
        .preferredColorScheme(.dark)
        .navigationBarHidden(true)
    }
}

struct StartView_Previews: PreviewProvider
{
    static var previews: some View
    {
        StartView()
    }
}
