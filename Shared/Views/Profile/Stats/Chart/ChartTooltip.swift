//
//  ChartTooltip.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/14/24.
//

import SwiftUI

struct ChartTooltip: View {
    var selectedStat: ProgresStat

    var body: some View {
        VStack(alignment: .leading) {
            Text(selectedStat.date, format: .dateTime.day().month().year())
                .font(.subheadline)
                .fontWeight(.bold)
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
                    .foregroundColor(.pink)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 16)
        .frame(width: 200)
        .background(Color("PaperColor"), in: .rect(cornerRadius: 5))
        .shadow(radius: 2)
    }
}

#Preview {
    ChartTooltip(selectedStat: StatsVM().stats.first!)
}
