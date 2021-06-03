//
//  OnboardingViewController.swift
//  team-hack
//
//  Created by Joey Essak on 3/9/21.
//
// MARK: - Extension UILabel
extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.green , range: range)
        self.attributedText = attribute
    }
}
// MARK: - Extension UIView
extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding:
        UIEdgeInsets = .zero, size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
}


import Lottie
import UIKit
class OnboardingViewController: UIViewController, UIScrollViewDelegate {
   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    // MARK: - SignUpButton
    @IBOutlet weak var signUpButton: UIButton!
    @IBAction func signUpButton(_ sender: Any) {
// Programatic Animation view test -------
//        testView.alpha = 1
//        testView.play()
// ---------------------------------------
        
        performSegue(withIdentifier: "segueToCreateAccount", sender: self)
        
    }
    
    // MARK: - LogInButton
    @IBOutlet weak var logInButton: UIButton!
    @IBAction func logInButton(_ sender: Any) {
         performSegue(withIdentifier: "segueToSignUp", sender: self)
    }
    
    var slides:[Slide] = []
// Programatic Animation view test---------
//         var testView = AnimationView()
//         let jsonName = "newStar"
// ----------------------------------------
      // MARK: - ViewDidLoad
      override func viewDidLoad() {
        super.viewDidLoad()
// Programatic Animation view test --------
//         let animation = Animation.named(jsonName)
//         let greenView = UIView()
//         greenView.backgroundColor = .green
//         let yellowView = UIView()
//         yellowView.backgroundColor = .yellow
//         view.addSubview(testView)
//         $0 <---- This represents one of the items inside of your array
//         [greenView, yellowView].forEach { view.addSubview($0) }
//
//         greenView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor,              padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: 100, height: 100))
//         yellowView.anchor(top: greenView.bottomAnchor, leading: nil, bottom: nil, trailing: greenView.trailingAnchor, padding: .init(top: 12, left:          0, bottom: 0, right: 0), size: .init(width: 100, height: 100))
//         testView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .zero, size:              .init(width: 100, height: 100))
//         testView.animation = animation
//         testView.backgroundColor = UIColor.black.withAlphaComponent(0)
//         testView.alpha = 0
// ----------------------------------------
        scrollView.delegate = self
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)),for: .valueChanged)
        view.bringSubviewToFront(pageControl)
        signUpButton.layer.cornerRadius = 5
        logInButton.layer.cornerRadius =  5
       
}
    

    @objc private func pageControlDidChange(_ sender: UIPageControl){
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    // MARK: - CreateSlides
    
    func createSlides() -> [Slide] {
            let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            let jsonName = "rocket"
            let animation = Animation.named(jsonName)
        slide1.animationView.animation = animation
        slide1.animationView.play()
        slide1.animationView.loopMode = .loop
            slide1.labelTitle.text = "Welcome to Team Hack Stock App"
            slide1.mainText.halfTextColorChange(fullText: "Start investing commission-free", changeText: "commission-free")
           
            let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            let jsonName1 = "water"
            let animation1 = Animation.named(jsonName1)
        slide2.animationView.animation = animation1
        slide2.animationView.play()
        slide2.animationView.loopMode = .loop
            slide2.labelTitle.text = "Commission-free stock trading"
            slide2.mainText.text = "Invest in thousands of US and global stocks without paying commission or foreign exchange fees"
            
            let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            let jsonName2 = "future"
            let animation2 = Animation.named(jsonName2)
        slide3.animationView.animation = animation2
        slide3.animationView.play()
        slide3.animationView.loopMode = .loop
            slide3.labelTitle.text = "No account minimum"
            slide3.mainText.text = "Get started at your own pace - with as little or as much as you'd like."
            
            let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            let jsonName3 = "bitcoin"
            let animation3 = Animation.named(jsonName3)
        slide4.animationView.animation = animation3
        slide4.animationView.play()
        slide4.animationView.loopMode = .loop
            slide4.labelTitle.text = "Everything at your fingertips"
            slide4.mainText.text = "Stay on top of your portfolio with real-time market data, business news, and customized notifications"
            
            let slide5:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
            let jsonName4 = "rain"
            let animation4 = Animation.named(jsonName4)
        slide5.animationView.animation = animation4
        slide5.animationView.play()
        slide5.animationView.loopMode = .loop
            slide5.labelTitle.text = "Account protection"
            slide5.mainText.halfTextColorChange(fullText: "Team Hack Finanical LLC is a member of SIPC. Securities in your account protected up to $500,000. For details, please see www.sipc.org", changeText: "www.sipc.org")
            return [slide1, slide2, slide3, slide4, slide5]
        }
 // MARK: - setupSlideScrollView protocol
 // Conforming to setupSlideScrollView protocol function
    func setupSlideScrollView(slides : [Slide]) {
         scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
         scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
         scrollView.isPagingEnabled = true
         
         for i in 0 ..< slides.count {
         slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
         scrollView.addSubview(slides[i])
         }
     }
    // MARK: - scrollViewDidScroll
    //  Conforming to scrollViewDidScroll protocol function
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Sets the currentPage to match position of pageControl pointer
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width )))
        // Animating the animationView vertically in and out as you scroll left or right.
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)
        // The Magic Sauce to transform and animate the views along X axis
        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
            slides[0].animationView.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].animationView.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].animationView.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].animationView.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
            slides[2].animationView.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
            slides[3].animationView.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
            slides[3].animationView.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
            slides[4].animationView.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
        }
    }
    
     
    
}




