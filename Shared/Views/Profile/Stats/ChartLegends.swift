//
//  ChartLegends.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/5/24.
//

import SwiftUI

struct ChartLegends: View {
    @Binding var showAddedData: Bool
    @Binding var showLearnedData: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            Chip(label: "Learned", color: .pink, isChecked: $showLearnedData)
                .disabled(!showAddedData)
            Chip(label: "Added", color: .blue, isChecked: $showAddedData)
                .disabled(!showLearnedData)
        }
        
    }
}


#Preview {
    ChartLegends(showAddedData: .constant(true), showLearnedData: .constant(true))
}
