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
    
    typealias MensagemDeValidacao = String
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func botaoSubmissaoPressionado(_ sender: UIButton) {
        
        switch todosCamposForamPreenchidos() {
            
        case (false, let mensagemValidacao):
            exibeAlerta(titulo: "Quase lá!", mensagem: mensagemValidacao)
            
        case (true, _):
            submeterInscricao()
        }
    }
    
    func todosCamposForamPreenchidos() -> (Bool, MensagemDeValidacao?) {
        
        guard let nome = nomeTextField.text, !nome.isEmpty else {
            return (false, "Nome não pode estar em branco.")
        }
        
        guard let email = emailTextField.text, !email.isEmpty else {
            return (false, "Email não pode estar em branco.")
        }
        
        guard emailEhValido(email) else {
            return (false, "O email informado é inválido.")
        }
        
        guard let areaAtuacao = areaAtuacaoTextField.text, !areaAtuacao.isEmpty else {
            return (false, "Informe sua área de atuação.")
        }
        
        guard let statusProfissional = statusProfissionalTextField.text, !statusProfissional.isEmpty else {
            return (false, "Informe seu status profissional.")
        }
        
        return (true, nil)
    }
    
    func emailEhValido(_ email: String) -> Bool {
        let emailPadrao = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailPadrao)
        
        return emailPredicate.evaluate(with: email)
    }
        
    func submeterInscricao() {
        exibeAlerta(titulo: "Feito!", mensagem: "Verifique seu email e tenha acesso ao documento.")
        apagarCamposDoFormulario()
    }
    
    func exibeAlerta(titulo: String? = "Quase lá!", mensagem: String? = "Verifique os dados informados e tente novamente.") {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok!", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func apagarCamposDoFormulario() {
        [nomeTextField, emailTextField, areaAtuacaoTextField, statusProfissionalTextField].forEach { textField in
            textField.text = ""
        }
    }


}

