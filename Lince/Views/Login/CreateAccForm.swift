//
//  CreateAccForm.swift
//  Lince
//
//  Created by Leon Sanchez on 19/05/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct CreateAccForm: View {
    
    @EnvironmentObject var model: UserModel
    
    @Binding var formShowing: Bool

    @State var showPassw: Bool = false
    
    @State var errorMessage: String?
    
    @State var email: String = ""
    @State var senha: String = ""
    
    @State var nome: String = ""
    @State var lastName: String = ""
    @State var nascim: Date = Date()
    @State var docType: String = ""
    @State var doc: String = ""
    @State var telefone: String = ""
    @State var genero: String = "                 "
    
    @State var cidade: String = ""
    @State var estado: String = ""
    @State var pais: String = ""
    @State var bairro: String = ""
    @State var rua: String = ""
    @State var cep: String = ""
    
    let neon1 = Color(#colorLiteral(red: 0.7028765741, green: 0.9768045545, blue: 0.009863989394, alpha: 1))
    let neon2 = Color(#colorLiteral(red: 0.0493834918, green: 0.8453449901, blue: 0.9768045545, alpha: 1))
    let neon3 = Color(#colorLiteral(red: 0.9768045545, green: 0.005682029335, blue: 0.7720370183, alpha: 1))
    
    @State private var index = 0
    
    var body: some View {
        
        VStack{
            
            HStack{
                Spacer()
                VStack(spacing:15){
                    Circle()
                        .foregroundColor(neon1)
                        .frame(width: 160, height: 160)
                        .overlay(
                            Circle()
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color(.systemBackground))
                        )
                    RoundedRectangle(cornerRadius: 20.0)
                        .frame(width: 190, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                }
                Spacer()
            }.padding([.top,.bottom], 20)
            
            TabView(selection: $index) {
                
                Form{
                    
                    Section{
                        
                        TextField("Email", text: $email)
                        if showPassw {
                            TextField("Senha", text: $senha)
                        }
                        else{
                            SecureField("Senha", text: $senha)
                        }
                        TextField("Nome", text: $nome)
                        
                        Toggle(isOn: $showPassw, label: {
                            Text("Mostrar senha")
                        })
                        
                    }
                    
                    
                    if errorMessage != nil {
                        Section{
                            Text(errorMessage!)
                        }
                    }
                    
                    
                }.tag(0)
                
                Form{
                    
                    //ScrollView{
                    
                    Section(header:Text("Dados")){
                        
                        HStack{
                            Text("Nome: ")
                            TextField("Nome", text: $nome)
                        }
                        
                        HStack{
                            Text("Sobrenome: ")
                            TextField("Sobrenome", text: $lastName)
                        }
                        
                        HStack{
                            Text("Data de nascimento: ")
                            DatePicker("", selection: $nascim, displayedComponents: [.date])
                        }
                        
                        HStack{
                            Text("CPF ou CNPJ: ")
                            Picker("documento", selection: $docType){
                                Text("CPF").tag("CPF")
                                Text("CNPJ").tag("CNPJ")
                            }.pickerStyle(SegmentedPickerStyle())
                        }
                        
                        HStack{
                            Text("CPF ou CNPJ: ")
                            TextField("Documento", text: $doc)
                        }
                        
                        HStack{
                            Text("Celular: ")
                            TextField("DDD + Numero", text: $telefone)
                        }
                        
                        HStack{
                            Text("Gênero: ")
                            Picker("\(genero)", selection: $genero) {
                                
                                Text("Masculino").tag("Masculino")
                                Text("Feminino").tag("Feminino")
                                Text("Não-binário").tag("Não-binário")
                                Text("Prefiro não responder").tag("Prefiro não responder")
                                
                            }.pickerStyle(MenuPickerStyle()).foregroundColor(.black)
                        }
                        
                    }
                    
                    Section(header:Text("Endereço")){
                        
                        HStack{
                            Text("Rua e número: ")
                            TextField("Endereço", text: $rua)
                        }
                        
                        HStack{
                            Text("Bairro: ")
                            TextField("Bairro", text: $bairro)
                        }
                        
                        HStack{
                            Text("Cidade: ")
                            TextField("Cidade", text: $cidade)
                        }
                        
                        HStack{
                            Text("Estado: ")
                            TextField("Estado", text: $estado)
                        }
                        
                        HStack{
                            Text("País: ")
                            TextField("Pais", text: $pais)
                        }
                        
                        HStack{
                            Text("CEP: ")
                            TextField("CEP", text: $cep)
                        }
                        
                        
                    }
                    
                    if errorMessage != nil {
                        Section{
                            Text(errorMessage!)
                        }
                    }
                    
                }.tag(1)
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            Button(action: {
                
                if index == 0 {
                    index = 1
                }
                else if index == 1 {
                    
                    createAcc()
                    
                }
                
            }, label: {
                
                if index == 0 {
                    HStack{
                        Spacer()
                        Text("Avançar").font(.title3)
                        Spacer()
                    }.padding()
                }
                else if index == 1 {
                    HStack{
                        Spacer()
                        Text("Completar").font(.title3)
                        Spacer()
                    }.padding()
                    
                }
                
            })
            
        }
        .foregroundColor(neon1)
        .accentColor(neon1)
        .preferredColorScheme(.dark)
        
        
    }

    func createAcc() {
        Auth.auth().createUser(withEmail: email, password: senha) { (result, error) in
            
            DispatchQueue.main.async {
                if error == nil {
                    buildUser()
                    formShowing = false
                }
                else {
                    errorMessage = error!.localizedDescription
                }
            }
        }
    }
    
    func buildUser(){
        
        if let currentUser = Auth.auth().currentUser {
            
            let db = Firestore.firestore()
            let path = db.collection("users").document(currentUser.uid)

            path.setData([
                "nome":nome,
                "sobrenome":lastName,
                "email":email,
                "senha":senha,
                "nascimento":nascim,
                "documento":doc,
                "tipoDocumento":docType,
                "telefone":telefone,
                "genero":genero,
                "cidade":cidade,
                "estado":estado,
                "pais":pais,
                "bairro":bairro,
                "rua":rua,
                "cep":cep
            
            ]) { (error) in
                
                if error == nil {
                    //saved
                    model.model.dados.nome = nome
                    model.model.dados.sobrenome = lastName
                    model.model.dados.dataNasc = nascim
                    model.model.dados.cpfCnpj = doc
                    model.model.dados.docType = docType
                    model.model.dados.telefone = telefone
                    model.model.dados.genero = genero
                    model.model.dados.endereco.cidade = cidade
                    model.model.dados.endereco.estado = estado
                    model.model.dados.endereco.pais = pais
                    model.model.dados.endereco.ender = rua
                    model.model.dados.endereco.bairro = bairro
                    model.model.dados.endereco.ZIP = cep
                }
                else{
                    errorMessage = error?.localizedDescription
                    
                }
            }
            
        }
        
    }
}

struct CreateAccForm_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccForm(formShowing: Binding.constant(true))
    }
}
