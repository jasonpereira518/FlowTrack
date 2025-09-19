//
//  CreditCardModel.swift
//  FlowTrack
//
//  Created by Jason Pereira on 1/21/25.
//

import SwiftUI

struct CreditCardModel: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var number: String = ""
    var month_year: String = ""
}
