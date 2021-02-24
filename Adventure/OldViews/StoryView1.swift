////
////  StoryView1.swift
////  Adventure
////
////  Created by Dan Beers on 2/18/21.
////
//
//import AVKit
//import SwiftUI
//import Unrealm
//
//struct StoryView1: View
//{
//    @StateObject var storyDataViewModel = StoryDataViewModel()
//    @State var onTappy = true
//    @State var makeSmally = true
//    @State var bouncySpinny = true
//    @State var shadows = true
//    @State var blurry = true
//    @State private var flashEffect = false
//    @State var thunderEffect: AVAudioPlayer!
//    @State var oneOneOneMusic: AVAudioPlayer!
//    var paragraph = UserDefaults.standard.string(forKey: "paragraph") ?? "1"
//    @State private var viewAction: Int? = 0
//
//    var body: some View
//    {
//        NavigationView
//        {
//            ZStack
//            {
//                Color(flashEffect ? .white : .black)
//                    .frame(alignment: .center)
//                    .onAppear
//                    {
//                        if let thunderclapAndRain = NSDataAsset(name: "ThunderclapAndRain")
//                        {
//                            thunderEffect = try! AVAudioPlayer(data: thunderclapAndRain.data, fileTypeHint: "mp3")
//                            if let oneOneMusic = NSDataAsset(name: "1_1_1_music")
//                            {
//                                oneOneOneMusic = try! AVAudioPlayer(data: oneOneMusic.data, fileTypeHint: "mp3")
//                            }
//                        }
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 4)
//                        {
//                            thunderEffect.play()
//                        }
//                    }
//
//                VStack
//                {
//                    NavigationLink(
//                        destination: OnceUponView(), tag: 1, selection: $viewAction)
//                    {
//                        EmptyView()
//                    }
//                    NavigationLink(
//                        destination: OnceUponView(), tag: 2, selection: $viewAction)
//                    {
//                        EmptyView()
//                    }
//                    NavigationLink(
//                        destination: OnceUponView(), tag: 3, selection: $viewAction)
//                    {
//                        EmptyView()
//                    }
//                    Text("\(storyDataViewModel.storyDataList[0].dataDescription)")
//                        .foregroundColor(.white)
//                        .font(Font.custom("Hoefler Text", size: 20))
//                        .padding()
//                        .scaleEffect(makeSmally ? 0 : 1.0)
//                        .offset(y: onTappy ? -25 : 0)
//                        .rotationEffect(bouncySpinny ? .degrees(180) : .degrees(0))
////                    .rotation3DEffect(.degrees(bouncySpinny ? 90 : 0),
////                                      axis: (x: bouncySpinny ? 0 : 0, y: bouncySpinny ? 0 : 0.0, z: bouncySpinny ? -180 : 0.0))
//                        .onAppear
//                        {
//                            withAnimation(.easeInOut(duration: 10.0))
//                            {
//                                onTappy.toggle()
//                                makeSmally.toggle()
//                                bouncySpinny.toggle()
//                                shadows.toggle()
//                                blurry.toggle()
//                            }
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
//                            {
//                                withAnimation(Animation
//                                    .easeInOut(duration: 0.1)
//                                    .repeatCount(4, autoreverses: true))
//                                {
//                                    flashEffect.toggle()
//                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
//                                    {
//                                        flashEffect.toggle()
//                                    }
//                                }
//                            }
//                        }
//                        .shadow(color: shadows ? .white : .black, radius: shadows ? 18 : 0, x: 1, y: 1)
//                    VStack
//                    {
//                        ForEach(storyDataViewModel.choicesDictionary[paragraph]!, id: \.self)
//                        {
//                            choice in
//
//                            NavigationLink(destination: StoryView(),
//                                           label: {
//                                            Text(choice)
//                                                .foregroundColor(.white)
//                                                .font(Font.custom("Hoefler Text", size: 15))
//                                                .padding()
//                                                .blur(radius: blurry ? 100 : 0)
//                                                .onAppear
//                                                {
////                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 10)
////                                                    {
////                                                        oneOneOneMusic.play()
////                                                    }
//                                                }
//
//                                           })
//
//
//
//
////                            NavigationLink(
////                                destination: OnceUponView(), tag: 1, selection: $viewAction) {
////                                Text(choice)
////
//
//
//
//
////                            NavigationLink(destination: StoryView())
////                            {
////                                Text("\(choice)")
////                                    .foregroundColor(.white)
////                                    .font(Font.custom("Hoefler Text", size: 15))
////                                    .padding()
////                                    .blur(radius: blurry ? 100 : 0)
////                                    .onAppear
////                                    {
////                                        DispatchQueue.main.asyncAfter(deadline: .now() + 10)
////                                        {
////                                            oneOneOneMusic.play()
////                                        }
////                                    }
////                            }
//                        }
//
//                    }.navigationBarHidden(true)
//                }
//
//                .onTapGesture
//                {
//                    thunderEffect.play()
//
//                    withAnimation(.easeInOut(duration: 2.0))
//                    {
//                        onTappy.toggle()
//                        makeSmally.toggle()
//                        bouncySpinny.toggle()
//                        shadows.toggle()
//                    }
//
//                    withAnimation(Animation
//                        .easeInOut(duration: 0.1)
//                        .repeatCount(4, autoreverses: true))
//                    {
//                        flashEffect.toggle()
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
//                        {
//                            flashEffect.toggle()
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//struct StoryView1_Previews: PreviewProvider
//{
//    static var previews: some View
//    {
//        StoryView1()
//    }
//}
