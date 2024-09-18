//
//  PlaceVM.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 11.09.2024.
//

import Foundation

final class PlaceVM: ObservableObject {
    @Published var places: Places = Place.mockData()
}
