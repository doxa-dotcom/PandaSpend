//
//  Chart.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-01.
//
import SwiftPieChart
import SwiftUI

struct Chart2: View {
    
    @Environment(\.managedObjectContext) var moc
  //  @FetchRequest var fetchRequest: FetchedResults<Transaction>
    
    @SectionedFetchRequest<String, Transaction>( // Here we use SectionedFetchRequest
      sectionIdentifier: \.category!, // Add this line
      sortDescriptors: [
        //SortDescriptor(\.date, order: .forward)
      ])
    private var transactions: SectionedFetchResults <String, Transaction>
    
    
  /*  public let values: [Double]
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
    */
    var sum = 0.0
    var body: some View {
       /* GeometryReader { geometry in
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
            
            
        }*/
        VStack{
        Text("Title")
        List{
                ForEach(transactions) { section in
                   // let t = type(of: sect ion.id)
                   // Text("Section \((section.id).formatDate()) has \(section.count) elements")
                   // }
                   /* let formatter1 = DateFormatter()*/
                    //formatter1.dateStyle = .short
                    /*Text("here \(formatter1.string(from: day))")*/
                   // print(formatter1.string(from: day))
                    Text("\((section.id))")
                    
                    ForEach(section) { transaction in
                //    for section in transaction{
                       // sum += transaction.amount
                        VStack{
                        Text("Name: \(transaction.name ?? "No name")") // Just an example
                           /* Text("Account: \(transaction.account ?? "No name")")
                            Text("Category: \(transaction.category ?? "No name")")
                            Text("Amount: $\(String(transaction.amount))")*/
                        }
                        
                    }
                    Text("\((section.id)) = \(sum)")
                }
                }
            
        }}
        
    
    func getSum() -> Double{
        var sum = 0.0
        
        return sum
    }
    }
    
   /* init(filter: String) {
        
        if (filter.isEmpty){
            _fetchRequest = FetchRequest<Transaction>(sortDescriptors: [SortDescriptor(\.date, order: .reverse)], predicate: NSPredicate(format: "account IN %@", ["Personal", "Business"]))
          //  print(fetchRequest.endIndex)
        }
        else{
            _fetchRequest = FetchRequest<Transaction>(sortDescriptors: [SortDescriptor(\.date, order: .reverse)], predicate: NSPredicate(format: "account == %@", filter))
           // print("\(filter): \( fetchRequest.endIndex )")        }
    }
        
        
        }*/
  //  }
    
//}

struct Chart2_Previews: PreviewProvider {
    static var previews: some View {
        Chart2(/*values: [1300, 500, 300],
              colors: [Color.blue, Color.green, Color.orange],
              names: ["Rent", "Transport", "Education"],
              innerRadiusFraction: 0.6,
              backgroundColor: Color(.white/*red: 21 / 255, green: 24 / 255, blue: 30 / 255, opacity: 1.0*/)*/)
    }
}
