//
//  AuthorDetailView.swift
//  HW1_LesnoyOleg
//
//  Created by Oleg Lesnoy on 13.09.2024.
//

import SwiftUI

struct AuthorDetailView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                Button(action: {dismiss()}, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                })
                Spacer()
            }
            ScrollView {
                Text("🧑‍💻")
                    .font(.system(size: 100))
                    .padding()
                VStack(spacing: 10) {
                    Text("Олег Лесной")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundStyle(.primary)
                    
                    Text("iOS-разработчик")
                        .font(.system(size: 18))
                        .foregroundStyle(.secondary)
                    
                    Divider()
                        .padding(.horizontal, 40)
                    
                    Text("Данное приложение было разработано Лесным Олегом, начинающим iOS-разработчиком, который на данный момент проходит обучение на курсе OTUS.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
            }
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(.white)
                .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
        )
        .padding()
    }
}

#Preview {
    AuthorDetailView()
}
