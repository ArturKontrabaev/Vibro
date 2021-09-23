////
////  UIView+Extension.swift
////  Gromi
////
////  Created by Ivan Apet on 11.02.21.
////
//
//import UIKit
//
//extension UIView {
//    func pulse(scale: CGFloat) {
//        UIView.animate(withDuration: 2, animations:{
//            self.transform = CGAffineTransform(scaleX: scale, y: scale)
//            self.alpha = 0
//        }, completion: { _ in
////            UIView.animate(withDuration: 2, animations: {
////                self.transform = CGAffineTransform(scaleX: scale, y: scale)
////                self.transform = .identity
////                self.removeFromSuperview()
////            })
//            self.removeFromSuperview()
////            self.alpha = 1
////            self.transform = CGAffineTransform(scaleX: 1, y: 1)
//        })
//    }
//    
//    func makeDasshedBorder(isSmall: Bool = false) {
//        let color = UIColor(red: 0.243, green: 0.282, blue: 0.341, alpha: 0.5).cgColor
//        
//        let shapeLayer:CAShapeLayer = CAShapeLayer()
//        let frameSize = self.frame.size
//        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
//        
//        shapeLayer.bounds = shapeRect
//        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.strokeColor = color
//        shapeLayer.lineWidth = 1
//        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
//        shapeLayer.lineDashPattern = isSmall ? [2,2] : [1,3]
//        shapeLayer.lineCap = .round
//        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: frame.height/2).cgPath
//        
//        layer.addSublayer(shapeLayer)
//    }
//    
//    func makeCorners(radius: CGFloat = 8) {
//        layer.cornerRadius = radius
//        clipsToBounds = true
//    }
//    
//    func makeRound() {
//        layer.cornerRadius = frame.height/2
//    }
//    
//    func shake() {
//        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
//        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
//        animation.duration = 1
//        animation.values = [-20.0, 20.0, -15.0, 15.0, -10.0, 10.0, -5.0, 5.0, 0.0, 0.0 ]
//        layer.add(animation, forKey: "shake")
//    }
//    
//    func baseConfig(isRound: Bool = false) {
//        layer.cornerRadius = isRound ? frame.height/2 : 8
//        layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
//        layer.borderWidth = 1
//        
//        backgroundColor = .mainColor
//    }
//    
//    func makeSmallShadowOnBottom(shadowColor: UIColor) {
//        layer.masksToBounds = false
//        layer.shadowColor = shadowColor.cgColor
//        layer.shadowOpacity = 1.0
//        layer.shadowOffset = CGSize(width: 0, height: 1)
//        layer.shadowRadius = 3
//    }
//    
//    func makeSmallShadowOnBottomRight(shadowColor: UIColor) {
//        layer.masksToBounds = false
//        layer.shadowColor = shadowColor.cgColor
//        layer.shadowOpacity = 1.0
//        layer.shadowOffset = CGSize(width: 2, height: 2)
//        layer.shadowRadius = 3
//    }
//    
//    func makeSmallShadowOnTop(shadowColor: UIColor) {
//        layer.masksToBounds = false
//        layer.shadowColor = shadowColor.cgColor
//        layer.shadowOpacity = 1.0
//        layer.shadowOffset = CGSize(width: 0, height: -2)
//        layer.shadowRadius = 3
//    }
//    
//    func makeShadow(shadowColor: UIColor) {
//        layer.masksToBounds = false
//        layer.shadowColor = shadowColor.cgColor
//        layer.shadowOpacity = 1.0
//        layer.shadowOffset = CGSize(width: 0, height: 0)
//        layer.shadowRadius = 3
//    }
//    
//    func animate(duration: TimeInterval = 0.3) {
//        UIView.animate(withDuration: duration) {
//            self.layoutIfNeeded()
//        }
//    }
//}
//
//// MARK: -
//// MARK: - Nibs
//
//extension UIView {
//    func instantiateFromNib(_ nibName: String) -> UIView? {
//        let nib = UINib(nibName: nibName, bundle: nil)
//        return nib.instantiate(withOwner: self, options: nil).first as? UIView
//    }
//    
//    static func instantiateFromNib<T: UIView>() -> T? {
//        let nib = UINib(nibName: "\(self)", bundle: nil)
//        return nib.instantiate(withOwner: nil, options: nil).first as? T
//    }
//    
//    static func fromNib() -> Self? {
//        return instantiateFromNib()
//    }
//}
//
//extension UIView {
//    func configureShadow() {
//        configureSmallShadow()
////        let shadowPathBlack = UIBezierPath()
////        shadowPathBlack.move(to: CGPoint(x: -2, y: frame.height + 2))
////        shadowPathBlack.addLine(to: CGPoint(x: frame.width + 2, y: -2))
////        shadowPathBlack.addLine(to: CGPoint(x: frame.width + 2, y: frame.height + 2))
////        shadowPathBlack.addLine(to: CGPoint(x: -2, y: frame.height + 2))
////
////
////        let firstLayer = CALayer()
////        firstLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
////        firstLayer.shadowPath = shadowPathBlack.cgPath
////        firstLayer.shadowRadius = 3
////        firstLayer.shadowOffset = .zero
////        firstLayer.shadowOpacity = 1
////        firstLayer.shadowColor = UIColor.darkShadowColor.cgColor
////
////
////        layer.insertSublayer(firstLayer, at: 0)
////
////        let shadowPathWhite = UIBezierPath()
////        shadowPathWhite.move(to: CGPoint(x: -2, y: frame.height + 2))
////        shadowPathWhite.addLine(to: CGPoint(x: -2, y: -2))
////        shadowPathWhite.addLine(to: CGPoint(x: frame.width + 2, y: -2))
////        shadowPathWhite.addLine(to: CGPoint(x: -2, y: frame.height + 2))
////
////        let secLayer = CALayer()
////        secLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
////        secLayer.shadowPath = shadowPathWhite.cgPath
////        secLayer.shadowRadius = 3
////        secLayer.shadowOffset = .zero
////        secLayer.shadowOpacity = 1
////        secLayer.shadowColor = UIColor.white.withAlphaComponent(0.9).cgColor
////
////
////        layer.insertSublayer(secLayer, at: 1)
//    }
//    
//    func configureSmallShadow(shadowRadius: CGFloat = 4, blackOpacity: Float = 1.0) {
//        let shadowPathBlack = UIBezierPath()
//        shadowPathBlack.move(to: CGPoint(x: -1, y: frame.height + 1))
//        shadowPathBlack.addLine(to: CGPoint(x: frame.width + 1, y: -1))
//        shadowPathBlack.addLine(to: CGPoint(x: frame.width + 1, y: frame.height + 1))
//        shadowPathBlack.addLine(to: CGPoint(x: -1, y: frame.height + 1))
//        
//        
//        let firstLayer = CALayer()
//        firstLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
//        firstLayer.shadowPath = shadowPathBlack.cgPath
//        firstLayer.shadowRadius = shadowRadius
//        firstLayer.shadowOffset = .zero
//        firstLayer.shadowOpacity = blackOpacity
//        firstLayer.shadowColor = UIColor.darkShadowColor.cgColor
////        firstLayer.cornerRadius = 100
//        
//        
//        layer.insertSublayer(firstLayer, at: 0)
//        
//        let shadowPathWhite = UIBezierPath()
//        shadowPathWhite.move(to: CGPoint(x: -1, y: frame.height + 1))
//        shadowPathWhite.addLine(to: CGPoint(x: -1, y: -1))
//        shadowPathWhite.addLine(to: CGPoint(x: frame.width + 1, y: -1))
//        shadowPathWhite.addLine(to: CGPoint(x: -1, y: frame.height + 1))
//        
//        let secLayer = CALayer()
//        secLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
//        secLayer.shadowPath = shadowPathWhite.cgPath
//        secLayer.shadowRadius = 4//2
//        secLayer.shadowOffset = .zero
//        secLayer.shadowOpacity = 1
//        secLayer.shadowColor = UIColor.white.withAlphaComponent(0.9).cgColor
//        
//        
//        layer.insertSublayer(secLayer, at: 1)
//    }
//    
//    func configureBtnShadow(shadowRadius: CGFloat = 4, blackOpacity: Float = 1.0) {
//        let shadowPathBlack = UIBezierPath()
//        shadowPathBlack.move(to: CGPoint(x: -1, y: frame.height + 1))
//        shadowPathBlack.addLine(to: CGPoint(x: frame.width + 1, y: -1))
//        shadowPathBlack.addLine(to: CGPoint(x: frame.width + 1, y: frame.height + 1))
//        shadowPathBlack.addLine(to: CGPoint(x: -1, y: frame.height + 1))
//        
//        
//        let firstLayer = CALayer()
//        firstLayer.frame = CGRect(x: 0, y: 0, width: frame.width + 2, height: frame.height + 2)
//        firstLayer.shadowPath = shadowPathBlack.cgPath
//        firstLayer.shadowRadius = 10
//        firstLayer.shadowOffset = .zero
//        firstLayer.shadowOpacity = 0.8//blackOpacity
//        firstLayer.shadowColor = UIColor.darkShadowColor.cgColor
////        firstLayer.cornerRadius = 100
//        
//        
//        layer.insertSublayer(firstLayer, at: 0)
//        
//        let shadowPathWhite = UIBezierPath()
//        shadowPathWhite.move(to: CGPoint(x: -1, y: frame.height + 1))
//        shadowPathWhite.addLine(to: CGPoint(x: -1, y: -1))
//        shadowPathWhite.addLine(to: CGPoint(x: frame.width + 1, y: -1))
//        shadowPathWhite.addLine(to: CGPoint(x: -1, y: frame.height + 1))
//        
//        let secLayer = CALayer()
//        secLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
//        secLayer.shadowPath = shadowPathWhite.cgPath
//        secLayer.shadowRadius = 4//2
//        secLayer.shadowOffset = .zero
//        secLayer.shadowOpacity = 1
//        secLayer.shadowColor = UIColor.white.withAlphaComponent(0.9).cgColor
//        
//        
//        layer.insertSublayer(secLayer, at: 1)
//    }
//    
//    func customCorners(corners: CACornerMask) {
//        layer.cornerRadius = 10
//        layer.maskedCorners = corners
//        
//        layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
//        layer.borderWidth = 1
//        
//        backgroundColor = .mainColor
//    }
//    
//    func gradientBorder() {
//        backgroundColor = .mainColor
//        layer.cornerRadius = frame.height/2
//        clipsToBounds = true
//
//        let gradient = CAGradientLayer()
//        gradient.frame =  CGRect(origin: CGPoint.zero, size: frame.size)
//        gradient.colors =  [UIColor.white.withAlphaComponent(1).cgColor, UIColor.white.withAlphaComponent(0.0).cgColor]
//
//        let shape = CAShapeLayer()
//        shape.lineWidth = 3
//
//        shape.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
//
//        shape.strokeColor = UIColor.black.cgColor
//        shape.fillColor = UIColor.clear.cgColor
//        gradient.mask = shape
//
//        layer.addSublayer(gradient)
//    }
//    
//    
//}
//
