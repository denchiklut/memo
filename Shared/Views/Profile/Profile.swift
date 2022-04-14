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
                
                Text("График статичтики")
                    .padding(.top)
            }
        }
        .background(Color("BackgroundColor"))
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
            .accentColor(.pink)
            .previewInterfaceOrientation(.portrait)
    }
}
