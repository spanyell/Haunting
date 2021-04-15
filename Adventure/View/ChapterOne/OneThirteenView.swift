//
//  OneThirteenView.swift
//  Adventure
//
//  Created by Dan Beers on 2/24/21.
//

import AVKit
import SwiftUI
import Unrealm

struct OneThirteenView: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @StateObject var soundManager = SoundManager()
    @State private var viewAction: Int? = 0
    @State private var viewTransition: Int? = 0
    @State var blurry = true
    @State var screenFade = true
    @State var blurryFirstSentence = true
    @State var blurrySecondSentence = true
    @State var blurryThirdSentence = true
    @State var blurryFourthSentence = true
    @State var blurryFifthSentence = true
    @State var growCircle = true
    @State var moveLetters = true
    @State var turnLetters = true
    @State var opacityLetters = true
    @State var fadeInLetters = true
    @State var shadowFadeLetter = true

    var storyPlacement: Int

    var body: some View
    {
        let choicesArray = storyDataViewModel.choicesDictionary[storyPlacement]

        ZStack
        {
            Color(.black)
                .frame(alignment: .center)
                .onAppear
                {
                    SoundManager.shared.stopAmbienceFile2()
                    soundManager.playSoundFile(data: Constants.TUB_DRAIN!.data)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                    {
                        withAnimation(Animation
                            .easeInOut(duration: 4)
                            .repeatCount(7, autoreverses: false))
                        {
                            growCircle.toggle()
                            soundManager.playSoundFile2(data: Constants.WATER_DRIP_BATHTUB!.data)
                            soundManager.effectPlayer2?.numberOfLoops = 6
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now())
                    {
                        withAnimation(Animation
                            .easeInOut(duration: 2))
                        {
                            blurryFirstSentence.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5)
                    {
                        withAnimation(Animation
                            .easeInOut(duration: 2))
                        {
                            blurryFirstSentence.toggle()
                            blurrySecondSentence.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10)
                    {
                        withAnimation(Animation
                            .easeInOut(duration: 2))
                        {
                            blurrySecondSentence.toggle()
                            blurryThirdSentence.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15)
                    {
                        withAnimation(Animation
                            .easeInOut(duration: 2))
                        {
                            blurryThirdSentence.toggle()
                            blurryFourthSentence.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 20)
                    {
                        withAnimation(Animation
                            .easeInOut(duration: 2))
                        {
                            blurryFourthSentence.toggle()
                            blurryFifthSentence.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 25)
                    {
                        withAnimation(Animation
                            .easeInOut(duration: 2))
                        {
                            blurryFifthSentence.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 26)
                    {
                        withAnimation(Animation
                            .easeInOut(duration: 4))
                        {
                            opacityLetters.toggle()
                        }
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 30)
                    {
                        soundManager.playSoundFile(data: Constants.WATER_DRIP_BATHTUB!.data)
                        growCircle = true
                        withAnimation(Animation
                            .easeInOut(duration: 4))
                        {
                            growCircle.toggle()

                            // Allowing a short delay between the drop effect and the letter skewing.
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
                            {
                                withAnimation(Animation
                                    .easeOut(duration: 5))
                                {
                                    moveLetters.toggle()
                                    turnLetters.toggle()
                                    shadowFadeLetter.toggle()
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5)
                            {
                                withAnimation(Animation
                                    .easeOut(duration: 1.5))
                                {
                                    opacityLetters.toggle()
                                    shadowFadeLetter.toggle()
                                    blurry.toggle()
                                }
                            }
                        }
                    }
                }
            VStack
            {
                VStack
                {
                    Text("There is a bit of resistance as you tug the plug loose with the chain.")
                        .blur(radius: blurryFirstSentence ? 200 : 0)
                        .padding()
                        .padding()
                    Text("The water drains, though with little haste.")
                        .blur(radius: blurrySecondSentence ? 200 : 0)
                        .padding()
                        .padding()
                    Text("As you study the mucky water, you suddenly feel as though you are not alone anymore.")
                        .blur(radius: blurryThirdSentence ? 200 : 0)
                        .padding()
                        .padding()
                    Text("Through the sound of the draining water, you are almost certain you make out a gasp for breath, and a woman’s voice.")
                        .blur(radius: blurryFourthSentence ? 200 : 0)
                        .padding()
                        .padding()
                    Text("And the words, though quiet, were clear.")
                        .blur(radius: blurryFifthSentence ? 200 : 0)
                        .padding()
                        .padding()
                }
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 25))
            }
            Circle().stroke(Color.white)
                // Creates the drop effect with a black circle and a white outline that will grow ontap
                .scaleEffect(growCircle ? 0 : 50)
            VStack
            {
                HStack
                {
                    // Move and rotate action on each letter from the ontap
                    Text("H")
                        .offset(x: moveLetters ? 0 : -60, y: moveLetters ? 0 : -90)
                        .rotationEffect(.degrees(turnLetters ? 0 : -40))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : 15, y: shadowFadeLetter ? 0 : 5)

                    Text("E")
                        .offset(x: moveLetters ? 0 : -10, y: moveLetters ? 0 : -130)
                        .rotationEffect(.degrees(turnLetters ? 0 : -20))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : 10, y: shadowFadeLetter ? 0 : 15)

                    Text("L")
                        .offset(x: moveLetters ? 0 : 60, y: moveLetters ? 0 : -110)
                        .rotationEffect(.degrees(turnLetters ? 0 : -10))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : -10, y: shadowFadeLetter ? 0 : 15)

                    Text("P")
                        .offset(x: moveLetters ? 0 : 70, y: moveLetters ? 0 : -70)
                        .rotationEffect(.degrees(turnLetters ? 0 : 40))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : -15, y: shadowFadeLetter ? 0 : 5)
                }

                HStack
                {
                    Text("M")
                        .offset(x: moveLetters ? 0 : -100, y: moveLetters ? 0 : 40)
                        .rotationEffect(.degrees(turnLetters ? 0 : -30))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : 15, y: shadowFadeLetter ? 0 : -15)

                    Text("E")
                        .offset(x: moveLetters ? 0 : 80, y: moveLetters ? 0 : 50)
                        .rotationEffect(.degrees(turnLetters ? 0 : 30))
                        .shadow(color: .white, radius: shadowFadeLetter ? 0 : 4, x: shadowFadeLetter ? 0 : -15, y: shadowFadeLetter ? 0 : -15)
                }
            }
            .foregroundColor(.white)
            .font(Font.custom("Hoefler Text", size: 25))
            .opacity(opacityLetters ? 0 : 1)
            
            VStack
            {
                NavigationLink(
                    destination: OneFourteenView(storyPlacement: 14), tag: 1, selection: $viewAction)
                {
                    EmptyView()
                }
                NavigationLink(
                    destination: OneFifteenView(storyPlacement: 15), tag: 2, selection: $viewAction)
                {
                    EmptyView()
                }
                //                Text(Constants.ONE_THIRTEEN_ONE)
                Text("\(storyDataViewModel.storyDataList[storyPlacement - 1].dataDescription)")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 25))
                    .blur(radius: blurry ? 500 : 0)
                    .blur(radius: screenFade ? 0 : 500)

                Divider().background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white, Color.black]), startPoint: .leading, endPoint: .trailing))
                    .frame(height: 100)
                    .opacity(blurry ? 0 : 1)
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
                        .onTapGesture(perform:
                            {
                                withAnimation(.easeInOut(duration: 0.5))
                                {
                                    viewTransition = i + 1

                                    if viewTransition == 1
                                    {
                                        soundManager.effectPlayer2?.setVolume(0, fadeDuration: 6)
                                        //                                SoundManager.shared.stopMusicFile()
                                        soundManager.effectPlayer?.setVolume(0, fadeDuration: 6)
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
            }
            .navigationBarHidden(true)
        }
        
    }
}

// struct OneThirteenView_Previews: PreviewProvider
// {
//    static var previews: some View
//    {
//        Group {
//            OneThirteenView(storyPlacement: 13)
//
//        }
//    }
// }
