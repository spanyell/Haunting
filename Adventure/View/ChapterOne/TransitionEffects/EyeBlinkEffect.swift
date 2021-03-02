//
//  EyeBlinkEffect.swift
//  Adventure
//
//  Created by Dan Beers on 2/25/21.
//

import SwiftUI

struct EyeBlinkEffect: View
{
    @State var eyeBlink = true
    @State var eyeBlink2 = true
    var body: some View
    {
        ZStack
        {
            Color(.black)
                .frame(alignment: .center)
            VStack
            {
                Rectangle()
                    .foregroundColor(.black)
                    .offset(y: eyeBlink ? 0 : -500)
                    .offset(y: eyeBlink2 ? 0 : 500)
                Rectangle()
                    .foregroundColor(.black)
                    .offset(y: eyeBlink ? 0 : 500)
                    .offset(y: eyeBlink2 ? 0 : -500)

                    .onTapGesture
                    {
                        withAnimation(Animation
                            .easeInOut(duration: 0.5)
                            .repeatCount(4, autoreverses: true))
                        {
                            eyeBlink.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                        {
                            withAnimation(Animation
                                .easeInOut(duration: 0.3)
                                .repeatCount(4, autoreverses: false))
                            {
                                eyeBlink2.toggle()
                            }
                        }
                    }
            }
            Text("Your mom.")
                .foregroundColor(.white)
                .font(Font.custom("Hoefler Text", size: 20))
        }
    }
}

struct EyeBlinkEffect_Previews: PreviewProvider
{
    static var previews: some View
    {
        EyeBlinkEffect()
    }
}
