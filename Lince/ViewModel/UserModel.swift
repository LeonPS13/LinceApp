//
//  UserModel.swift
//  Lince
//
//  Created by Leon Sanchez on 21/06/21.
//

import Foundation
import Firebase

class UserModel: ObservableObject {
    
    @Published var model: User
    
    @Published var perfis: [Perfil]
    
    @Published var loggedIn: Bool
    
    @Published var selectedProfile: Int?
    
    init(){
        
        loggedIn = Auth.auth().currentUser == nil ? false : true
        self.model = User()
        self.perfis = []
        if loggedIn == true{
            buildUser()
        }
        
    }
    
    func checkLogin() {
        loggedIn = Auth.auth().currentUser == nil ? false : true
    }
    
    func updateProfiles() {
        DispatchQueue.main.async {
            self.model.perfis = self.perfis
        }
    }
    
    func buildUser(){
        
        if let currentUser = Auth.auth().currentUser {
            
            let db = Firestore.firestore()
            let path1 = db.collection("users").document(currentUser.uid)
            
            path1.getDocument { documentSnapshot, error in
                
                if error == nil{
                    
                    let dict = documentSnapshot!.data()
                    
                    DispatchQueue.main.async {
                        self.model.dados.nome = dict!["nome"] as? String ?? ""
                        self.model.dados.sobrenome = dict!["sobrenome"] as? String ?? ""
                        self.model.dados.dataNasc = dict!["nascimento"] as? Date ?? Date()
                        self.model.dados.cpfCnpj = dict!["documento"] as? String ?? ""
                        self.model.dados.telefone = dict!["telefone"] as? String ?? ""
                        self.model.dados.genero = dict!["genero"] as? String ?? ""
                        self.model.dados.endereco.cidade = dict!["cidade"] as? String ?? ""
                        self.model.dados.endereco.estado = dict!["estado"] as? String ?? ""
                        self.model.dados.endereco.pais = dict!["pais"] as? String ?? ""
                        self.model.dados.endereco.ender = dict!["rua"] as? String ?? ""
                        self.model.dados.endereco.bairro = dict!["bairro"] as? String ?? ""
                        self.model.dados.endereco.ZIP = dict!["cep"] as? String ?? ""
                    }
                    
                }
                else{
                    print(error!.localizedDescription)
                }
                
            }
            
            let path2 = path1.collection("Perfis")
            
            path2.getDocuments { (QuerySnapshot, Error) in
                
                if Error == nil && QuerySnapshot != nil {
                    
                    DispatchQueue.main.async {
                        
                        for i in QuerySnapshot!.documents{
                            
                            let perfil = i.data()
                            let profile = Perfil()
                            
                            profile.profType = perfil["Tipo de perfil"] as? String ?? ""
                            profile.username = perfil["username"] as? String ?? ""
                            profile.nomeSocial = perfil["nome social"] as? String ?? ""
                            profile.nacionalidade = perfil["nacionalidade"] as? String ?? ""
                            profile.pcd = perfil["pcd"] as? Bool ?? false
                            profile.altura = perfil["altura"] as? Double ?? 0
                            profile.peso = perfil["peso"] as? Double ?? 0
                            profile.percentualGordura = perfil["gordura corporal"] as? Double ?? 0
                            profile.biog = perfil["biografia"] as? String ?? ""
                            profile.classificacao = perfil["classificação"] as? String ?? ""
                            profile.redes = perfil["redes sociais"] as? [String] ?? [""]
                            profile.profType = perfil["Tipo de perfil"] as? String ?? ""
                            profile.conquistas = perfil["conquistas"] as? [String] ?? [""]
                            profile.interesses = perfil["interesses"] as? [String] ?? [""]
                            
                            
                            //"experiencias":exps,
                            
                            //"partidas jogadas":statJogadas,
                            //"partidas vencidas":statVencidas,
                            //"titulos":titulos,
                            //"cases de sucesso":casesSucesso,
                            
                            self.perfis.append(profile)
                            self.model.perfis.append(profile)
                            
                            
                        }
                        
                    }
                    
                }
                
            }
 
        }
        
    }
    
}


