//
//  SearchBarView.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 18.09.2024.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UISearchBar {
        let view = UISearchBar()
        view.searchBarStyle = .minimal
        return view
        
    }
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

