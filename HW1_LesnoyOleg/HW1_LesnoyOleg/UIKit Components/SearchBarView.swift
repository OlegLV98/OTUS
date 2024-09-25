//
//  SearchBarView.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 18.09.2024.
//

import SwiftUI

struct SearchBarView: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
            searchBar.resignFirstResponder()
            searchBar.text = ""
            text = ""
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let view = UISearchBar()
        view.searchBarStyle = .minimal
        view.delegate = context.coordinator
        view.placeholder = "Поиск"
        return view
        
    }
    func updateUIView(_ uiView: UISearchBar, context: Context) {}
}

