//
//  CountDownView.swift
//  MazaadyPortal
//
//  Created by Sandra George on 26/04/2025.
//

import UIKit

class CountDownView: UIView {
    
    @IBOutlet weak var sectionTitle: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var daysContainerView: UIView!
    @IBOutlet weak var hoursContainerView: UIView!
    @IBOutlet weak var minutesContainerView: UIView!
    
    private var endDate: Date?
    private var timer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.xibSetup()
        setupContainersViews()
        setupSectionTitle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.xibSetup()
        setupContainersViews()
        setupSectionTitle()
    }
    
    func configure(withEndTimeInterval interval: TimeInterval) {
        self.endDate = Date().addingTimeInterval(interval)
        startTimer()
    }
    
    private func setupSectionTitle() {
        sectionTitle.text = "Lot starts in"
        sectionTitle.font = UIFont.nunitoFont(size: 12)
        sectionTitle.textColor = UIColor(hex: "#828282")
    }
    private func setupContainersViews() {
        setContainerUI(for: daysContainerView)
        setContainerUI(for: hoursContainerView)
        setContainerUI(for: minutesContainerView)
    }
    
    private func setContainerUI(for view: UIView) {
        view.backgroundColor = UIColor(hex: "#FFF5E9")
        view.layer.cornerRadius = 14
        view.layer.masksToBounds = true
    }
    
    private func startTimer() {
        timer?.invalidate()
        updateLabels()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateLabels), userInfo: nil, repeats: true)
    }
    
    @objc private func updateLabels() {
        guard let endDate = endDate else { return }
        
        let now = Date()
        let remaining = endDate.timeIntervalSince(now)
        
        if remaining <= 0 {
            timer?.invalidate()
            daysLabel.text = "00 D"
            hoursLabel.text = "00 H"
            minutesLabel.text = "00 M"
            return
        }
        
        let days = Int(remaining) / 86400
        let hours = (Int(remaining) % 86400) / 3600
        let minutes = (Int(remaining) % 3600) / 60
        
        setupCountDownLabel(number: days, duration: "D", for: daysLabel)
        setupCountDownLabel(number: hours, duration: "H", for: hoursLabel)
        setupCountDownLabel(number: minutes, duration: "M", for: minutesLabel)
    }
    
    private func setupCountDownLabel(number: Int, duration: String, for label: UILabel) {
        let fullText = "\(number) \n\(duration)"
        let attributedText = NSMutableAttributedString(string: fullText)
        
        attributedText.addAttributes([
            .font: UIFont.nunitoFont(size: 10)!,
            .foregroundColor: UIColor(hex: "#FF951D")
        ], range: (fullText as NSString).range(of: "\(number)"))
        
        attributedText.addAttributes([
            .font: UIFont.nunitoFont(size: 10)!,
            .foregroundColor: UIColor(hex: "#FF951D")
        ], range: (fullText as NSString).range(of: duration))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))

        label.attributedText = attributedText
    }
    
    deinit {
        timer?.invalidate()
    }
}
