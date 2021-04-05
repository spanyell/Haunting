//
//  OneTwoView.swift
//  Adventure
//
//  Created by Dan Beers on 2/22/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneTwoView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @StateObject var soundManager = SoundManager()

    // UI
    @State var onTappy = true
    @State var makeSmally = true
    @State var bouncySpinny = true
    @State var shadows = true
    @State var blurry = true
    @State var screenFade = true
    @State private var flashEffect = false
    @State var curtainSlideX = true
    // Destination Variable
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0

    var storyPlacement: Int
    var musicFile: NSDataAsset?

    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]

        Text(Constants.ONE_TWO_ONE)

        Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
            .foregroundColor(.white)
            .font(Font.custom("Hoefler Text", size: 25))
            .blur(radius: blurry ? 500 : 0)
            .blur(radius: screenFade ? 0 : 500)
            .offset(x: curtainSlideX ? 0 : -1000)
            .onAppear
            {
                SoundManager.shared.playMusicFile(data: musicFile!.data)

                withAnimation(.easeInOut(duration: 1))
                {
                    blurry.toggle()
                }
            }

        VStack
        {
            NavigationLink(
                destination: OneFourView(storyPlacement: 4), tag: 1, selection: $viewAction)
            {
                EmptyView()
            }
            NavigationLink(
                destination: OneThreeView(storyPlacement: 3), tag: 2, selection: $viewAction)
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

            Text("\(choicesArray![i])")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 20))
                .padding()
                .blur(radius: blurry ? 100 : 0)
                .blur(radius: screenFade ? 0 : 500)
                .offset(x: curtainSlideX ? 0 : 1000)
                .onTapGesture(perform:
                    {
                        withAnimation(.easeInOut(duration: 0.5))
                        {
                            viewTransition = i + 1
                            if viewTransition == 1
                            {
                                //     soundManager.playDrawCurtains()
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
        .navigationBarHidden(true)
    }
}

// struct OneTwoView_Previews: PreviewProvider {
//    static var previews: some View {
//        OneTwoOneView()
//    }
// }
