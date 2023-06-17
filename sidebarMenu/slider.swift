//
//  slider.swift
//  sidebarMenu
//
//  Created by Pierre Juarez U. on 16/06/23.
//

import SwiftUI

struct slider: View {
    
    @State var selectedIndex = 0
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            imageView(image: "slide1")
                .tag(1)
            imageView(image: "slide2")
                .tag(2)
            imageView(image: "slide3")
                .tag(3)
            imageView(image: "slide4")
                .tag(4)
            imageView(image: "slide5")
                .tag(5)
        }.tabViewStyle(PageTabViewStyle())
            .offset(x: -10)
            .frame(width: 266, height: 175)
            .padding(.top, 10)
            .onReceive(timer) { _ in
                withAnimation {
                    selectedIndex = selectedIndex == 5 ? 0 : selectedIndex + 1
                }
            }
    }
}

struct slider_Previews: PreviewProvider {
    static var previews: some View {
        slider()
    }
}

struct imageView: View {
    
    var image = ""
    
    var body: some View{
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 230, height: 157)
            .clipped()
            .cornerRadius(10)
            .padding(.leading, 15)
    }
}
