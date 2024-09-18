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
    @State var searchText: String = ""
    
    var searchPlaces: [Binding<Place>] {
        $placeVM.places.filter { place in
            searchText.isEmpty || place.wrappedValue.name?.lowercased().contains(searchText.lowercased()) == true
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.systemGray6), .white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    SearchBarView(text: $searchText)
                        .padding(.horizontal, 10)
                    List(searchPlaces) { place in
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
