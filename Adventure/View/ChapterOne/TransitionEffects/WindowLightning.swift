//
//  WindowLightning.swift
//  Adventure
//
//  Created by Dan Beers on 2/25/21.
//

import SwiftUI

struct WindowLightning: View {
    @State var windowLightningEffect = true
    @State var fadeInStory = true
    var body: some View {
        ZStack
        {
            Color(.black)
                .frame(alignment: .center)
            VStack
            {
                ForEach((0...2), id: \.self)
                {
                    windowPanes in
                    HStack {
                        ForEach((0...2), id: \.self)
                        {
                            windowPanes in
                            Rectangle()
                            .foregroundColor(windowLightningEffect ? .black : .white)
                        }
                    }
                }
            }
            Text("CHECKPOINT!!\nMiss Welsh informed me the best way to start a proper diary is to “start at the beginning,” whatever that is supposed to mean. She said that the diary knows nothing about me yet. “Well, of course not” I replied with a laugh. “It’s a book.” To this, she merely shook her head is feigned defeat and left me “to my thoughts.” That was ten minutes ago, and I still can’t think of a name for you yet. Well, to the beginning I shall go then.")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 25))
                .blur(radius: fadeInStory ? 100 : 0)
        }
        .onAppear()
        {
            withAnimation(Animation
                        .easeInOut(duration: 1))
                        {
                                fadeInStory.toggle()
                            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2)
            {
                withAnimation(Animation
                    .easeInOut(duration: 0.1)
                    .repeatCount(4, autoreverses: true))
                {
                    windowLightningEffect.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                    {
                        windowLightningEffect.toggle()
                    }
                }
            }
        }
        
    }
}

struct WindowLightning_Previews: PreviewProvider {
    static var previews: some View {
        WindowLightning()
    }
}
