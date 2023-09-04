//
//  MainPage.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-01-21.
//

import SwiftUI

struct MainPage: View {
    //Curent Tab
    @State var currentTab: Tab = .home
    
    //hiding Tab Bar ??
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        //TabView
        VStack (spacing: 0) {
            TabView(selection: $currentTab){
               /* Text("Home").tag(Tab.home)
               // Transactions().tag(Tab.home)
                Text("Chart").tag(Tab.chart)
                Text("Calender").tag(Tab.calender)
                Text("Account").tag(Tab.account)*/
                Home().tag(Tab.home)
               // Transactions().tag(Tab.home)
                Chart(values: [1300, 500, 300],
                      colors: [Color.blue, Color.green, Color.orange],
                      names: ["Rent", "Transport", "Education"],
                      innerRadiusFraction: 0.6,
                      backgroundColor: Color(.white/*red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0*/)).tag(Tab.chart)
                Transactions().tag(Tab.calender)
                Text("Account").tag(Tab.account)
            }//.tabViewStyle(.page)
            
            //custom Tab Bar
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.self){tab in
                    Button {
                        //update tab
                        currentTab = tab
                        
                    } label: {
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ?
                                             Color.blue :
                                                Color.black.opacity(0.3))
                        
                    }
                }
            }
            .padding([.horizontal,.bottom])
            .padding(.bottom,10)
            
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

//Tab Cases
enum Tab:String,CaseIterable  {
    case home = "home"
    case chart = "chart"
    case calender = "calender"
    case account = "account"
}
