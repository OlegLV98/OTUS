//
//  AppVM.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 13.09.2024.
//

import Foundation

final class AppVM: ObservableObject {
    @Published var currentTab: ScreenTab = .favorite
    @Published var currentPlaceID: String?
}
