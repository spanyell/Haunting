//
//  OneEighteenView.swift
//  Adventure
//
//  Created by Dan Beers on 2/24/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneEighteenView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @StateObject var soundManager = SoundManager()
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0
    @State var blurry = true
    @State var screenFade = true

    var storyPlacement: Int
    var musicFile: NSDataAsset?

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
                    destination: OneTwentyView(storyPlacement: 20), tag: 1, selection: $viewAction)
                {
                    EmptyView()
                }
//                Text(Constants.ONE_EIGHTEEN_ONE)
                Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 25))
                    .blur(radius: blurry ? 500 : 0)
                    .blur(radius: screenFade ? 0 : 500)
                    .onAppear
                    {
                        soundManager.playSoundFile(data: Constants.FLIP_SWITCH!.data)
                        //                SoundManager.shared.playMusicFile(data: musicFile!.data)
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
                                    screenFade.toggle()
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
