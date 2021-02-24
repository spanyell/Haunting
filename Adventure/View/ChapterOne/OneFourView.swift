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
    @State var slideX = true
    //Sound
    @State var thunderEffect: AVAudioPlayer!
    @State var oneOneOneMusic: AVAudioPlayer!
    //Destination variable
    @State private var viewAction: Int? = 0
    
    var storyPlacement: Int

    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]
        
//        Text(Constants.ONE_FOUR_ONE)
        Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
            .foregroundColor(.white)
            .font(Font.custom("Hoefler Text", size: 25))
            .offset(x: slideX ? 0 : -1000)
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
                .offset(x: slideX ? 0 : 1000)
                .padding()
                .onTapGesture(perform: {
                    withAnimation(.easeInOut(duration: 2))
                    {
                        slideX.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        viewAction = i + 1
                    }
                    
                })
        }
        .navigationBarHidden(true)
    }
}

