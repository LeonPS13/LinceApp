//
//  CalendarView.swift
//  Lince
//
//  Created by Leon Sanchez on 15/05/21.
//

import SwiftUI

struct CalendarView: View {
    
    @State var date = Date()
    
    var body: some View {
        
        Form{
            DatePicker("date", selection: $date)
                .datePickerStyle(GraphicalDatePickerStyle())
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
