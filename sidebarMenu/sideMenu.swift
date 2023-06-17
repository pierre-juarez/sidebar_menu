//
//  sideMenu.swift
//  sidebarMenu
//
//  Created by Pierre Juarez U. on 16/06/23.
//

import SwiftUI

enum tabIcon: String{
    case Home
    case Card
    case Favorite
    case Purchases
    case Notification
}

struct sidebar: Identifiable {
    var id = UUID()
    var icon: String
    var title: String
    var index: Int
    var tab: tabIcon
}

let sidebarItems = [
    sidebar(icon: "house.fill", title: "Home", index: 0, tab: .Home),
    sidebar(icon: "creditcard.fill", title: "Card", index: 1, tab: .Card),
    sidebar(icon: "heart.fill", title: "Favorite", index: 2, tab: .Favorite),
    sidebar(icon: "cart.fill.badge.plus", title: "Purchases", index: 3, tab: .Purchases),
    sidebar(icon: "bell.badge.fill", title: "Notification", index: 4, tab: .Notification)
]

struct sideMenu: View {
    
    @State var selectedItem: tabIcon = .Home
    @State var yOffset: CGFloat = 0
    
    var body: some View {
        ZStack{
            Color("bgSlide")
                .frame(width: 266)
                .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    userProfile()
                    tabView(selectedItem: $selectedItem, yOffset: $yOffset)
                    
                    
                }.padding(.leading, 15)
                Spacer()
                divider()
                slider()
                HStack{
                    Text("Learn more about the app")
                        .padding(.leading)
                    Image(systemName: "questionmark.circle")
                }
                .foregroundColor(.white)
                .padding(.top, 5)
                Spacer()
                HStack{
                    Bicon(icon: "moon.zzz.fill")
                    Spacer()
                    Text("Shoping")
                        .foregroundColor(.white)
                    Spacer()
                    Bicon(icon: "gearshape.fill")
                }
                .padding(.bottom, 20)
                .frame(width: 230, height: 90)
                .padding(.leading, 17)
                
            }
            
        }
        .ignoresSafeArea()
        .frame(maxHeight: .infinity)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct sideMenu_Previews: PreviewProvider {
    static var previews: some View {
        sideMenu()
    }
}

struct userProfile: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 65, height: 65)
                .foregroundColor(.white)
            VStack{
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 100, height: 14)
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 80, height: 7)
                    .opacity(0.5)
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .frame(width: 52, height: 7)
                    .opacity(0.5)
                
            }
        }.foregroundColor(.white)
            .padding(.top, 60)
    }
}

struct tabView: View {
    
    @Binding var selectedItem: tabIcon
    @Binding var yOffset: CGFloat
    @State var isAnimation = false
    
    var body: some View{
        ZStack(alignment: .leading){
            Rectangle()
                .frame(width: isAnimation ? 7 : 230, height: 45)
                .foregroundColor(Color("selectTab"))
                .cornerRadius(7)
                .offset(y: yOffset)
                .padding(.vertical, 8)
                .padding(.horizontal, 5)
                .offset(y: -125)
                .offset(x: -20)
                .animation(.default, value: isAnimation)
            
            VStack(spacing: 0){
                ForEach(sidebarItems) { item in
                    Button {
                        withAnimation {
                            isAnimation = true
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                            withAnimation {
                                selectedItem = item.tab
                                yOffset = CGFloat(item.index) * 70
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                            withAnimation {
                                isAnimation = false
                            }
                        }
                        
                    } label: {
                        HStack{
                            ZStack{
                                Circle()
                                    .frame(width: 39, height: 40)
                                    .foregroundStyle(.ultraThinMaterial)
                                Image(systemName: item.icon)
                                    .foregroundColor(.white)
                            }
                            Text(item.title)
                                .bold()
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                            Spacer()
                        }
                        .padding(.top, 30)
                        
                    }
                    
                }
            }
            .frame(width: 240, height: 330)
            
            
        }
    }
}

struct divider: View {
    var body: some View{
        Rectangle()
            .frame(width: 266, height: 1)
            .foregroundColor(.gray.opacity(0.4))
            .padding(.top,30)
    }
    
}

struct Bicon: View{
    
    var icon = ""
    
    var body: some View{
        ZStack{
            Circle()
                .frame(width: 48, height: 48)
                .foregroundStyle(.ultraThinMaterial)
            Image(systemName: icon)
                .foregroundColor(.white)
        }
    }
    
}
