//
//  ChartLegends.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/5/24.
//

import SwiftUI

struct ChartLegends: View {
    @ObservedObject var statsVM: StatsVM
    @AppStorage("accent_color") var accentColor: String = "pink"
    
    var body: some View {
        HStack(spacing: 10) {
            Toggle(isOn: $statsVM.showLearnedData) {
                Text("Learned")
            }
            .toggleStyle(ChipToggleStyle(color: Color.from(name: accentColor)))
            .disabled(!statsVM.showAddedData)
            .shakeable(!statsVM.showAddedData)

            Toggle(isOn: $statsVM.showAddedData) {
                Text("Added")
            }
            .toggleStyle(ChipToggleStyle(color: .blue))
            .disabled(!statsVM.showLearnedData)
            .shakeable(!statsVM.showLearnedData)
        }
    }
}

#Preview {
    ChartLegends(statsVM: StatsVM())
}
