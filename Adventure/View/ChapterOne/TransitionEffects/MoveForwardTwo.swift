//
//  MoveForwardTwo.swift
//  Adventure
//
//  Created by Dan Beers on 2/25/21.
//

import SwiftUI

struct MoveForwardTwo: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @State var moveTextAround1 = true
    @State var screenFade1 = true
    @State var zoomPast1 = true
    @State var bendFloor1 = true
    @State var slideAway1 = true
    @State var viewAction1: Int? = 0
    var body: some View
    {
        ZStack
        {
            Color(.black)
                .frame(alignment: .center)
            VStack
            {
                Text("CHECKPOINT 2!!\nMiss Welsh informed me the best way to start a proper diary is to “start at the beginning,” whatever that is supposed to mean. She said that the diary knows nothing about me yet. “Well, of course not” I replied with a laugh. “It’s a book.” To this, she merely shook her head is feigned defeat and left me “to my thoughts.” That was ten minutes ago, and I still can’t think of a name for you yet. Well, to the beginning I shall go then.")
                    .foregroundColor(.white)
                    .font(Font.custom("Hoefler Text", size: 25))
                    .blur(radius: screenFade1 ? 0 : 500)
                    .scaleEffect(moveTextAround1 ? 0 : 1.0)
                    .scaleEffect(zoomPast1 ? 1 : 500)
                    .offset(y: slideAway1 ? 0 : 700)
                    .rotation3DEffect(
                        .degrees(bendFloor1 ? 0 : 75),
                        axis: (x: 1.0, y: 0.0, z: 0.0)
                    )
                    .onAppear
                    {
                        withAnimation(.easeInOut(duration: 2.0))
                        {
                            moveTextAround1.toggle()
                        }
                    }
                    .onTapGesture
                    {
                        withAnimation(.easeInOut(duration: 0.5))
                        {
                            bendFloor1.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                        {
                            withAnimation(.easeInOut(duration: 0.5))
                            {
                                slideAway1.toggle()
                            }
                        }
                    }
            }
        }
        .navigationBarHidden(true)
    }
}

struct MoveForwardTwo_Previews: PreviewProvider
{
    static var previews: some View
    {
        MoveForwardTwo()
    }
}
