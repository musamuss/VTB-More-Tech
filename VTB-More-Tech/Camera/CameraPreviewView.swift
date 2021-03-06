//
//  CameraPreviewView.swift
//  VTB-More-Tech
//
//  Created by Artem Belkov on 10.10.2020.
//  Copyright © 2020 TechBirds. All rights reserved.
//

import AVFoundation

import SwiftUI
import UIKit

struct CameraPreview: UIViewRepresentable {
    @Binding var needPhoto: Bool
    @Binding var photo: UIImage?
    
    let photoClosure: (UIImage) -> Void
    
    func makeUIView(context: Context) -> CameraPreviewView {
        CameraPreviewView()
    }
    
    func updateUIView(_ uiView: CameraPreviewView, context: Context) {
        if needPhoto {
            uiView.takePhoto { photo in

                if let photo = photo {
                    self.photoClosure(photo)
                }

                self.needPhoto = false
                self.photo = photo
            }
        }
    }
}

class CameraPreviewView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureCameraController()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configureCameraController()
    }
    
    func takePhoto(completion: @escaping (UIImage?) -> Void) {
        cameraController.captureImage { image, error in
            if let error = error {
                print(error)
            }

            completion(image)
        }
    }
    
    // MARK: Private

    private let cameraController = CameraController()
    
    private func configureCameraController() {
        cameraController.prepare {(error) in
            if let error = error {
                print(error)
            }
            
            try? self.cameraController.displayPreview(on: self)
        }
    }
}
