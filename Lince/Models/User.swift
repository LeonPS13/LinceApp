//
//  User.swift
//  Lince
//
//  Created by Leon Sanchez on 14/05/21.
//

import Foundation

class User: Identifiable {
    
    var dados: Dados = Dados()
    var login: Login = Login()
    var perfil: [Perfil] = [Perfil()]
    var interesses: [String] = [""]
    
}

class Dados: Identifiable {
    
    var nome: String = ""
    var sobrenome: String = ""
    var dataNasc: Date = Date()
    var endereco: Endereco = Endereco()
    var idiomaP: String = ""
    var cpfCnpj: String = ""
    var email: String = ""
    var telefone: String = ""
    var celular: String = ""
    var genero: String = ""
        
    
}

class Endereco: Identifiable {
    
    var cidade: String = ""
    var estado: String = ""
    var pais: String = ""
    var ender: String = ""
    var bairro: String = ""
    var ZIP: String = ""
}


class Login: Identifiable {
    
    var usuario: String = ""
    var senha: String = ""
    
}

class Perfil: Identifiable {
    
    var profType: String = ""
    
    var esporte: String?
    var titulos: [Titulos]?
    var cases: [CaseDeSucesso]?
    var loja: Loja?
    var nomeSocial: String = ""
    var foto: String = ""
    var nacionalidade: String = ""
    var pcd: Bool = false
    var altura: Double = 0
    var peso: Double = 0
    var percentualGordura: Double = 0
    var biog: String = ""
    var classificacao: String?
    var contatos: Contato?
    var redes: [URL]?
    var experienciaProf: [Experiencia]?
    var conquistas: [Conquista]?
    var estatisticas: [Estatisticas]?
    var fotos: [String]?
    var videos: Videos?
    var quemVisitou: [String]?
    var numeroSeguidores: Int = 0
    var numeroSeguidos: Int = 0
    var patrocinadores: [String]?
    
}

class Conquista: Identifiable {
    
    var nome: String?
    var data: Date?
    
}

class Loja: Identifiable {
    
    var serviços: URL?
    var produtos: [String]?
    
}

class CaseDeSucesso: Identifiable {
    
    var usuario: String?
    var descricao: String?
    
}

class Titulos: Identifiable {
    
    var titulo: String?
    var orgao: String?
    
}

class Contato: Identifiable {
    
    var email: String?
    var phone: String?
    var cel: String?
    
}

class Experiencia: Identifiable {
    
    var inicio: Date?
    var fim: Date?
    var detalhes: String?
    
}

class Estatisticas: Identifiable {
    
    var partidasJogadas: Int?
    var partidasVencidas: Int?
    
}

class Videos: Identifiable {
    
    var highlights: [URL]?
    var teaser: URL?
    
}
