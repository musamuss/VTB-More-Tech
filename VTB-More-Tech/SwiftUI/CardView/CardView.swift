//
//  CardView.swift
//  VTB-More-Tech
//
//  Created by admin on 09.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import UIKit
import SwiftUI
import Alamofire

struct CardViewPreview: UIViewRepresentable {
    @Binding var carInfo: CarInfo?
    func makeUIView(context: Context) -> CardView {
        let card = CardView()
        card.model = carInfo
        return card
    }
    
    func updateUIView(_ uiView: CardView, context: Context) {
       
    }
}

class CardView: UIView {

    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    var model: CarInfo? {
        didSet {
            //тут надо править данные
            carName.text = "\(model?.car.title ?? "") \(model?.choosedModel.model?.titleRus ?? "")"
            carDescription.text = "Страна: \(model?.car.country?.title ?? "")"
            price.text = "Цена: \((model?.choosedModel.minprice?.price)!)"
            
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
        self.layer.masksToBounds = true
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        self.roundCorners([.bottomLeft, .bottomRight], radius: 8)
    }
}

extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}
