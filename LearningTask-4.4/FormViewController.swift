//
//  ViewController.swift
//  LearningTask-4.4
//
//  Created by rafael.rollo on 15/02/2022.
//

import UIKit

class FormViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var areaAtuacaoTextField: UITextField!
    @IBOutlet weak var statusProfissionalTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func botaoSubmissaoPressionado(_ sender: UIButton) {
        exibeAlertaDeRevisao()
    }
    
    func exibeAlertaDeRevisao() {
        let mensagem = """
            Antes de enviarmos, por favor, revise seus dados:
        
            Nome: \(nomeTextField.text!)
            Email: \(emailTextField.text!)
            Área de Atuação: \(areaAtuacaoTextField.text!)
            Status Profissional: \(statusProfissionalTextField.text!)
        """
        
        let alert = UIAlertController(title: "Quase lá!", message: mensagem, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Confirmar", style: .default, handler: acaoDeConfirmacaoDisparada))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func acaoDeConfirmacaoDisparada(_ action: UIAlertAction) {
        // executa alguma lógica aqui e ...
        exibeAlertaDeConfirmacao()
    }
    
    func exibeAlertaDeConfirmacao() {
        let alert = UIAlertController(title: "Feito!", message: "Verifique seu email e tenha acesso ao documento.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok!", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }


}

