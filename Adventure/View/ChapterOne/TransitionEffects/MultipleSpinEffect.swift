//
//  MultipleSpinEffect.swift
//  Adventure
//
//  Created by Dan Beers on 3/5/21.
//

import AVKit
import SwiftUI
import Unrealm

struct MultipleSpinEffect: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    
    @State var getLargerEffect = true
    @State var spinEffect = true
    @State var offsetEffect = true
    @State var unblurEffect = true
    
    var body: some View
    {
        ZStack
        {
            Color(.black)
                .frame(alignment: .center)
            Text("CHECKPOINT!!\nMiss Welsh informed me the best way to start a proper diary is to “start at the beginning,” whatever that is supposed to mean. She said that the diary knows nothing about me yet. “Well, of course not,” I replied with a laugh. “It’s a book.” To this, she merely shook her head is feigned defeat and left me “to my thoughts.” That was ten minutes ago, and I still can’t think of a name for you yet. Well, to the beginning I shall go then.")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 25))
                .rotationEffect(spinEffect ? .degrees(360) : .degrees(0))
                .scaleEffect(getLargerEffect ? 0 : 1.0)
                .offset(y: offsetEffect ? 500 : -200)
                .blur(radius: unblurEffect ? 100 : 0)
                
                .onAppear {
                    withAnimation(Animation
                                    .linear(duration: 4)
                                    .repeatCount(3, autoreverses: false))
                    {
                        spinEffect.toggle()
                    }
                    withAnimation(Animation
                                    .linear(duration: 12))
                    {
                        getLargerEffect.toggle()
                        offsetEffect.toggle()
                    }
                    withAnimation(Animation
                                    .easeInOut(duration: 12))
                    {

                        unblurEffect.toggle()
                    }
                }
        }
    }
}

struct MultipleSpinEffect_Previews: PreviewProvider
{
    static var previews: some View
    {
        MultipleSpinEffect()
    }
}
