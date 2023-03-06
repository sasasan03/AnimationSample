//
//  ContentView.swift
//  AnimationSample
//
//  Created by sako0602 on 2023/03/06.
//

import SwiftUI

let animationDuration = 2.0

struct ContentView: View {
    
    @State private var doAnimation = true
    
    @State private var cornerRadius: CGFloat = 30.0
    @State private var width: CGFloat = 220.0
    @State private var height: CGFloat = 150.0
    
    @State var sValue: CGFloat = 3
    
    @State private var isShow = false
    
    
    var body: some View {
        //-----------------------------------
//        VStack {
//                HStack {
//                   if isShow {
//                      Image(systemName: "cloud.sun.bolt")
//                         .resizable()
//                         .frame(width:100, height:100)
////              .transition(.scale)
////              .transition(.identity)
////              .transition(.offset(CGSize(width: -150, height: -150)))   //.scale
////              .transition(.opacity)
//                         .padding()
//                   }
//                }
//                Button(action: {
//                   withAnimation(.easeInOut){
//                      self.isShow.toggle()
//                   }
//                }) {
//                   Text("アニメ")
//                }
//                .padding()
//             }
        //-----------------------------------
        //----------------------------------- Bindingのanimation(_:)メソッド
        //func animation(_ animation: Animation? = .default) -> Binding<Value>
//        VStack {
//                Text("Bindingのアニメーション")
//                   .font(.title)
//                   .padding()
//                Stepper(value:$sValue, in:1...4) {
//                   Text("アニメなし")
//                }
//                .padding()
//                Stepper(value:$sValue.animation(.interactiveSpring( dampingFraction:0.2 )),
//                      in:1...4) {
//                         Text("interactiveSpring\nアニメーションあり")
//                }
//                .padding()
//                Text("\(Int(sValue))")
//                   .font(Font.largeTitle.monospacedDigit())
//                   .frame(width: 60*sValue, height: 34*sValue)
//                   .background(Color.green)
//                   .padding()
//                Spacer()
//             }
        //-----------------------------------
        //-----------------------------------.animation()
         VStack {
            HStack {
               VStack {
                  Text("easeInOut").padding()
                  Image(systemName: "cloud.sun.bolt")
                     .resizable()
                     .frame(width:100, height:100)
                     .rotationEffect(Angle.degrees(doAnimation ? 0 : 360))
//                     .animation(.easeInOut(duration:animationDuration),value: doAnimation)
                     .offset(x: doAnimation ? 50 : -50)
                     .animation(.spring(response: 0.55,
                                        dampingFraction: 0.825,
                                        blendDuration: 0),
                                value: doAnimation)
               }
               .padding()
               VStack {
                  Text("linear").padding()
                  Image(systemName: "cloud.sun.bolt")
                     .resizable()
                     .frame(width:100, height:100)
                     .rotationEffect(Angle.degrees(doAnimation ? 0 : 360))
                     .animation(.linear(duration: animationDuration),value: doAnimation)
               }
               .padding()
            }
            Button(action: {
               self.doAnimation.toggle()
                print(">>>",doAnimation)
            }) {
               Text("アニメ")
            }
            .padding()

         }
        //-----------------------------------------------withAnimation
        //状態の変化にアニメーションを指定する
//        VStack {
//                HStack {
//                   Button(action: {
//                      withAnimation(.easeInOut){
//                         self.width = 220.0
//                         self.cornerRadius = 0.0
//                      }
//                   }) {
//                      Text("長方形")
//                   }
//                   .padding()
//
//                   Button(action: {
//                      withAnimation(.spring()){
//                         self.width = 220.0
//                         self.cornerRadius = 30.0
//                      }
//                   }) {
//                      Text("角丸")
//                   }
//                   .padding()
//
//                   Button(action: {
//                      withAnimation(.easeInOut(duration: 0.2)){
//                         self.width = 150
//                         self.cornerRadius = 75.0
//                      }
//                   }) {
//                      Text("円")
//                   }
//                   .padding()
//
//                }
////            Image(systemName: "car")
//                RoundedRectangle(cornerRadius: cornerRadius)
////                .resizable()
////                .scaledToFit()
//                   .foregroundColor(.orange)
//                   .background(Color.black)
//                   .frame(width: width, height: height)
//             }
        //-----------------------------------------------
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
