//
//  SheetViewController.swift
//  sheet
//
//  Created by Alex Demchenko on 22/05/2023.
//

import Foundation

class SheetViewController: UIViewController {
  override func viewDidLoad() {
    let blurEffect = UIBlurEffect(style: .regular)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = view.bounds
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.addSubview(blurEffectView)
  }
}
