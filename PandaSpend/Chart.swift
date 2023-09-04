//
//  Chart.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-01.
//
import SwiftPieChart
import SwiftUI

struct Chart: View {
    
    public let values: [Double]
    public var colors: [Color]
    public let names: [String]
    public var innerRadiusFraction: CGFloat
    
    public var backgroundColor: Color
    
    var slices: [PieSliceData] {
        let sum = values.reduce(0, +)
        var endDeg: Double = 0
        var tempSlices: [PieSliceData] = []
        
        for (i, value) in values.enumerated() {
            let degrees: Double = value * 360 / sum
            tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
            endDeg += degrees
        }
        return tempSlices
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack{
                    ForEach(0..<self.values.count){ i in
                        PieSliceView(pieSliceData: self.slices[i])
                    }
                    .frame(width: geometry.size.width, height: geometry.size.width)
                    
                    Circle()
                        .fill(self.backgroundColor)
                        .frame(width: geometry.size.width * innerRadiusFraction, height: geometry.size.width * innerRadiusFraction)
                    
                    VStack {
                        Text("Total")
                            .font(.title)
                            .foregroundColor(Color.gray)
                        Text(String(values.reduce(0, +)))
                            .font(.title)
                            .foregroundColor(Color.black)
                    }
                    
                }
                Spacer()
                
                PieChartRows(colors: self.colors, names: self.names, values: self.values.map { String($0) }, percents: self.values.map { String(format: "%.0f%%", $0 * 100 / self.values.reduce(0, +)) })
                
            }
            .background(self.backgroundColor)
            .foregroundColor(Color.white)
            
            
        }
        
    }
    
}

struct Chart_Previews: PreviewProvider {
    static var previews: some View {
        Chart(values: [1300, 500, 300],
              colors: [Color.blue, Color.green, Color.orange],
              names: ["Rent", "Transport", "Education"],
              innerRadiusFraction: 0.6,
              backgroundColor: Color(.white/*red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0*/))
    }
}
