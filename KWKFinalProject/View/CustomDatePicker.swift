//
//  CustomDatePicker.swift
//  KWKFinalProject
//
//  Created by Vicky Zhu on 6/15/22.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    var body: some View {
        VStack(spacing: 35){
            let days: [String] =
                ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            HStack(spacing: 20){
                VStack(alignment: .leading, spacing: 1){
                    Text("2022")
                        .font(.caption)
                        .fontWeight(.semibold)
                    Text("June")
                        .font(.title.bold())
                }
                Spacer(minLength: 0)
                
                Button {
                    
                }
            label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
            }
                Button {
                    
                }
            label: {
                Image(systemName: "chevron.right")
                    .font(.title2)
            }
            }
            .padding(.horizontal)
            
            HStack(spacing: 0){
                ForEach(days, id: \.self){day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
        }
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


