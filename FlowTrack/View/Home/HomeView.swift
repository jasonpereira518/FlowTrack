//
//  HomeView.swift
//  FlowTrack
//
//  Created by Jason Pereira on 11/5/24.
//

import SwiftUI

struct HomeView: View {
    
    @State var isSubscription: Bool = true
    @State var subArr: [SubscriptionModel] = [
        SubscriptionModel(dict: ["name":"Spotify", "icon":"spotify_logo", "price": "5.99"] )
        ,
        SubscriptionModel(dict: ["name": "YouTube Premium", "icon": "youtube_logo", "price": "18.99"] )
        ,
        SubscriptionModel(dict: ["name": "Microsoft OneDrive", "icon": "onedrive_logo", "price": "29.99"] )
        ,
        SubscriptionModel(dict: ["name": "Netflix", "icon": "netflix_logo", "price": "15.00"] )
    ]
    
    var body: some View {
        ScrollView {
            
            ZStack(alignment: .center) {
                
                Rectangle()
                    .foregroundColor(.gray70.opacity(0.5))
                    .frame(width: .screenWidth, height: .widthPer(per: 1.1) )
                    .cornerRadius(25)
                
                
                Image("home_bg")
                    .resizable()
                    .scaledToFit()
                
                ZStack{
                    ArcShape()
                        .foregroundColor(.gray.opacity(0.2))
                    
                    ArcShape(start: 0, end: 230)
                        .foregroundColor(.secondaryC)
                        .shadow( color: .secondaryC.opacity(0.5) , radius: 7)
                }
                .frame(width: .widthPer(per: 0.72), height: .widthPer(per: 0.72) )
                .padding(.bottom, 18)
                
                VStack(spacing: .widthPer(per: 0.07)){
                    Image("app_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .widthPer(per: 0.25) )
                    
                    Text("$1,235")
                        .font(.customfont(.bold, fontSize: 40))
                        .foregroundColor(.white)
                    
                    Text("This Month's Bills")
                        .font(.customfont(.semibold, fontSize: 12))
                        .foregroundColor(.gray40)
                    
                    Button {
                       
                    } label: {
                        Text("See your budget")
                            .font(.customfont(.semibold, fontSize: 12))
                    }
                    .foregroundColor( .white )
                    
                    .padding(10)
                    .background(Color.gray60.opacity(  0.2 ))
                    .overlay {
                        RoundedRectangle(cornerRadius:  16)
                            .stroke( Color.gray70, lineWidth: 1)
                    }
                    .cornerRadius(16)
                }
                
                VStack{
                    Spacer()
                    HStack{
                        StatusButton(title: "Active Subs", value: "12") {
                            
                        }
                        
                        StatusButton(title: "Highest Sub", value: "$19.99",color: .primary10) {
                            
                        }
                        
                        StatusButton(title: "Lowest Sub", value: "$5.99",color: .secondaryG) {
                            
                        }
                        
                        
                    }
                }
                .padding()
                
            }
            .frame(width: .screenWidth, height: .widthPer(per: 1.1) )
            
            HStack{
                
                SegmentButton(title: "Your Subscriptions", isActive: isSubscription) {
                    isSubscription.toggle()
                }
                
                SegmentButton(title: "Upcoming bills", isActive: !isSubscription) {
                    isSubscription.toggle()
                }
                
            }
            .padding(8)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
            .background(Color.black)
            .cornerRadius(15)
            .padding()
            
            if(isSubscription) {
                LazyVStack(spacing: 15) {
                    ForEach( subArr , id: \.id) { sObj in
                        
                        SubscriptionHomeRow(sObj: sObj)
                        
                    }
                }
                .padding(.horizontal, 20)
            }
            
            if(!isSubscription) {
                LazyVStack(spacing: 15) {
                    ForEach( subArr , id: \.id) { sObj in
                        
                        UpcomingBillRow(sObj: sObj)
                        
                    }
                }
                .padding(.horizontal, 20)
            }
            
            
        }
        .background(Color.grayC)
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
