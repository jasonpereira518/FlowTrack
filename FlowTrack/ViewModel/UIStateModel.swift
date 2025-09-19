//
//  UIStateModel.swift
//  FlowTrack
//
//  Created by Jason Pereira on 11/6/24.
//

import SwiftUI

public class UIStateModel: ObservableObject
{
    @Published var activeCard: Int      = 0
    @Published var screenDrag: Float    = 0.0
}
