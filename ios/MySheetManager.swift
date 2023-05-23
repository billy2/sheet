//
//  MySheetManager.swift
//  sheet
//
//  Created by Alex Demchenko on 22/05/2023.
//

@objc(MySheetManager)
class MySheetManager: NSObject {
  private var sheetViewController: SheetViewController?

  @objc static func requiresMainQueueSetup() -> Bool {
    return true
  }

  @objc func show() {
      DispatchQueue.main.async { [unowned self] in
        self.sheetViewController = SheetViewController()
        self.sheetViewController?.modalPresentationStyle = .pageSheet

        if #available(iOS 15.0, *) {
          if let sheet = self.sheetViewController?.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.prefersGrabberVisible = true
          }
        } else {
          // Fallback on earlier versions
        }

        let keyScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene

        guard let rootViewController = keyScene?.windows.first(where: { $0.isKeyWindow })?.rootViewController else {
          return
        }

        rootViewController.present(self.sheetViewController!, animated: true)
      }
    }

    @objc func hide() {
      DispatchQueue.main.async { [unowned self] in
        self.sheetViewController?.dismiss(animated: true)
        self.sheetViewController = nil
      }
    }
}
