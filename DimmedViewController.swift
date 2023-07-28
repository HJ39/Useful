//
//  DimmedViewController.swift
//  RF
//
//  Created by 정호진 on 2023/07/28.
//

import UIKit

class DimmedViewController: UIViewController{
    
    /// MARK: Dimmed View
    private lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        modalTransitionStyle = .coverVertical
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addDimmedView()
        appearAnimation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disappearAnimation()
    }
    
    // MARK: - Function
    
    /// MARK: Add Dimmed View
    private func addDimmedView(){
        guard let presentingViewController else { return }
        presentingViewController.view.addSubview(dimmedView)
        
        // Get the superview of the dimmedView
        guard let superview = dimmedView.superview else {
            fatalError("dimmedView should have a superview.")
        }
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: dimmedView, attribute: .leading, relatedBy: .equal, toItem: superview, attribute: .leading, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dimmedView, attribute: .trailing, relatedBy: .equal, toItem: superview, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dimmedView, attribute: .top, relatedBy: .equal, toItem: superview, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: dimmedView, attribute: .bottom, relatedBy: .equal, toItem: superview, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
    }
    
    /// MARK: move appear animation
    private func appearAnimation(){
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0.25
        }
    }
    
    /// MARK: move disappear animation
    private func disappearAnimation(){
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            self.dimmedView.removeFromSuperview()
        }
    }
    
}

