//
//  OnceUponView.swift
//  Adventure
//
//  Created by Dan Beers on 2/16/21.
//

import SwiftUI
import AVKit



struct OnceUponView: View {
    
    @State private var fadeInOut = true
    @State private var fadeInOut2 = true
    @State private var fadeInOut3 = true
    @State private var fadeInOut4 = true
    @State private var fadeInOut5 = true
    @State private var onceMove = true
    @State private var uponMove = true
    @State private var aMove = true
    @State private var timeMove = true
    @State private var newView = false
    
    var body: some View {
        ZStack {
            Color.black
                .frame(alignment: .center)
            Text("...Once")
                .font(Font.custom("Snell Roundhand", size: 60))
                .foregroundColor(.white)
                
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(Animation
                                    .easeInOut(duration: 1)
                                    .repeatCount(1, autoreverses: true))
                    {
                        fadeInOut.toggle()
                    }
                        
                }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(Animation
                                    .easeInOut(duration: 2)
                                    .repeatCount(1, autoreverses: true))
                    {
                        fadeInOut.toggle()
                        onceMove.toggle()
                    }
                }
                            
            }
                .opacity(fadeInOut ? 0 : 1)
                .offset(x: onceMove ? -130 : -80, y: onceMove ? -300 : 400)
            
            Text("Upon")
                .font(Font.custom("Snell Roundhand", size: 60))
                .foregroundColor(.white)
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(Animation
                                    .easeInOut(duration: 2)
                                    .repeatCount(1, autoreverses: true))
                    {
                        fadeInOut2.toggle()
                    }
                        
                }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation(Animation
                                    .easeInOut(duration: 2)
                                    .repeatCount(1, autoreverses: true))
                    {
                        fadeInOut2.toggle()
                        uponMove.toggle()
                    }
                        
                }
            }
                .opacity(fadeInOut2 ? 0 : 1)
                .offset(x: uponMove ? -50 : 0, y: uponMove ? -100: 400)
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            
            Text("a")
                .font(Font.custom("Snell Roundhand", size: 60))
                .foregroundColor(.white)
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation(Animation
                                    .easeInOut(duration: 2)
                                    .repeatCount(1, autoreverses: true))
                    {
                        fadeInOut3.toggle()
                    }
                        
                }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    withAnimation(Animation
                                    .easeInOut(duration: 2)
                                    .repeatCount(1, autoreverses: true))
                    {
                        fadeInOut3.toggle()
                        aMove.toggle()
                    }
                        
                }
            }
                .opacity(fadeInOut3 ? 0 : 1)
                .offset(x: aMove ? 25 : 75, y: aMove ? 0 : 400)
            
            Text("Time...")
                .font(Font.custom("Snell Roundhand", size: 60))
                .foregroundColor(.white)
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    withAnimation(Animation
                                    .easeInOut(duration: 2)
                                    .repeatCount(1, autoreverses: true))
                    {
                        fadeInOut4.toggle()
                    }
                        
                }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
                    withAnimation(Animation
                                    .easeInOut(duration: 2)
                                    .repeatCount(1, autoreverses: true))
                    {
                        fadeInOut4.toggle()
                    }
                        
                }
            }
                .opacity(fadeInOut4 ? 0 : 1)
                .offset(x: 100, y: 200)
            
            Text("Chapter 1")
                .font(Font.custom("Hoefler Text", size: 50))
                .foregroundColor(.white)
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 13) {
                    withAnimation(Animation
                                    .easeInOut(duration: 2)
                                    .repeatCount(1, autoreverses: true))
                        {
                            fadeInOut5.toggle()
                        }
                    
                }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
                    withAnimation(Animation
                                    .easeInOut(duration: 2)
                                    .repeatCount(1, autoreverses: true))
                        {
                            fadeInOut5.toggle()
                        }
                    
                    }
                    
                }
                .opacity(fadeInOut5 ? 0 : 1)
                .offset(x: 0, y: 0)
            NavigationLink(
                destination: StoryView().transition(AnyTransition.opacity.animation(.easeInOut(duration: 1.0))),
                isActive: $newView,
                label: {
                    EmptyView()
                })
                
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 17) {
                        newView.toggle()
                    }
            }
                
        
        }.navigationBarHidden(true)
        
    }
}

struct OnceUponView_Previews: PreviewProvider {
    static var previews: some View {
        OnceUponView()
    }
}

//NavigationLink(
//    destination: StoryView(),
//    isActive: $newView,
//    label: {
//        Text("")
//    })
//    .onAppear() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
//            newView.toggle()
//        }
//}
