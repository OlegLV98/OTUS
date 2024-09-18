//
//  PlaceInfoScreen.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 11.09.2024.
//

import SwiftUI

struct PlaceInfoScreen: View {
    @Binding var place: Place
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(place.name ?? "")
                    .font(.system(size: 36 ,weight: .bold, design: .rounded))
                    .foregroundStyle(.primary)
                
                Image(place.image ?? "")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: UIScreen.main.bounds.width - 32)
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 10)
                
                Text(place.description ?? "")
                    .font(.system(size: 18 ,weight: .regular))
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(5)
                
                Spacer()
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
        }
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.hidden)
        .background(LinearGradient(colors: [.white, Color(.systemGray6)], startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    PlaceInfoScreen(place: .constant(Place(name: "Moscow",
                            image: "Moscow",
                            isFave: true,
                            description: "City City City City City City City City City City City City City City City City City")))
}
