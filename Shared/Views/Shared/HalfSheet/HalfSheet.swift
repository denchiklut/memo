//
//  HalfSheet.swift
//  Memo (iOS)
//
//  Created by Denis Aleksandrov on 4/14/22.
//

import SwiftUI

class HalfHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .clear
        
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
            presentationController.prefersGrabberVisible = true
        }
    }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
    var sheetView: SheetView
    @Binding var isPresented: Bool
    var onEnd: (() -> Void)?
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            let sheetController = HalfHostingController(rootView: sheetView)
            sheetController.presentationController?.delegate = context.coordinator
            uiViewController.present(sheetController, animated: true)
        } else {
            uiViewController.dismiss(animated: true)
        }
    }
    
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            parent.isPresented = false
            parent.onEnd?()
        }
    }
}

extension View {
    func halfSheet<SheetView: View>(
        isPresented: Binding<Bool>,
        @ViewBuilder content: @escaping () -> SheetView,
        onEnd: @escaping () -> Void = {}
    ) -> some View {
        return background(HalfSheetHelper(sheetView: content(), isPresented: isPresented, onEnd: onEnd))
    }
}
 
