//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import SwiftUI


struct ProductDetailView: View {
  // MARK: - PROPERTY
  
  @EnvironmentObject var shop: Shop
    let geo: GeometryProxy
  
  // MARK: - BODY
  
  var body: some View {
          VStack(alignment: .leading, spacing: 5, content: {
              // NAVBAR
              NavigationBarDetailView()
                  .padding(.horizontal)
                  .padding(.top, geo.safeAreaInsets.top)
              // HEADER
              HeaderDetailView()
                  .padding(.horizontal)
              
              // DETAIL TOP PART
              TopPartDetailView()
                  .padding(.horizontal)
                  .zIndex(1)
              
              // DETAIL BOTTOM PART
              VStack(alignment: .center, spacing: 0, content: {
                  // RATINGS + SIZES
                  RatingsSizesDetailView()
                      .padding(.top, -20)
                      .padding(.bottom, 10)
                  
                  // DESCRIPTION
                  ScrollView(.vertical, showsIndicators: false, content: {
                      Text(shop.selectedProduct?.description ?? sampleProduct.description)
                          .font(.system(.body, design: .rounded))
                          .foregroundColor(.gray)
                          .multilineTextAlignment(.leading)
                  }) //: SCROLL
                  
                  // QUANTITY + FAVOURITE
                  QuantityFavouriteDetailView()
                      .padding(.vertical, 10)
                  
                  // ADD TO CART
                  AddToCartDetailView()
                      .padding(.bottom, 20)
              }) //: VSTACK
              .padding(.horizontal)
              .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105)
              )
          }) //: VSTACK
          .zIndex(0)
          .ignoresSafeArea(.all, edges: .all)
          .background(
            Color(
                red: shop.selectedProduct?.red ?? sampleProduct.red,
                green: shop.selectedProduct?.green ?? sampleProduct.green,
                blue: shop.selectedProduct?.blue ?? sampleProduct.blue
            ).ignoresSafeArea(.all, edges: .all)
          )
  }
}


#Preview {
    GeometryReader { geo in
        ProductDetailView(geo: geo)
            .environmentObject(Shop())
    }
}
