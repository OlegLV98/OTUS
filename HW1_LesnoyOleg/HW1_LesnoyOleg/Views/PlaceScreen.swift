//
//  PlaceScreen.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 11.09.2024.
//

import SwiftUI

struct PlaceScreen: View {
    @EnvironmentObject var placeVM: PlaceVM
    @EnvironmentObject var appVM: AppVM
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.systemGray6), .white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                List($placeVM.places) { place in
                    NavigationLink(tag: place.id,
                                   selection: $appVM.currentPlaceID,
                                   destination: {PlaceInfoScreen(place: place)},
                                   label: {PlaceViewCell(place: place)
                                                .padding(.vertical, 8)})
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .scrollIndicators(.hidden)
                .listStyle(.plain)
            }
            .navigationTitle("Города")
        }
    }
}

#Preview {
    PlaceScreen()
        .environmentObject(AppVM())
        .environmentObject(PlaceVM())
}
