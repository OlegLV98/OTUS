//
//  HW1_LesnoyOlegApp.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 11.09.2024.
//

import SwiftUI

@main
struct HW1_LesnoyOlegApp: App {
    @StateObject var appVM: AppVM = .init()
    @StateObject var placeVM: PlaceVM = .init()
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(appVM)
                .environmentObject(placeVM)
        }
    }
}
