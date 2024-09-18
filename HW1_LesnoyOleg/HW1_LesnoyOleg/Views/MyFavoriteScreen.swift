//
//  MyFavoriteScreen.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 11.09.2024.
//

import SwiftUI

struct MyFavoriteScreen: View {
    @EnvironmentObject var appVM: AppVM
    @EnvironmentObject var placeVM: PlaceVM
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.systemGray6), .white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Button {
                        appVM.currentPlaceID = placeVM.places.filter {$0.isFave}.randomElement()?.id
                        if appVM.currentPlaceID != nil {
                            appVM.currentTab = .place
                        }
                    } label: {
                        Text("Куда поехать?")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 5)
                            .padding(.horizontal, 16)
                    }
                    .padding(.top, 20)
                    ScrollView {
                        LazyVStack {
                            ForEach($placeVM.places.filter {$0.isFave.wrappedValue}) { place in
                                NavigationLink {
                                    PlaceInfoScreen(place: place)
                                } label: {
                                    PlaceViewCell(place: place)
                                        .padding(.vertical, 8)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .padding(.horizontal, 16)
        
                    Spacer()
                }
            }
            .navigationTitle("Избранные")
        }
    }
}

#Preview {
    MyFavoriteScreen()
        .environmentObject(AppVM())
        .environmentObject(PlaceVM())
}
