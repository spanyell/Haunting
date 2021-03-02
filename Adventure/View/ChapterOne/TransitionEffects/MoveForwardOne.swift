//
//  MoveForwardOne.swift
//  Adventure
//
//  Created by Dan Beers on 2/24/21.
//

import SwiftUI

struct MoveForwardOne: View
{
    @StateObject var storyDataViewModel = StoryDataViewModel()
    @State var moveTextAround = true
    @State var screenFade = true
    @State var zoomPast = true
    @State var bendFloor = true
    @State var slideAway = true
    @State var viewAction: Int? = 0
    var body: some View
    {
        NavigationView
        {
            ZStack
            {
                Color(.black)
                    .frame(alignment: .center)
                NavigationLink(
                    destination: MoveForwardTwo(), tag: 1, selection: $viewAction)
                {
                    EmptyView()
                }
                VStack
                {
                    Text("CHECKPOINT!!\nMiss Welsh informed me the best way to start a proper diary is to “start at the beginning,” whatever that is supposed to mean. She said that the diary knows nothing about me yet. “Well, of course not” I replied with a laugh. “It’s a book.” To this, she merely shook her head is feigned defeat and left me “to my thoughts.” That was ten minutes ago, and I still can’t think of a name for you yet. Well, to the beginning I shall go then.")
                        .foregroundColor(.white)
                        .font(Font.custom("Hoefler Text", size: 25))
                        .blur(radius: screenFade ? 0 : 500)
                        .scaleEffect(moveTextAround ? 0 : 1.0)
                        .scaleEffect(zoomPast ? 1 : 500)
                        .offset(y: slideAway ? 0 : 700)
                        .rotation3DEffect(
                            .degrees(bendFloor ? 0 : 75),
                            axis: (x: 1.0, y: 0.0, z: 0.0)
                        )
                        .onAppear
                        {
                            withAnimation(.easeInOut(duration: 3.0))
                            {
                                moveTextAround.toggle()
                            }
                        }
                        .onTapGesture
                        {
                            withAnimation(.easeInOut(duration: 0.5))
                            {
                                bendFloor.toggle()
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                            {
                                withAnimation(.easeInOut(duration: 0.5))
                                {
                                    slideAway.toggle()
                                }
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)
                            {
                                viewAction = 1
                            }
                        }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct MoveForwardOne_Previews: PreviewProvider
{
    static var previews: some View
    {
        MoveForwardOne()
    }
}
