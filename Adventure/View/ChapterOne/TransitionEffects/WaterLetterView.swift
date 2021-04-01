//
//  WaterLetterView.swift
//  WaterLetters
//
//  Created by Dan Beers on 3/30/21.
//

import SwiftUI

struct WaterLetterView: View
{
    @State var moveLetters = true
    @State var turnLetters = true
    @State var opacityLetters = true
    @State var growCircle = true
    var body: some View
    {
        ZStack
        {
            Color(.black)
            Circle().stroke(Color.white)
// Creates the drop effect with a black circle and a white outline that will grow ontap
                .frame(width: growCircle ? 0 : 5000, height: growCircle ? 0 : 5000)
            VStack
            {
                HStack
                {
                    // Move and rotate action on each letter from the ontap
                    Text("H")
                        .offset(x: moveLetters ? 0 : -40, y: moveLetters ? 0 : -50)
                        .rotationEffect(.degrees(turnLetters ? 0 : -30))

                    Text("E")
                        .offset(x: moveLetters ? 0 : -10, y: moveLetters ? 0 : -40)
                        .rotationEffect(.degrees(turnLetters ? 0 : -20))
                    Text("L")
                        .offset(x: moveLetters ? 0 : 20, y: moveLetters ? 0 : -50)
                        .rotationEffect(.degrees(turnLetters ? 0 : -10))
                    Text("P")
                        .offset(x: moveLetters ? 0 : 30, y: moveLetters ? 0 : -50)
                        .rotationEffect(.degrees(turnLetters ? 0 : 30))
                }

                HStack
                {
                    Text("M")
                        .offset(x: moveLetters ? 0 : -40, y: moveLetters ? 0 : 50)
                        .rotationEffect(.degrees(turnLetters ? 0 : -30))
                    Text("E")
                        .offset(x: moveLetters ? 0 : 40, y: moveLetters ? 0 : 50)
                        .rotationEffect(.degrees(turnLetters ? 0 : -30))
                }
            }
            .font(Font.custom("Hoefler Text", size: 30))
            .foregroundColor(.white)
            // Allows letters to disappear using opacity set to 0.
            .opacity(opacityLetters ? 1 : 0)
            .onTapGesture
            {
                withAnimation(Animation
                    .easeOut(duration: 4))
                {
                    growCircle.toggle()
                }
                // Allowing a short delay between the drop effect and the letter skewing.
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2)
                {
                    withAnimation(Animation
                        .easeOut(duration: 5))
                    {
                        moveLetters.toggle()
                        turnLetters.toggle()
                        opacityLetters.toggle()
                    }
                }
            }
        }
    }
}

struct WaterLetterView_Previews: PreviewProvider
{
    static var previews: some View
    {
        WaterLetterView()
    }
}
