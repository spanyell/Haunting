//
//  OneThreeView.swift
//  Adventure
//
//  Created by Dan Beers on 2/22/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneThreeView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @ObservedObject var soundManager = SoundManager()

    // UI
    @State var moveTextAround = true
    @State var makeSmally = true
    @State var bouncySpinny = true
    @State var shadows = true
    @State var blurry = true
    @State private var flashEffect = false
    @State var screenFade = true
    @State var curtainSlideX = true

    // Destination variable
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0

    var storyPlacement: Int
    var musicFile: NSDataAsset?

    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]

        //     Text(Constants.ONE_THREE_ONE)
        Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
            .foregroundColor(.white)
            .font(Font.custom("Hoefler Text", size: 25))
            .blur(radius: blurry ? 500 : 0)
            .blur(radius: screenFade ? 0 : 500)
            .offset(x: curtainSlideX ? 0 : -1000)
            .onAppear
            {
                withAnimation(.easeInOut(duration: 2))
                {
                    blurry.toggle()
                    moveTextAround.toggle()
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
        }
        Divider().background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white, Color.black]), startPoint:  .leading, endPoint:  .trailing))
            .frame(height: 100)
            .blur(radius: blurry ? 100 : 0)
            .blur(radius: screenFade ? 0 : 500)
            .offset(x: curtainSlideX ? 0 : 1000)
            .offset(y: moveTextAround ? 500 : 0)

        ForEach(choicesArray!.indices, id: \.self)
        {
            i in

            Text("\(choicesArray![i])")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 20))
                .blur(radius: blurry ? 100 : 0)
                .blur(radius: screenFade ? 0 : 500)
                .offset(x: curtainSlideX ? 0 : 1000)
                .offset(y: moveTextAround ? 500 : 0)
                .padding()
                .onTapGesture(perform:
                    {
                        withAnimation(.easeInOut(duration: 1))
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
                                blurry.toggle()
                                moveTextAround.toggle()
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
