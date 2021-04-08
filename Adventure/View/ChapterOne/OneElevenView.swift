//
//  OneElevenView.swift
//  Adventure
//
//  Created by Dan Beers on 2/24/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneElevenView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0
    @State var blurry = true
    @State var screenFade = true

    var storyPlacement: Int

    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]

        Text(Constants.ONE_ELEVEN_ONE)
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

        VStack
        {
            NavigationLink(
                destination: OneTenView(storyPlacement: 10), tag: 1, selection: $viewAction)
            {
                EmptyView()
            }
            NavigationLink(
                destination: OneTwelveView(storyPlacement: 12), tag: 2, selection: $viewAction)
            {
                EmptyView()
            }
            NavigationLink(
                destination: OneSixteenView(storyPlacement: 16), tag: 3, selection: $viewAction)
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

            if !UtilitiesManager.shared.viewedChoices.contains(choicesArray![i])
            {
                Text("\(choicesArray![i])")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 20))
                    .padding()
                    .blur(radius: blurry ? 100 : 0)
                    .blur(radius: screenFade ? 0 : 500)
                    .onTapGesture(perform:
                        {
                            UtilitiesManager.shared.viewedChoices.append(choicesArray![i])

                            print("\n\nAdding \(choicesArray![i]) to the viewedChoices array!")

                            print("Size of viewedChoices array is: \(UtilitiesManager.shared.viewedChoices.count)\n\n")

                            for choice in UtilitiesManager.shared.viewedChoices
                            {
                                print("\n\nViewedChoices array value is: \(choice)")
                            }

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
