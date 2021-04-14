//
//  OneFourView.swift
//  Adventure
//
//  Created by Dan Beers on 2/22/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneFourView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @StateObject var soundManager = SoundManager()

    // UI
    @State var onTappy = true
    @State var makeSmally = true
    @State var makeLarge = true
    @State var bouncySpinny = true
    @State var shadows = true
    @State var blurry = true
    @State var moveTextAround = true
    @State private var flashEffect = true
    @State var screenFade = true
    // Sound
    @State var thunderEffect: AVAudioPlayer!
    @State var oneOneOneMusic: AVAudioPlayer!
    // Destination variable
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0

    var storyPlacement: Int
    var musicFile: NSDataAsset?

    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]

        //     Text(Constants.ONE_FOUR_ONE)
        ZStack {
            Color(flashEffect ? .black : .white)
            Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 25))
                .scaleEffect(makeSmally ? 0 : 0.5)
                .offset(y: moveTextAround ? 1000 : 0)
                .scaleEffect(makeLarge ? 0.5 : 2)

                .onAppear
                {
//                    SoundManager.shared.playMusicFile(data: musicFile!.data)
                    
                    withAnimation(.easeIn(duration: 0.5))
                    {
                        moveTextAround.toggle()
                        makeSmally.toggle()
                        blurry.toggle()
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                    {
                        withAnimation(.easeIn(duration: 0.5))
                        {
                            makeLarge.toggle()
                        }
                    }
            }
        }

        VStack
        {
            NavigationLink(destination: OneFiveView(storyPlacement: 5), tag: 1, selection: $viewAction)
            {
                EmptyView()
            }
            NavigationLink(destination: OneSeventeenView(storyPlacement: 17), tag: 2, selection: $viewAction)
            {
                EmptyView()
            }
            NavigationLink(destination: OneEighteenView(storyPlacement: 18), tag: 3, selection: $viewAction)
            {
                EmptyView()
            }
            NavigationLink(destination: OneNineteenView(storyPlacement: 19), tag: 4, selection: $viewAction)
            {
                EmptyView()
            }
        }

        Divider().background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white, Color.black]), startPoint:  .leading, endPoint:  .trailing))
            .frame(height: 100)
            .blur(radius: blurry ? 100 : 0)
            .blur(radius: screenFade ? 0 : 500)

        ForEach(choicesArray!.indices, id: \.self)
        {
            i in

            Text("\(choicesArray![i])")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 20))
                .padding()
                .onTapGesture(perform:
                    {
                        withAnimation(.easeInOut(duration: 0.5))
                        {
                            viewTransition = i + 1

                            if viewTransition == 1
                            {
                                soundManager.playSoundFile2(data: Constants.THUNDERCLAP_AND_RAIN!.data)
                                soundManager.effectPlayer2?.setVolume(0, fadeDuration: 6)
                                SoundManager.shared.stopMusicFile()
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
                            else
                            {
                                screenFade.toggle()
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                        {
                            viewAction = i + 1
                        }
                    })
        }
        .navigationBarHidden(true)
    }
}


