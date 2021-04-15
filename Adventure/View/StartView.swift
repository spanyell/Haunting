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

                    // Inits the main view music.
                    .onAppear
                    {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                        {
                            soundManager.playSoundFile(data: Constants.MAIN_VIEW_MUSIC!.data)
                        }
                    }

                // Text UI
                Text("The Willowbrook Loop")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 50))
                    .multilineTextAlignment(.center)
                    .offset(x: 0, y: -200)
                    .opacity(fadeAway ? 0 : 1)
                
                // Calls the navigation links in order by tag. The Continue button takes user to the beginning still. Needs to be fixed to save the last spot.

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
                    NavigationLink(
                        destination: OneFiveView(storyPlacement: 5), tag: 3, selection: $action)
                    {
                        EmptyView()
                    }
                    .navigationBarHidden(true)
                }
                
                // Text UI with graphic animations toggling and sound effects playing.
                VStack
                {
                    Text("New Game")
                        .onTapGesture
                        {
                            soundManager.playSoundFile(data: Constants.THUNDERCLAP_AND_RAIN!.data)
                            soundManager.playAmbienceFile(data: Constants.RAIN_AMBIENCE!.data)
                            flashEffect.toggle()

                            DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                            {
                                fadeAway.toggle()
                                action = 1
                                soundManager.effectPlayer?.setVolume(0, fadeDuration: 10)
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
                        .onTapGesture
                        {
                            soundManager.playSoundFile(data: Constants.THUNDERCLAP_AND_RAIN!.data)
                            soundManager.playAmbienceFile(data: Constants.RAIN_AMBIENCE!.data)
                            flashEffect.toggle()

                            DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                            {
                                fadeAway.toggle()
                                action = 2
                                soundManager.effectPlayer?.setVolume(0, fadeDuration: 10)
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
                        .padding()
                    
                    Text("Quit")
                        .onTapGesture {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                            {
                                fadeAway.toggle()
                                action = 3
                                soundManager.effectPlayer?.setVolume(0, fadeDuration: 2)
                            }
                        }
                }
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 20))
                .opacity(fadeAway ? 0 : 1)
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
