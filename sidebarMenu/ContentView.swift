//
//  ContentView.swift
//  sidebarMenu
//
//  Created by Pierre Juarez U. on 16/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    let mindarg : CGFloat = 100
    
    var body: some View {
        ZStack{
            
            Button {
                withAnimation {
                    show = true
                }
            } label: {
                Text("Show")
            }

            
            sideMenu()
                .offset(x: show ? 0 : -270)
                .gesture(
                    DragGesture()
                        .onEnded({ value in
                            let shoulsShow = value.translation.width > self.mindarg
                            withAnimation {
                                show = shoulsShow
                            }
                        })
                )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

