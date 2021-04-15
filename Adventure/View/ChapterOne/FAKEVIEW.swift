//
//  FAKEVIEW.swift
//  Adventure
//
//  Created by Dan Beers on 3/26/21.
//

import AVKit
import SwiftUI
import Unrealm

struct FAKEVIEW: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @StateObject var soundManager = SoundManager()
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

    var body: some View
    {
        ZStack
        {
            Color(.black)
                .onAppear
                {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1)
                    {
                            withAnimation(Animation
                                .easeInOut(duration: 4)
                                .repeatCount(7, autoreverses: false))
                            {
                                growCircle.toggle()
                                soundManager.playSoundFile(data: Constants.WATER_DRIP_BATHTUB!.data)
                                soundManager.effectPlayer?.numberOfLoops = 6
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
                                }
                            }
                        }
                    }
                }
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
            .opacity(opacityLetters ? 0 : 1)
            
        }
        .foregroundColor(.white)
        .font(Font.custom("Hoefler Text", size: 25))
        .preferredColorScheme(.dark)
    }
}

struct FAKEVIEW_Previews: PreviewProvider
{
    static var previews: some View
    {
        FAKEVIEW()
    }
}

//            VStack
//            {
//                Text("Turn it on!")
//                    .onTapGesture
//                    {
//                    }
//                Divider().background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.white, Color.black]), startPoint: .leading, endPoint: .trailing))
//                    .frame(height: 100)
//                    .blur(radius: blurry ? 1000 : 0)
//                Text("Turn it off!")
//                    .onTapGesture
//                    {
//                        SoundManager.shared.stopMusicFile()
//                    }
//            }
