//
//  AppTabView.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 11.09.2024.
//

import SwiftUI

enum ScreenTab {
    case favorite, place, info
}

struct AppTabView: View {
    @EnvironmentObject var appVM: AppVM
    @EnvironmentObject var placeVM: PlaceVM
    var body: some View {
        TabView(selection: $appVM.currentTab) {
            MyFavoriteScreen()
                .tabItem { Label(
                    title: { Text("Избранные") },
                    icon: { Image(systemName: "star.fill") }
                ) }
                .tag(ScreenTab.favorite)
            PlaceScreen()
                .tabItem { Label(
                    title: { Text("Города") },
                    icon: { Image(systemName: "globe.europe.africa.fill") }
                ) }
                .tag(ScreenTab.place)
            InfoScreen()
                .tabItem { Label(
                    title: { Text("Об авторе") },
                    icon: { Image(systemName: "info.circle") }
                ) }
                .tag(ScreenTab.info)
        }
    }
}

#Preview {
    AppTabView()
        .environmentObject(AppVM())
        .environmentObject(PlaceVM())
}
