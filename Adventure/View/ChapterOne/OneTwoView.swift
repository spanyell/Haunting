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
    
    //UI
    @State var onTappy = true
    @State var makeSmally = true
    @State var bouncySpinny = true
    @State var shadows = true
    @State var blurry = true
    @State var screenFade = true
    @State private var flashEffect = false
    //Sound
    @State var thunderEffect: AVAudioPlayer!
    @State var oneOneOneMusic: AVAudioPlayer!
    //Destination Variable
    @State private var viewAction: Int? = 0
    
    var storyPlacement: Int
    
    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]
        
//        Text(Constants.ONE_TWO_ONE)
        
        Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
            .foregroundColor(.white)
            .font(Font.custom("Hoefler Text", size: 25))
            .blur(radius: blurry ? 500 : 0)
            .blur(radius: screenFade ? 0 : 500)
            .onAppear
            {
                withAnimation(.easeInOut(duration: 2))
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

        ForEach(choicesArray!.indices, id: \.self)
        {
            i in

            Text("\(choicesArray![i])")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 20))
                .padding()
                .blur(radius: blurry ? 100 : 0)
                .blur(radius: screenFade ? 0 : 500)
                .padding()
                .onTapGesture(perform: {
                    withAnimation(.easeInOut(duration: 1))
                    {
                        screenFade.toggle()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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

