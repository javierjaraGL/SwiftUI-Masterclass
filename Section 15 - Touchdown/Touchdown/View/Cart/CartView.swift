//
//  CartView.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 22/10/25.
//

import SwiftUI

struct CartView: View {
  // MARK: - PROPERTY
  
  @EnvironmentObject var shop: Shop
  @Environment(\.dismiss) var dismiss
  
  // MARK: - BODY
  
  var body: some View {
    VStack(spacing: 0) {
      // HEADER
      HStack {
        Text("Shopping Cart")
          .font(.largeTitle)
          .fontWeight(.black)
        
        Spacer()
        
        Text("\(shop.cart.products.count) items")
          .font(.subheadline)
          .foregroundColor(.gray)
        
        Button(action: {
          feedback.impactOccurred()
          shop.showingCart = false
        }, label: {
          Image(systemName: "xmark.circle.fill")
            .font(.title2)
            .foregroundColor(.gray)
        })
      } //: HSTACK
      .padding()
      
      // PRODUCT LIST
      if shop.cart.products.isEmpty {
        Spacer()
        
        VStack(spacing: 20) {
          Image(systemName: "cart")
            .font(.system(size: 60))
            .foregroundColor(.gray)
          
          Text("Your cart is empty")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.gray)
        } //: VSTACK
        
        Spacer()
      } else {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 15) {
            ForEach(shop.cart.products) { product in
              CartItemView(product: product)
            } //: LOOP
          } //: VSTACK
          .padding()
        } //: SCROLL
        
        // SUMMARY SECTION
        VStack(spacing: 0) {
          Divider()
          
          VStack(spacing: 12) {
            // SUBTOTAL
            HStack {
              Text("Subtotal")
                .font(.body)
              Spacer()
              Text(shop.cart.formattedSubtotal)
                .font(.body)
                .fontWeight(.semibold)
            } //: HSTACK
            
            // TAX
            HStack {
              Text("Tax")
                .font(.body)
              Spacer()
              Text(shop.cart.tax == 0 ? "Free" : shop.cart.formattedTax)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(shop.cart.tax == 0 ? .green : .primary)
            } //: HSTACK
            
            // SHIPPING
            HStack {
              Text("Shipping")
                .font(.body)
              Spacer()
              Text(shop.cart.shipping == 0 ? "Free" : shop.cart.formattedShipping)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(shop.cart.shipping == 0 ? .green : .primary)
            } //: HSTACK
            
            Divider()
            
            // TOTAL
            HStack {
              Text("Total")
                .font(.title3)
                .fontWeight(.black)
              Spacer()
              Text(shop.cart.formattedTotal)
                .font(.title3)
                .fontWeight(.black)
            } //: HSTACK
          } //: VSTACK
          .padding()
          
          // PAYMENT OPTIONS
          VStack(spacing: 12) {
            Text("Payment Options")
              .font(.headline)
              .fontWeight(.semibold)
              .frame(maxWidth: .infinity, alignment: .leading)
            
            // CREDIT CARD BUTTON
            Button(action: {
              feedback.impactOccurred()
            }, label: {
              HStack {
                Image(systemName: "creditcard.fill")
                  .font(.title3)
                Text("Credit Card")
                  .font(.system(.title3, design: .rounded))
                  .fontWeight(.bold)
                Spacer()
              } //: HSTACK
              .foregroundColor(.white)
              .padding(15)
              .background(Color.blue)
              .clipShape(Capsule())
            }) //: BUTTON
            
            // PAYPAL BUTTON
            Button(action: {
              feedback.impactOccurred()
            }, label: {
              HStack {
                Image(systemName: "p.circle.fill")
                  .font(.title3)
                Text("PayPal")
                  .font(.system(.title3, design: .rounded))
                  .fontWeight(.bold)
                Spacer()
              } //: HSTACK
              .foregroundColor(.white)
              .padding(15)
              .background(Color(red: 0.0, green: 0.3, blue: 0.6))
              .clipShape(Capsule())
            }) //: BUTTON
            
            // AFTERPAY BUTTON
            Button(action: {
              feedback.impactOccurred()
            }, label: {
              HStack {
                Image(systemName: "calendar.badge.clock")
                  .font(.title3)
                Text("Afterpay")
                  .font(.system(.title3, design: .rounded))
                  .fontWeight(.bold)
                Spacer()
              } //: HSTACK
              .foregroundColor(.white)
              .padding(15)
              .background(Color(red: 0.7, green: 0.9, blue: 0.7))
              .clipShape(Capsule())
            }) //: BUTTON
          } //: VSTACK
          .padding()
        } //: SUMMARY VSTACK
      }
    } //: VSTACK
    .background(colorBackground.ignoresSafeArea())
  }
}

#Preview {
  CartView()
    .environmentObject(Shop())
}

