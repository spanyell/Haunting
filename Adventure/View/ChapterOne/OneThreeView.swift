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
                withAnimation(.easeInOut(duration: 1))
                {
                    blurry.toggle()
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
        Divider().background(Color.white)
            .frame(height: 100)
            .blur(radius: blurry ? 100 : 0)
            .blur(radius: screenFade ? 0 : 500)
            .offset(x: curtainSlideX ? 0 : 1000)

        ForEach(choicesArray!.indices, id: \.self)
        {
            i in

            if (!storyDataViewModel.viewedChoices.contains(choicesArray![i]))
            {
                Text("\(choicesArray![i])")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 20))
                .padding()
                .blur(radius: blurry ? 100 : 0)
                .blur(radius: screenFade ? 0 : 500)
                .offset(x: curtainSlideX ? 0 : 1000)
                .onTapGesture(perform:
                {
                    storyDataViewModel.viewedChoices.append(choicesArray![i])
                    
                    print("\n\nAdding \(choicesArray![i]) to the viewedChoices array!")
                    
                    print("Size of viewedChoices array is: \(storyDataViewModel.viewedChoices.count)\n\n")
                    
                    for choice in storyDataViewModel.viewedChoices
                    {
                        print("\n\nViewedChoices array value is: \(choice)")
                    }
                    
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
        .navigationBarHidden(true)
    }
}
