//
//  ViewController.swift
//  ScrollViewPaging_Swift5
//
//  Created by Nir Leshem on 30/09/2020.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: views
    lazy var view0: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        let label = UILabel()
        label.text = "Page 0"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        return view
    }()
    
    lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        let label = UILabel()
        label.text = "Page 1"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        return view
    }()
    
    lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        let label = UILabel()
        label.text = "Page 2"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        return view
    }()
    
    lazy var view3: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        let label = UILabel()
        label.text = "Page 3"
        label.textAlignment = .center
        view.addSubview(label)
        label.edgeTo(view: view)
        return view
    }()
    
    lazy var views = [view0, view1, view2, view3]
    
    // MARK: scrollView
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
        
        for i in 0..<views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
        }
        
        scrollView.delegate = self
        return scrollView
    }()
    
    // MARK: pageControl
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        return pageControl
    }()
    
    // MARK: arrow buttons
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "arrowshape.turn.up.left.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(didTapLeft), for: .touchUpInside)
        button.alpha = leftIsDisabled ? 0.5 : 1.0
        button.isEnabled = !leftIsDisabled
        return button
    }()
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "arrowshape.turn.up.right.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(didTapRight), for: .touchUpInside)
        return button
    }()

    // MARK: local vars
    var currentIndex: Int = 0
    var leftIsDisabled: Bool {
        return currentIndex == 0
    }
    var rightIsDisabled: Bool {
        return currentIndex == views.count - 1
    }

    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.edgeTo(view: view)
        
        view.addSubview(pageControl)
        pageControl.pinTo(view)
        
        view.addSubview(leftButton)
        leftButton.pinLeftButtonTo(view)
        
        view.addSubview(rightButton)
        rightButton.pinRightButtonTo(view)
    }
    
    // MARK: selectors
    @objc private func didTapLeft() {
        if currentIndex - 1 >= 0 {
            scrollView.scrollTo(horizontalPage: currentIndex - 1, animated: true)
        }
    }
    @objc private func didTapRight() {
        if currentIndex + 1 <= views.count - 1 {
            scrollView.scrollTo(horizontalPage: currentIndex + 1, animated: true)
        }
    }
}

// MARK: UIScrollView Delegate
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        currentIndex = Int(pageIndex)
        pageControl.currentPage = Int(pageIndex)

        leftButton.alpha = leftIsDisabled ? 0.5 : 1.0
        rightButton.alpha = rightIsDisabled ? 0.5 : 1.0
        leftButton.isEnabled = !leftIsDisabled
        rightButton.isEnabled = !rightIsDisabled
    }
}

