//
//  CameraProgress.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 10.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import SwiftUI

struct CameraProgress: UIViewRepresentable {
    @Binding var isLoading: Bool
        
    func makeUIView(context: UIViewRepresentableContext<CameraProgress>) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = #colorLiteral(red: 0.1882352941, green: 0.2705882353, blue: 0.3333333333, alpha: 1)
        return indicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<CameraProgress>) {
        isLoading ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
