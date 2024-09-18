//
//  PlaceViewCell.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 11.09.2024.
//

import SwiftUI

struct PlaceViewCell: View {
    @Binding var place: Place
    var body: some View {
        HStack(spacing: 15) {
            Image(place.image ?? "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
            
            Text(place.name ?? "")
                .font(.system(size: 20, weight: .bold, design: .rounded))
                .foregroundStyle(.primary)
            
            Spacer()
            
            Button {
                place.isFave.toggle()
            } label: {
                Image(systemName: place.isFave ? "star.fill" : "star")
                    .foregroundStyle(place.isFave ? .yellow : .gray)
                    .font(.system(size: 24))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    PlaceViewCell(place: .constant(Place(name: "Moscow",
                               image: "Moscow",
                               isFave: true,
                               description: "City")))
}
