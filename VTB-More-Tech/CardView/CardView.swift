//
//  CardView.swift
//  VTB-More-Tech
//
//  Created by admin on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import UIKit
import SwiftUI

struct CardViewPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> CardView {
        CardView()
    }
    
    func updateUIView(_ uiView: CardView, context: Context) {
       
    }
}

class CardView: UIView {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    
    var model: Array<String>? {
        didSet {
            carName.text = model?[0]
            carDescription.text = "Модель: " + (model?[1] ?? "")
            price.text = "Цена: " + (model?[2] ?? "")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        self.contentView = UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: self, options:nil)[0] as?  UIView
        self.contentView?.frame = self.bounds
        self.addSubview(self.contentView!)
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
