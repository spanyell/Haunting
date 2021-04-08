//
//  OneFiveView.swift
//  Adventure
//
//  Created by Dan Beers on 2/24/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneFiveView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @StateObject var soundManager = SoundManager()
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0
    @State var doorOpenEffect = true
    @State var textWalkForward = true
    @State var bringForward = true
    @State var blurry = true
    @State var screenFade = true


    var storyPlacement: Int

    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]

        ZStack
        {
            Color.black
                .frame(alignment: .center)
            Text("THE\nDOOR\nGROANS\nOPEN.").multilineTextAlignment(.trailing)
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 70))
                .rotation3DEffect(
                    .degrees(doorOpenEffect ? 0 : -76),
                    axis: (x: 0.0, y: 1.0, z: 0.0),
                    anchor: .trailing,
                    anchorZ: 0.0,
                    perspective: 1.0
                )
                .scaleEffect(textWalkForward ? 1 : 300)

                .onAppear
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                    {
                        withAnimation(Animation.easeInOut(duration: 3))
                        {
                            doorOpenEffect.toggle()
                        }
                    }
                    soundManager.playSoundFile(data: Constants.DOOR_OPEN_AND_CREAK!.data)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5)
                    {
                        withAnimation(Animation.easeIn(duration: 12))
                        {
                            textWalkForward.toggle()
                            
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5)
                    {
                        withAnimation(Animation.easeIn(duration: 3))
                        {
                            bringForward.toggle()
                            blurry.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.5)
                    {
                        soundManager.playAmbienceFile2(data: Constants.WATER_DRIP_BATHTUB!.data)
                        soundManager.ambienceFile2PanLeft()
                    }
                }
            VStack
            {
                Text(Constants.ONE_FIVE_ONE)
                Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 25))
                    .scaleEffect(bringForward ? 0 : 1)

                VStack
                {
                    NavigationLink(
                        destination: OneSixView(storyPlacement: 6), tag: 1, selection: $viewAction)
                    {
                        EmptyView()
                    }
                    NavigationLink(
                        destination: OneSevenView(storyPlacement: 7), tag: 2, selection: $viewAction)
                    {
                        EmptyView()
                    }
                    NavigationLink(
                        destination: OneEightView(storyPlacement: 8), tag: 3, selection: $viewAction)
                    {
                        EmptyView()
                    }
                }
                Divider().background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white, Color.black]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                    .frame(height: 100)
                    .scaleEffect(bringForward ? 0 : 1)
                    .blur(radius: blurry ? 100 : 0)
                    .blur(radius: screenFade ? 0 : 500)

                ForEach(choicesArray!.indices, id: \.self)
                {
                    i in

                    Text("\(choicesArray![i])")
                        .foregroundColor(.white)
                        .font(Font.custom("Hoefler Text", size: 20))
                        .padding()
                        .scaleEffect(bringForward ? 0 : 1)
                        .onTapGesture(perform:
                            {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0)
                                {
                                    viewAction = i + 1
                                }

                            })
                }
            }
        }
        .navigationBarHidden(true)
    }
}
