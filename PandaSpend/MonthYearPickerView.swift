//
//  MonthYearPicker.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-04-11.
//


import SwiftUI

struct MonthYearPickerView: View {
  
    private let years: [Int]
        private let numberFormatter: NumberFormatter = {
            let nf = NumberFormatter()
            nf.usesGroupingSeparator = false
            return nf
        }()
        private let months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
        @Binding var selectedYearIndex: Int
        @Binding var selectedMonth : Int
    
       

        init(/*start: Int, end: Int*/) {
            let start = 2018
            let end = 2022
            let years = Array(start...end)
           // self._selectedYearIndex = State(initialValue: years.startIndex)
            let year = Calendar.current.component(.year, from: Date())
            let month = Calendar.current.component(.month, from: Date()) - 1
            
           self.years = years
            
           self._ selectedYearIndex =  year //+ 1
           // print(selectedYearIndex)
           
           self._selectedMonth = month
           
           // print("selected year 1 \(self.selectedYearIndex)")
        
            
        }

        func yearString(at index: Int) -> String {
            let selectedYear = years[index]
           // print("\(selectedYear)")
           // print("\(self.selectedYearIndex)")
            return numberFormatter.string(for: selectedYear) ?? selectedYear.description
        }
        func monthString(at index: Int) -> String {
            let selectedMonth = months[index]
            return selectedMonth
            //?? selectedMonth.description
    }
    func getSelectedMonth() ->String  {
        
        return numberFormatter.string(for: selectedMonth) ?? selectedMonth.description        //?? selectedMonth.description
}
    func getSelectedYear() ->String  {
        
        return numberFormatter.string(for: selectedYearIndex) ?? selectedYearIndex.description        //?? selectedMonth.description
}

        var body: some View {
            HStack {
                Text("this is ")
                HStack {
                Text("Year: ")
                     //\(yearString(at: selectedYearIndex))")
                Picker("Year", selection:$selectedYearIndex)
                    {
                 //  printYear(year: selectedYearIndex)

                  //ForEach(years.indices) { yearIndex in
                  ForEach(years,  id: \.self){ yearIndex in
                        
                     //   Text("\(self.yearString(at: yearIndex))")
                      Text("\(yearIndex)")
                          .foregroundColor(.black)
                    }
                }
                    
                }
                HStack{
                    Text("Month: ")
                    Picker("Month", selection: $selectedMonth) {
                        ForEach(months.indices) {monthIndex in
                            Text("\(self.monthString(at: monthIndex))")//.foregroundColor(.black)
                        }
                    }.foregroundColor(Color.orange)
                }
            }
        }
    }

    struct MonthYearPickerView_Previews: PreviewProvider {
        static var previews: some View {
            MonthYearPickerView(/*start: 2017, end: 2022*/)
        }
    }
