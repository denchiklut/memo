//
//  ChartLegends.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/5/24.
//

import SwiftUI

struct ChartLegends: View {
    @ObservedObject var statsVM: StatsVM

    var body: some View {
        HStack(spacing: 10) {
            Chip(label: "Learned", color: .pink, isChecked: $statsVM.showLearnedData)
                .disabled(!statsVM.showAddedData)

            Chip(label: "Added", color: .blue, isChecked: $statsVM.showAddedData)
                .disabled(!statsVM.showLearnedData)
        }
    }
}

#Preview {
    ChartLegends(statsVM: StatsVM())
}
