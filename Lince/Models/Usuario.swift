//
//  User.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import Foundation

class User: Identifiable, ObservableObject {
    
    var dados: Dados = Dados()
    var login: Login = Login()
    var perfis: [Perfil] = []
    
}

class Dados: Identifiable, ObservableObject {
    
    var nome: String = ""
    var sobrenome: String = ""
    var dataNasc: Date = Date()
    var endereco: Endereco = Endereco()
    var idiomaP: String = ""
    var docType: String = ""
    var cpfCnpj: String = ""
    var email: String = ""
    var telefone: String = ""
    var celular: String = ""
    var genero: String = ""
        
    
}

class Endereco: Identifiable, ObservableObject {
    
    var cidade: String = ""
    var estado: String = ""
    var pais: String = ""
    var ender: String = ""
    var bairro: String = ""
    var ZIP: String = ""
}


class Login: Identifiable, ObservableObject {
    
    var usuario: String = ""
    var senha: String = ""
    
}

class Perfil: Identifiable, ObservableObject {
    
    var profType: String = ""
    
    var id: Int = 0
    
    var username: String = ""
    
    var esporte: String?
    var titulos: [Titulos]?
    var cases: [CaseDeSucesso]?
    var loja: Loja?
    var nomeSocial: String = ""
    var foto: String = ""
    var nacionalidade: String = ""
    var pcd: Bool = false
    var altura: Double?
    var peso: Double?
    var percentualGordura: Double?
    var biog: String = ""
    var classificacao: String?
    var contatos: Contato?
    var redes: [String]?
    var experienciaProf: [Experiencia]?
    var conquistas: [String]?
    var estatisticas: Estatisticas?
    var fotos: [String]?
    var videos: Videos?
    var quemVisitou: [String]?
    var numeroSeguidores: Int = 100
    var numeroSeguidos: Int = 100
    var patrocinadores: [String]?
    var interesses: [String] = [""]
    
}

class Loja: Identifiable, ObservableObject {
    
    var serviços: URL?
    var produtos: [String]?
    
}

class CaseDeSucesso: Identifiable, ObservableObject {
    
    var id: String = UUID().uuidString
    
    var usuario: String?
    var descricao: String?
    
}

class Titulos: Identifiable, ObservableObject {
    
    var titulo: String?
    var orgao: String?
    
}

class Contato: Identifiable, ObservableObject {
    
    var email: String?
    var phone: String?
    var cel: String?
    
}

class Experiencia: Identifiable, ObservableObject {
    
    var inicio: Date?
    var fim: Date?
    var detalhes: String?
    
}

class Estatisticas: Identifiable, ObservableObject {
    
    var partidasJogadas: Int?
    var partidasVencidas: Int?
    
}

class Videos: Identifiable, ObservableObject {
    
    var highlights: [URL]?
    var teaser: URL?
    
}
