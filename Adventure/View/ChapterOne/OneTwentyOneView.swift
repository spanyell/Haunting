//
//  OneTwentyOneView.swift
//  Adventure
//
//  Created by Dan Beers on 2/24/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneTwentyOneView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @StateObject var soundManager = SoundManager()
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0
    @State var blurry = true
    @State var screenFade = true

    var storyPlacement: Int

    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]

        ZStack
        {
            Color(.black)
                .frame(alignment: .center)
            VStack
            {
                NavigationLink(
                    destination: CheckpointOne(), tag: 1, selection: $viewAction)
                {
                    EmptyView()
                }
                NavigationLink(
                    destination: OneFiveView(storyPlacement: 5), tag: 2, selection: $viewAction)
                {
                    EmptyView()
                }
                NavigationLink(
                    destination: OneNineteenView(storyPlacement: 19), tag: 3, selection: $viewAction)
                {
                    EmptyView()
                }
                NavigationLink(
                    destination: OneSeventeenView(storyPlacement: 17), tag: 4, selection: $viewAction)
                {
                    EmptyView()
                }
//                Text(Constants.ONE_TWENTYONE_ONE)
                Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 25))
                    .blur(radius: blurry ? 500 : 0)
                    .blur(radius: screenFade ? 0 : 500)
                    .onAppear
                    {
                        withAnimation(.easeInOut(duration: 1))
                        {
                            blurry.toggle()
                        }
                    }
                Divider().background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white, Color.black]), startPoint: .leading, endPoint: .trailing))
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
                        .blur(radius: blurry ? 100 : 0)
                        .blur(radius: screenFade ? 0 : 500)
                        .onTapGesture(perform:
                            {
                                withAnimation(.easeInOut(duration: 0.5))
                                {
                                    viewTransition = i + 1

                                    if viewTransition == 1
                                    {
                                        soundManager.playSoundFile2(data: Constants.THUNDERCLAP_AND_RAIN!.data)
                                        soundManager.effectPlayer2?.setVolume(0, fadeDuration: 6)
                                        //                                SoundManager.shared.stopMusicFile()
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
            .navigationBarHidden(true)
        }
    }
}
