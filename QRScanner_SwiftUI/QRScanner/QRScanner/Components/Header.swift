//
//  Header.swift
//  QRScanner
//
//  Created by Jesus Perea on 3/2/25.
//

import SwiftUI

struct Header: View {
    
    let title: String
    let subtitle: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title.bold())
            if let subtitle {
                Text(subtitle)
                    .font(.title2)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    Header(title: "Title",
           subtitle: "Long subtitle to describe an action")
}
