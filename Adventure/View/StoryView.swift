//
//  StoryView.swift
//  Adventure
//
//  Created by Dan Beers on 2/18/21.
//

import SwiftUI
import Unrealm
import AVKit

struct StoryView: View {
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @State var onTappy = true
    @State var makeSmally = true
    @State var bouncySpinny = true
    @State var shadows = true
    @State var blurry = true
    @State private var flashEffect = false
    @State var thunderEffect: AVAudioPlayer!
    var paragraph = UserDefaults.standard.string(forKey: "paragraph") ?? "1"
    
    
    var body: some View {
        ZStack {
            Color(flashEffect ? .white : .black)
                .frame(alignment: .center)
                .onAppear() {
                    if let thunderclapAndRain = NSDataAsset(name: "ThunderclapAndRain") {
                        thunderEffect = try! AVAudioPlayer(data: thunderclapAndRain.data, fileTypeHint: "mp3")
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
 //                       thunderEffect.play()
                    }
                }
        
                
            VStack {
                Text("\(storyDataViewModel.storyDataList[0].dataDescription)")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 20))
                    .padding()
                    .scaleEffect(makeSmally ? 0 : 1.0)
                    .offset(y: onTappy ? -25 : 0)
                    .rotationEffect(bouncySpinny ? .degrees(180) : .degrees(0))
//                    .rotation3DEffect(.degrees(bouncySpinny ? 90 : 0),
//                                      axis: (x: bouncySpinny ? 0 : 0, y: bouncySpinny ? 0 : 0.0, z: bouncySpinny ? -180 : 0.0))
                    .shadow(color: shadows ? .white : .black, radius: shadows ? 20 : 0, x: 1, y: 1)
                    .onAppear() {
                        
                        withAnimation(.easeInOut(duration: 10.0)) {

                            onTappy.toggle()
                            makeSmally.toggle()
                            bouncySpinny.toggle()
                            shadows.toggle()
                            blurry.toggle()
                        }
                        withAnimation(Animation
                                        .easeInOut(duration: 0.1)
                                        .repeatCount(4, autoreverses: true)) {
                            flashEffect.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                flashEffect.toggle()
                            }

                        }
                    }
                    .shadow(color: shadows ? .white : .black, radius: shadows ? 18 : 0, x: 1, y: 1)
                VStack {
                    ForEach(storyDataViewModel.choicesDictionary[paragraph]!, id: \.self) {
                            Text("\($0)")
                                .foregroundColor(.white)
                                .font(Font.custom("Hoefler Text", size: 15))
                                .padding()
                                .blur(radius: blurry ? 100 : 0)
                        }
                }
//                    Text("DD")
//                        .foregroundColor(.white)
//                        .font(Font.custom("Hoefler Text", size: 20))
//                        .padding()
//                    Text("EE")
//                        .foregroundColor(.white)
//                        .font(Font.custom("Hoefler Text", size: 20))
//                        .padding()
//                    Text("FF")
//                        .foregroundColor(.white)
//                        .font(Font.custom("Hoefler Text", size: 20))
//                        .padding()
//                }
//
        }.navigationBarHidden(true)
            
        }
        
        .onTapGesture {
            thunderEffect.play()

            withAnimation(.easeInOut(duration: 2.0)) {

                onTappy.toggle()
                makeSmally.toggle()
                bouncySpinny.toggle()
                shadows.toggle()
            
            }
            
            withAnimation(Animation
                            .easeInOut(duration: 0.1)
                            .repeatCount(4, autoreverses: true)) {
                flashEffect.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    flashEffect.toggle()

                }
            }
        }
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
