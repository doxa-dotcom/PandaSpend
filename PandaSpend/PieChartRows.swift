//
//  PieChartRows.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-01.
//

import SwiftUI

struct PieChartRows: View {
    var colors: [Color]
        var names: [String]
        var values: [String]
        var percents: [String]
    
    var body: some View {
        VStack{
                    ForEach(0..<self.values.count){ i in
                        HStack {
                            RoundedRectangle(cornerRadius: 5.0)
                                .fill(self.colors[i])
                                .frame(width: 20, height: 20)
                            Text(self.names[i]) .foregroundColor(Color.black)
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text(self.values[i])
                                    .foregroundColor(Color.black)
                                Text(self.percents[i])
                                    .foregroundColor(Color.gray)
                            }
                        }
                    }
                }
    }
}

struct PieChartRows_Previews: PreviewProvider {
    static var previews: some View {
        PieChartRows(colors: [Color.blue, Color.green,
                               Color.orange],
                      names: ["Rent", "Transport", "Education"],
                      values: ["1300", "500", "300"],
                      percents: ["62%", "24%", "14%"])
    }
}
