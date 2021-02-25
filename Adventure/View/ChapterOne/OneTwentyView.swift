//
//  OneTwentyView.swift
//  Adventure
//
//  Created by Dan Beers on 2/24/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneTwentyView: View {
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0
    
    var storyPlacement: Int
    
    var body: some View {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]
        
        Text(Constants.ONE_TWENTY_ONE)
        Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
            .foregroundColor(.white)
            .font(Font.custom("Hoefler Text", size: 25))
        
        VStack
        {
            NavigationLink(
                destination: OneTwentyOneView(storyPlacement: 21), tag: 1, selection: $viewAction)
            {
                EmptyView()
            }
            NavigationLink(
                destination: CheckpointOne(), tag: 2, selection: $viewAction)
            {
                EmptyView()
            }

        }
        Divider().background(Color.white)
            .frame(height: 100)

        ForEach(choicesArray!.indices, id: \.self)
        {
            i in

            Text("\(choicesArray![i])")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 20))
                .padding()
                .onTapGesture(perform:
                                {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                                    {
                                        viewAction = i + 1
                                    }
                    
                                })
        }
        .navigationBarHidden(true)
    }
}
