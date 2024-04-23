//
//  ViewController.swift
//  CounterHard
//
//  Created by  Игорь on 23.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textViewHistory: UITextView!
    
    @IBOutlet weak var labelTapQuantity: UILabel!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var labelIncrementionButton: UIButton! // Добавляем аутлет для кнопки
    
    var totalValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewHistory.isEditable = false
       
        
    }
    
    @IBAction func incrementionOfLabelValue(_ sender: Any) {
        textViewHistory.text = "История изменений:"
        totalValue = 0
        labelTapQuantity.text = "Значение счетчика: \(totalValue) "
        textViewHistory.text +=
        "\n\(getCurrentDateTime()): значение сброшено"
    }
    
    @IBAction func buttonPlusAct(_ sender: Any) {
        totalValue += 1
        updateLabelAndHistory(value: totalValue, action: "+")
    }
    
    @IBAction func buttonMinusAction(_ sender: Any) {
        if totalValue > 0 {
            totalValue -= 1
            updateLabelAndHistory(value: totalValue, action: "-")
        } else {
            textViewHistory.text += "\n\(getCurrentDateTime()): попытка уменьшить значение счётчика ниже 0"
            labelTapQuantity.text = "ошибка, нажмите '+'"
        }
    }
    
    func updateLabelAndHistory(value: Int, action: String) {
        labelTapQuantity.text = "Значение счетчика: \(value)"
        textViewHistory.text += "\n\(getCurrentDateTime()): значение изменено на \(action)1"
    }
    
    func getCurrentDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter.string(from: Date())
    }
}
