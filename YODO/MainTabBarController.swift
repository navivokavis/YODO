//
//  ViewController.swift
//  YODO
//
//  Created by s x on 9.09.22.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //    var centralTabBar = UI  Tab
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    
    
    func setup() {
        configureSubviews()
        buildHierarchy()
        layoutSubviews()
        
        generateTabBar()
        setTabBarApperance()
    }
    
    
    
    func configureSubviews(){
        
    }
    
    func buildHierarchy(){
        
    }
    
    func layoutSubviews(){
        
    }
    
    
    
    func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: QuestionViewController(),
                title: "вопросы",
                image: UIImage(systemName: "person.crop.circle.badge.questionmark")
            ),
            generateVC(
                viewController: CalcViewController(),
                title: "решало",
                image: UIImage(systemName: "person.fill.checkmark.rtl")
            ),
            generateVC(
                viewController: DateAndWeatherViewController(),
                title: "че как когда",
                image: UIImage(systemName: "text.justifyright")
            )
        ]
    }
    
    func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    func setTabBarApperance(){
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 8
        
        let roundLayer = CAShapeLayer()
        
        let besierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            
            cornerRadius: height / 2
        )
            
        roundLayer.path = besierPath.cgPath

        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = mainWhite.cgColor
        tabBar.tintColor = tabBarItemAccent
        tabBar.unselectedItemTintColor = tabBarItemLight
    }
    
    var tabBarItemAccent: UIColor {
        #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
    }
    var mainWhite: UIColor {
        #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
    var tabBarItemLight: UIColor {
        #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 0.5678290563)
    }
    
    
    
    
    
    
    
}
