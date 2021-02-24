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
    
    //UI
    @State var onTappy = true
    @State var makeSmally = true
    @State var bouncySpinny = true
    @State var shadows = true
    @State var blurry = true
    @State private var flashEffect = false
    @State var screenFade = true
    //Sound
    @State var thunderEffect: AVAudioPlayer!
    @State var oneOneOneMusic: AVAudioPlayer!
    //Destination variable
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0
    
    var storyPlacement: Int

    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]
        
//        Text(Constants.ONE_FOUR_ONE)
        Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
            .foregroundColor(.white)
            .font(Font.custom("Hoefler Text", size: 25))
            .onAppear
            {
            }
        
        VStack
        {
            NavigationLink(destination: StartView(), tag: 1, selection: $viewAction)
            {
                EmptyView()
            }
        }
        Divider().background(Color.white)
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
                .onTapGesture(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        viewAction = i + 1
                    }
                    
                })
        }
        .navigationBarHidden(true)
    }
}

