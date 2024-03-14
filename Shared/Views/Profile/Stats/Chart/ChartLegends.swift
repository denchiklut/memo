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
            Toggle(isOn: $statsVM.showLearnedData) {
                Text("Learned")
            }
            .toggleStyle(ChipToggleStyle(color: .pink))
            .disabled(!statsVM.showAddedData)
            .shakeable(shake: !statsVM.showAddedData)

            Toggle(isOn: $statsVM.showAddedData) {
                Text("Added")
            }
            .toggleStyle(ChipToggleStyle(color: .blue))
            .disabled(!statsVM.showLearnedData)
            .shakeable(shake: !statsVM.showLearnedData)
        }
    }
}

#Preview {
    ChartLegends(statsVM: StatsVM())
}
