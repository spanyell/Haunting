//
//  OneOneView.swift
//  Adventure
//
//  Created by Dan Beers on 2/22/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneOneView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    //UI
    @State var moveAround = true
    @State var makeSmally = true
    @State var bouncySpinny = true
    @State var shadows = true
    @State var blurry = true
    @State private var flashEffect = false
    @State var screenFade = true
    //Sound
    @State var thunderEffect: AVAudioPlayer!
    @State var oneOneOneMusic: AVAudioPlayer!
    // Destination variable
    @State private var viewAction: Int? = 0
    @State var index = 0
    
    var paragraph = UserDefaults.standard.integer(forKey: "paragraph")
    
    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[UserDefaults.standard.integer(forKey: "paragraph")]

        ZStack
        {
            Color(flashEffect ? .white : .black)
                .frame(alignment: .center)
                .onAppear
                {
                    if let thunderclapAndRain = NSDataAsset(name: "ThunderclapAndRain")
                    {
                        thunderEffect = try! AVAudioPlayer(data: thunderclapAndRain.data, fileTypeHint: "mp3")
                        if let oneOneMusic = NSDataAsset(name: "1_1_1_music")
                        {
                            oneOneOneMusic = try! AVAudioPlayer(data: oneOneMusic.data, fileTypeHint: "mp3")
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4)
                    {
                        thunderEffect.play()
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
                    destination: OneTwoView(storyPlacement: 2), tag: 2, selection: $viewAction)
                {
                    EmptyView()
                }
                NavigationLink(
                    destination: OneThreeView(storyPlacement: 3), tag: 3, selection: $viewAction)
                {
                    EmptyView()
                }
                Text("\(storyDataViewModel.storyDataList[0].dataDescription)")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 25))
                    .padding()
                    .scaleEffect(makeSmally ? 0 : 1.0)
                    .offset(y: moveAround ? -200 : 0)
                    .rotationEffect(bouncySpinny ? .degrees(180) : .degrees(0))
                    .blur(radius: screenFade ? 0 : 500)
                    .onAppear
                    {
                        withAnimation(.easeInOut(duration: 10.0))
                        {
                            moveAround.toggle()
                            makeSmally.toggle()
                            bouncySpinny.toggle()
                            shadows.toggle()
                            blurry.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
                        {
                            withAnimation(Animation
                                .easeInOut(duration: 0.1)
                                .repeatCount(4, autoreverses: true))
                            {
                                flashEffect.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                                {
                                    flashEffect.toggle()
                                }
                            }
                        }
                    }
                    .shadow(color: shadows ? .white : .black, radius: shadows ? 18 : 0, x: 1, y: 1)
                
                Divider().background(Color.white)
                    .frame(height: 100)
                    .blur(radius: blurry ? 100 : 0)
                    .blur(radius: screenFade ? 0 : 500)

                VStack
                {
                    ForEach(choicesArray!.indices, id: \.self)
                    {
                        i in
                        
                        //index = i

                        Text("\(choicesArray![i])")
                            .foregroundColor(.white)
                            .font(Font.custom("Hoefler Text", size: 20))
                            .padding()
                            .blur(radius: blurry ? 100 : 0)
                            .blur(radius: screenFade ? 0 : 500)
                            .offset(y: moveAround ? 500 : 0)
                            .onTapGesture(perform: {
                                withAnimation(.easeInOut(duration: 2))
                                {
                                    screenFade.toggle()
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    viewAction = i + 1
                                }
                                
                            })
                            .onAppear
                            {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 10)
                                {
                                    oneOneOneMusic.play()
                                }
                            }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}


struct OneOneView_Previews: PreviewProvider {
    static var previews: some View {
        OneOneView()
    }
}

