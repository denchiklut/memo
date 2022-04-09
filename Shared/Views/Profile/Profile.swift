//
//  Profile.swift
//  Memo
//
//  Created by Denis Aleksandrov on 4/9/22.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                StrechyHeader(image: "denchiklut")
                    .zIndex(1)
                    
                    Settings()
                
                    ForEach(1...10, id: \.self) { index in
                        Text("\(index)")
                    }
                    .padding(.top)
            }
        }
        .background(Color("BackgroundColor"))
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
            .previewInterfaceOrientation(.portrait)
    }
}
