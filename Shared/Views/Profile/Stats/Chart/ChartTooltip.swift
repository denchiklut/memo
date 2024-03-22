//
//  ChartTooltip.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/14/24.
//

import SwiftUI

struct ChartTooltip: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("accent_color") var accentColor: String = "pink"
    
    var selectedStat: ProgresStat

    var body: some View {
        let bgColor = colorScheme == .dark ? #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1) : #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        let color = colorScheme == .dark ? #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1) : #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)

        return VStack(alignment: .leading) {
            Text(selectedStat.date, format: .dateTime.day().month().year())
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color(color))
            Divider()

            HStack {
                Text("Added:")
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(selectedStat.added)")
                    .foregroundColor(.blue)
            }
            HStack {
                Text("Learned:")
                    .foregroundColor(.secondary)
                Spacer()
                Text("\(selectedStat.learned)")
                    .foregroundColor(Color.from(name: accentColor))
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 16)
        .frame(width: 200)
        .background(Color(bgColor), in: .rect(cornerRadius: 5))
        .shadow(radius: 2)
    }
}

#Preview {
    Color("PaperColor")
        .overlay {
            ChartTooltip(selectedStat: StatsVM().stats.first!)
        }
}
