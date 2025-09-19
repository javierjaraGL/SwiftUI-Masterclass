//
//  EmptyListView.swift
//  Watchlist
//
//  Created by Javier Jara Montoya on 10/9/25.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        ContentUnavailableView {
            Circle().fill(.blue.gradient)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 30)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 60)
                .stroke(.blue.gradient.opacity(0.15), lineWidth: 90)
                .frame(width: 180)
                .padding(.bottom, 90)
                .overlay {
                    Image(systemName: "movieclapper")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .foregroundStyle(Color(UIColor.secondarySystemBackground))
                        .padding(.top, -6)
                }
        } description: {
            GroupBox {
                TabView {
                    PageTabView(icon: "1.circle", description: "Add some movies to the watchlist if you plan to watch them later")
                        .padding(.bottom,36)
                    PageTabView(icon: "2.circle", description: "Later on you can choose a random fill to watch")
                        .padding(.bottom,36)
                }
                .tabViewStyle(PageTabViewStyle())
                .frame(minWidth: 0, maxWidth: 560, minHeight: 120, maxHeight: 180)
            }
        }
    }
}

#Preview("Light Theme") {
    EmptyListView()
}

#Preview("Black Theme") {
    EmptyListView().preferredColorScheme(.dark)
}
