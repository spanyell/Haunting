//
//  OneFourOneView.swift
//  Adventure
//
//  Created by Dan Beers on 2/22/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneFourOneView: View {
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @State var onTappy = true
    @State var makeSmally = true
    @State var bouncySpinny = true
    @State var shadows = true
    @State var blurry = true
    @State private var flashEffect = false
    @State var thunderEffect: AVAudioPlayer!
    @State var oneOneOneMusic: AVAudioPlayer!
    var storyPlacement: String
    @State private var viewAction: Int? = 0
    var body: some View {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]
        Text("1.4.1")
        Text("\(storyDataViewModel.storyDataList[Int(storyPlacement)! - 1].dataDescription)")
            .onAppear() {
            }
        VStack
        {
            NavigationLink(
                destination: StartView(), tag: 1, selection: $viewAction)
            {
                EmptyView()
            }
        }

        ForEach(choicesArray!.indices, id: \.self)
        {
            i in
            
            //index = i

            Text("\(choicesArray![i])")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 15))
                    .padding()
                    .onTapGesture(perform: {
                        viewAction = i + 1
                    })
            
        }
    }
}
