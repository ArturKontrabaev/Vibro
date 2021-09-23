////
////  UILabel+Extension.swift
////  Gromi
////
////  Created by Ivan Apet on 1.03.21.
////
//
//import UIKit
//
//extension UILabel {
//    enum Config {
//        case viewControllerTitle
//        case descr
//        
//        func font() -> UIFont {
//            switch self {
//            case .viewControllerTitle: return UIFont.systemFont(ofSize: 24, weight: .bold)
//            case .descr: return UIFont.systemFont(ofSize: 14, weight: .regular)
//            }
//        }
//        
//        func textColor() -> UIColor {
//            switch self {
//            case .viewControllerTitle: return .titleTextColor
//            case .descr: return .textMainColor
//            }
//        }
//    }
//    
//    
//    func configure(config: Config) {
//        font = config.font()
//        textColor = config.textColor()
//    }
//}
//
//public protocol ChangableFont: AnyObject {
//    var rangedAttributes: [RangedAttributes] { get }
//    func getText() -> String?
//    func set(text: String?)
//    func getAttributedText() -> NSAttributedString?
//    func set(attributedText: NSAttributedString?)
//    func getFont() -> UIFont?
//    func changeFont(ofText text: String, with font: UIFont)
//    func changeFont(inRange range: NSRange, with font: UIFont)
//    func changeTextColor(ofText text: String, with color: UIColor)
//    func changeTextColor(inRange range: NSRange, with color: UIColor)
//    func resetFontChanges()
//}
//
//
//public struct RangedAttributes {
//
//    public let attributes: [NSAttributedString.Key: Any]
//    public let range: NSRange
//
//    public init(_ attributes: [NSAttributedString.Key: Any], inRange range: NSRange) {
//        self.attributes = attributes
//        self.range = range
//    }
//}
//
//
//public extension String {
//
//    func range(ofText text: String) -> NSRange {
//        let fullText = self
//        let range = (fullText as NSString).range(of: text)
//        return range
//    }
//}
//
//public extension ChangableFont {
//
//    var rangedAttributes: [RangedAttributes] {
//        guard let attributedText = getAttributedText() else {
//            return []
//        }
//        var rangedAttributes: [RangedAttributes] = []
//        let fullRange = NSRange(
//            location: 0,
//            length: attributedText.string.count
//        )
//        attributedText.enumerateAttributes(
//            in: fullRange,
//            options: []
//        ) { (attributes, range, stop) in
//            guard range != fullRange, !attributes.isEmpty else { return }
//            rangedAttributes.append(RangedAttributes(attributes, inRange: range))
//        }
//        return rangedAttributes
//    }
//
//    func changeFont(ofText text: String, with font: UIFont) {
//        guard let range = (self.getAttributedText()?.string ?? self.getText())?.range(ofText: text) else { return }
//        changeFont(inRange: range, with: font)
//    }
//
//    func changeFont(inRange range: NSRange, with font: UIFont) {
//        add(attributes: [.font: font], inRange: range)
//    }
//
//    func changeTextColor(ofText text: String, with color: UIColor) {
//        guard let range = (self.getAttributedText()?.string ?? self.getText())?.range(ofText: text) else { return }
//        changeTextColor(inRange: range, with: color)
//    }
//
//    func changeTextColor(inRange range: NSRange, with color: UIColor) {
//        add(attributes: [.foregroundColor: color], inRange: range)
//    }
//
//    private func add(attributes: [NSAttributedString.Key: Any], inRange range: NSRange) {
//        guard !attributes.isEmpty else { return }
//
//        var rangedAttributes: [RangedAttributes] = self.rangedAttributes
//
//        var attributedString: NSMutableAttributedString
//
//        if let attributedText = getAttributedText() {
//            attributedString = NSMutableAttributedString(attributedString: attributedText)
//        } else if let text = getText() {
//            attributedString = NSMutableAttributedString(string: text)
//        } else {
//            return
//        }
//
//        rangedAttributes.append(RangedAttributes(attributes, inRange: range))
//
//        rangedAttributes.forEach { (rangedAttributes) in
//            attributedString.addAttributes(
//                rangedAttributes.attributes,
//                range: rangedAttributes.range
//            )
//        }
//
//        set(attributedText: attributedString)
//    }
//
//    func resetFontChanges() {
//        guard let text = getText() else { return }
//        set(attributedText: NSMutableAttributedString(string: text))
//    }
//}
//
//
//
//extension UILabel: ChangableFont {
//
//    public func getText() -> String? {
//        return text
//    }
//
//    public func set(text: String?) {
//        self.text = text
//    }
//
//    public func getAttributedText() -> NSAttributedString? {
//        return attributedText
//    }
//
//    public func set(attributedText: NSAttributedString?) {
//        self.attributedText = attributedText
//    }
//
//    public func getFont() -> UIFont? {
//        return font
//    }
//    
//    @IBInspectable var kerning: Float {
//        get {
//            var range = NSMakeRange(0, (text ?? "").count)
//            guard let kern = attributedText?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: &range),
//                  let value = kern as? NSNumber
//            else {
//                return 0
//            }
//            return value.floatValue
//        }
//        set {
//            var attText:NSMutableAttributedString
//            
//            if let attributedText = attributedText {
//                attText = NSMutableAttributedString(attributedString: attributedText)
//            } else if let text = text {
//                attText = NSMutableAttributedString(string: text)
//            } else {
//                attText = NSMutableAttributedString(string: "")
//            }
//            
//            let range = NSMakeRange(0, attText.length)
//            attText.addAttribute(NSAttributedString.Key.kern, value: NSNumber(value: newValue), range: range)
//            self.attributedText = attText
//        }
//    }
//    
//    func setLineHeight(lineHeight: CGFloat) {
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = 1.0
//        paragraphStyle.lineHeightMultiple = lineHeight
//        paragraphStyle.alignment = self.textAlignment
//        
//        let attrString = NSMutableAttributedString()
//        if (self.attributedText != nil) {
//            attrString.append( self.attributedText!)
//        } else {
//            attrString.append( NSMutableAttributedString(string: self.text!))
//            attrString.addAttribute(NSAttributedString.Key.font, value: self.font, range: NSMakeRange(0, attrString.length))
//        }
//        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
//        self.attributedText = attrString
//    }
//    
//}
//
//extension String {
//    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
//        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
//        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
//    
//        return ceil(boundingBox.height)
//    }
//
//    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
//        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
//        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
//
//        return ceil(boundingBox.width)
//    }
//}
