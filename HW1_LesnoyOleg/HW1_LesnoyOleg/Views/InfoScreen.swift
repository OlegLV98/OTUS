//
//  InfoScreen.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 11.09.2024.
//

import SwiftUI

struct InfoScreen: View {
    @State var isPresented = false
    var body: some View {
        Button(action: {
            isPresented = true
        }, label: {
            Text("Об авторе")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(colors: [.red, .orange], startPoint: .leading, endPoint: .trailing)
                )
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
        .padding(20)
        .sheet(isPresented: $isPresented, content: {
            AuthorDetailView()
                .presentationCornerRadius(30)
                .presentationDragIndicator(.visible)
        })
        
    }
}

#Preview {
    InfoScreen()
}
