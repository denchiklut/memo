//
//  Stats.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 3/3/24.
//

import SwiftUI

struct Stats: View {
    @StateObject var statsVM = StatsVM()

    var body: some View {
        VStack(alignment: .leading) {
            Text(statsVM.getTitle())
                .fontWeight(.bold)
                .padding(.bottom)
            
            StatChart(statsVM: statsVM)
             
            StatsRange(statsVM: statsVM)
                .padding(.top)
            
            ChartLegends(statsVM: statsVM)
                .padding(.top)
        }
        .padding()
        .background(Color("PaperColor"))
    }
}

#Preview {
    Stats()
        .frame(height: 180)
}
