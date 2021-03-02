//
//  OneSixView.swift
//  Adventure
//
//  Created by Dan Beers on 2/24/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneSixView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0
    @State var doorOpenEffect = true
    @State var textWalkForward = true
    @State var bringForward = true
    @State var doorOpenAndCreakSound = try! AVAudioPlayer(data: Constants.doorOpenAndCreak!.data, fileTypeHint: "mp3")

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
                    anchorZ: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,
                    perspective: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/
                )
                .scaleEffect(textWalkForward ? 1 : 500)
                .offset()
                .onAppear
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                    {
                        withAnimation(Animation.easeInOut(duration: 3))
                        {
                            doorOpenEffect.toggle()
                        }
                    }
                    doorOpenAndCreakSound.play()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5)
                    {
                        withAnimation(Animation.easeInOut(duration: 4))
                        {
                            textWalkForward.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5)
                    {
                        withAnimation(Animation.easeIn(duration: 3))
                        {
                            bringForward.toggle()
                        }
                    }
                }
            VStack
            {
                Text(Constants.ONE_SIX_ONE)
                Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 25))
                    .scaleEffect(bringForward ? 0 : 1)

                VStack
                {
                    NavigationLink(
                        destination: OneSevenView(storyPlacement: 7), tag: 1, selection: $viewAction)
                    {
                        EmptyView()
                    }
                    NavigationLink(
                        destination: OneEightView(storyPlacement: 8), tag: 2, selection: $viewAction)
                    {
                        EmptyView()
                    }
                }
                Divider().background(Color.white)
                    .frame(height: 100)
                    .scaleEffect(bringForward ? 0 : 1)

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
