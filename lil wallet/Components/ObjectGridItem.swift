//
//  ObjectGridItem.swift
//  lil wallet
//
//  Created by Jordan Singer on 11/28/21.
//

import SwiftUI
import NFTKit

struct ObjectGridItem: View {
    @EnvironmentObject var appearance: Appearance
    
    let object: OpenSea.NFT
    
    var body: some View {
        NavigationLink(destination: ObjectDetailView(object: object), label: {
            if object.isSVG() {
                ZStack {
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(appearance.getAppColor())
                        .aspectRatio(1, contentMode: .fill)
                    
                    Text(object.name ?? "Untitled")
                        .font(.system(.caption, design: appearance.getAppFont()))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .lineLimit(3)
                }
            } else {
                ImageView(imageUrl: object.image_url)
                    .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(Color(UIColor.secondarySystemBackground))
                            .aspectRatio(1, contentMode: .fill)
                    )
            }
            
        })
    }
}

//struct ObjectGridItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ObjectGridItem()
//    }
//}
