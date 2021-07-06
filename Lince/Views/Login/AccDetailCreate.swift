//
//  AccDetailCreate.swift
//  Lince
//
//  Created by Leon Sanchez on 19/05/21.
//

import SwiftUI
import FirebaseAuth

struct AccDetailCreate: View {
    
    @Binding var formShowing: Bool
    @State var loggedIn: Bool
    
    @State var name: String = ""
    @State var lastName: String = ""
    @State var nascim: Date = Date()
    @State var cpf: String = ""
    @State var telefone: String = ""
    @State var genero: String = "        "
    
    @State var cidade: String = ""
    @State var estado: String = ""
    @State var pais: String = ""
    @State var bairro: String = ""
    @State var rua: String = ""
    @State var cep: String = ""
    
    var body: some View {
        
        NavigationView {
            
            Form{
                
                //ScrollView{
                
                Section(header:Text("Dados")){
                    
                    HStack{
                        Text("Nome de Usurio:  @")
                        TextField("usuario", text: $name)
                    }
                    
                    HStack{
                        Text("Nome: ")
                        TextField("Nome", text: $name)
                    }
                    
                    HStack{
                        Text("Sobrenome: ")
                        TextField("Sobrenome", text: $name)
                    }
                    
                    HStack{
                        Text("Data de nascimento: ")
                        DatePicker("", selection: $nascim, displayedComponents: [.date]).accentColor(.primary)
                    }
                    
                    HStack{
                        Text("CPF ou CNPJ: ")
                        TextField("Documento", text: $cpf)
                    }
                    
                    HStack{
                        Text("Celular: ")
                        TextField("DDD + Numero", text: $cpf)
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
                
                Section{
                    Button(action: {
                        
                        buildProfile()
                        
                    }, label: {
                        Text("Completar")
                    })
                }
                
                //}
            }
            .navigationBarTitle("Crie uma conta")
            .font(.system(size: 18))
            
        }
        
    }
    
    func buildProfile() {
        
        formShowing = false
        
        loggedIn = Auth.auth().currentUser == nil ? false : true
        
    }
    
}


struct AccDetailCreate_Previews: PreviewProvider {
    static var previews: some View {
        AccDetailCreate(formShowing: Binding.constant(true), loggedIn: true)
    }
}
