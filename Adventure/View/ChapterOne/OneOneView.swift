//
//  OneOneView.swift
//  Adventure
//
//  Created by Dan Beers on 2/22/21.
//

import AVKit
import SwiftUI

struct OneOneView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @ObservedObject var soundManager = SoundManager()
    
    // UI
    @State var moveTextAround = true
    @State var makeSmally = true
    @State var bouncySpinny = true
    @State var shadows = true
    @State var blurry = true
    @State var flashEffect = false
    @State var screenFade = true
    @State var curtainSlideX = true
    
    // Destination variable
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0
    @State var index = 0

    var paragraph = UserDefaults.standard.integer(forKey: "paragraph")

    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[UserDefaults.standard.integer(forKey: "paragraph")]

        ZStack
        {
            Color(flashEffect ? .white : .black)
                .frame(alignment: .center)
                .onAppear
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4)
                    {
                        soundManager.playSoundFile(data: Constants.THUNDER_RUMBLE!.data)
                    }
                }

            VStack
            {
                NavigationLink(
                    destination: OneFourView(storyPlacement: 4, musicFile: Constants.ONE_FOUR_MUSIC!), tag: 1, selection: $viewAction)
                {
                    EmptyView()
                }
                
                NavigationLink(
                    destination: OneTwoView(storyPlacement: 2), tag: 2, selection: $viewAction)
                {
                    EmptyView()
                }
                
                NavigationLink(
                    destination: OneThreeView(storyPlacement: 3), tag: 3, selection: $viewAction)
                {
                    EmptyView()
                }
                
                Text("\(storyDataViewModel.storyDataList[0].dataDescription)")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 25))
                    .padding()
                    .scaleEffect(makeSmally ? 0 : 1.0)
                    .offset(y: moveTextAround ? -200 : 0)
                    .rotationEffect(bouncySpinny ? .degrees(360) : .degrees(0))
                    .blur(radius: screenFade ? 0 : 500)
                    .offset(x: curtainSlideX ? 0 : -1000)
                    .onAppear
                    {
                        withAnimation(.easeInOut(duration: 10.0))
                        {
                            moveTextAround.toggle()
                            makeSmally.toggle()
                            bouncySpinny.toggle()
                            shadows.toggle()
                            blurry.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                        {
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
                    }
                    .shadow(color: shadows ? .white : .black, radius: shadows ? 18 : 0, x: 1, y: 1)

                Divider().background(Color.white)
                    .frame(height: 100)
                    .blur(radius: blurry ? 100 : 0)
                    .blur(radius: screenFade ? 0 : 500)
                    .offset(x: curtainSlideX ? 0 : 1000)

                VStack
                {
                    ForEach(choicesArray!.indices, id: \.self)
                    {
                        i in

                        Text("\(choicesArray![i])")
                            .foregroundColor(.white)
                            .font(Font.custom("Hoefler Text", size: 20))
                            .padding()
                            .blur(radius: blurry ? 100 : 0)
                            .blur(radius: screenFade ? 0 : 500)
                            .offset(y: moveTextAround ? 500 : 0)
                            .offset(x: curtainSlideX ? 0 : 1000)
                            .onTapGesture(perform:
                            {
                                withAnimation(.easeInOut(duration: 0.5))
                                {
                                    viewTransition = i + 1
                                    
                                    if viewTransition == 1
                                    {
                                        soundManager.playSoundFile(data: Constants.DRAW_CURTAINS!.data)
                                        curtainSlideX.toggle()
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
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear
        {
            DispatchQueue.main.asyncAfter(deadline: .now() + 10)
            {
                SoundManager.shared.playMusicFile(data: Constants.ONE_ONE_THRU_ONE_THREE_MUSIC!.data)
            }
        }
    }
}

struct OneOneView_Previews: PreviewProvider
{
    static var previews: some View
    {
        OneOneView()
    }
}
