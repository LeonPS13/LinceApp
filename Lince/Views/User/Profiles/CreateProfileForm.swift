//
//  CreateProfileForm.swift
//  Lince
//
//  Created by Leon Sanchez on 24/05/21.
//

import SwiftUI
import Firebase

struct CreateProfileForm: View {
    
    
    @EnvironmentObject var model: UserModel
    
    @Binding var formShowing: Bool
    
    @State var showPassw: Bool = false
    
    @State var errorMessage: String?
    
    @State var profileType: String = ""
    
    @State var perfil: Perfil = Perfil()
    
    @State var username: String = ""
    @State var nomeSocial: String = ""
    @State var nacionalidade: String = ""
    @State var pcd: Bool = false
    @State var altura: Double = 0
    @State var peso: Double = 0
    @State var gorduraCorporal: Double = 0
    @State var biografia: String = ""
    @State var classific: String = ""
    @State var redesSociais: [String] = [""]
    @State var expInicio: Date = Date()
    @State var expFim: Date = Date()
    @State var expDetalhes: String = ""
    @State var exp: Experiencia = Experiencia()
    @State var exps: [Experiencia] = []
    @State var detalhes: [String] = []
    @State var conquista: String = ""
    @State var conquistas: [String] = []
    @State var statJogadas: Int = 0
    @State var statVencidas: Int = 0
    @State var stats: Estatisticas = Estatisticas()
    @State var orgao: String = ""
    @State var titulo: String = ""
    @State var tituloX: Titulos = Titulos()
    @State var titulos: [Titulos] = []
    @State var titDisp: String = ""
    @State var tituloDisplay: [String] = []
    @State var casesSucesso: [CaseDeSucesso] = []
    @State var caseSucesso: CaseDeSucesso = CaseDeSucesso()
    @State var caseUser: String = ""
    @State var caseDetalhes: String = ""
    @State var casesPrint: [String] = []
    @State var interesse: String = ""
    @State var interesses: [String] = []
    
    @State private var profindex = 0
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 0){
                
                Form{
                    
                    Section(header:Text("Perfil")){
                        
                        HStack {
                            Spacer()
                            Text("Escolha o tipo do perfil").font(.title3)
                            Spacer()
                        }
                        
                        Picker("", selection: $profileType){
                            
                            Text("Atleta").tag("Atleta")
                            Text("Profissional").tag("Profissional")
                            Text("Business").tag("Business")
                            Text("Sport Fan").tag("Sport Fan")
                            
                        }.pickerStyle(SegmentedPickerStyle())
                        
                    }
                    
                    
                    if profileType == "Atleta"{
                        
                        Section(header:Text("Informaçoes")){
                            
                            HStack{
                                Text("Nome de Usurio:  @")
                                TextField("usuario", text: $username)
                            }
                            
                            HStack{
                                Text("Nome Social: ")
                                TextField("Nome", text: $nomeSocial)
                            }
                            
                            HStack{
                                Text("Nacionalidade: ")
                                TextField("Pais", text: $nacionalidade)
                            }
                            
                            HStack{
                                Text("PCD: ")
                                Toggle(isOn: $pcd, label: {
                                    Text("")
                                })
                            }
                            
                            HStack{
                                Text("Altura: ")
                                TextField("Altura (metros)", value: $altura, formatter: NumberFormatter())
                            }
                            
                            
                            HStack{
                                Text("Peso: ")
                                TextField("Peso (Kg)", value: $peso, formatter: NumberFormatter())
                            }
                            
                            
                            HStack{
                                Text("gorduraCorporal: ")
                                TextField("% de gordura", value: $gorduraCorporal, formatter: NumberFormatter())
                            }
                            
                            HStack {
                                Spacer()
                                Text("Classificação")
                                Spacer()
                            }
                            
                            Picker("", selection: $classific){
                                
                                Text("Amador").tag("Amador")
                                Text("Profissional").tag("Profissional")
                                Text("Ex-atleta").tag("Ex-atleta")
                                
                            }.pickerStyle(SegmentedPickerStyle())
                            
                            
                            HStack{
                                Text("Biografia: ")
                                TextField("Fale mais sobre você", text: $biografia)
                            }
                            
                            
                        }
                        
                        Section(header: Text("Experiencia")){
                            
                            HStack{
                                Text("Inicio: ")
                                DatePicker("", selection: $expInicio, displayedComponents: [.date]).accentColor(.primary)
                            }
                            HStack{
                                Text("Fim: ")
                                DatePicker("", selection: $expFim, displayedComponents: [.date]).accentColor(.primary)
                            }
                            HStack{
                                Text("Descrição: ")
                                TextField("Experiência", text: $expDetalhes)
                            }
                            
                            Button {
                                
                                detalhes.append(expDetalhes)
                                
                                exp.inicio = expInicio
                                exp.fim = expFim
                                exp.detalhes = expDetalhes
                                
                                
                                exps.append(exp)
                                
                                
                            } label: {
                                
                                ZStack{
                                    Rectangle()
                                        .frame(height:30)
                                        .foregroundColor(.blue)
                                        .cornerRadius(8)
                                    Text("Adicionar experiência")
                                        .foregroundColor(.white)
                                }
                                
                            }
                            
                            ForEach(detalhes, id:\.self) { i in
                                
                                Text(i)
                                
                            }
                            
                        }
                        
                        Section(header:Text("Conquistas")){
                            
                            TextField("Conquistas", text: $conquista)
                            
                            Button {
                                
                                conquistas.append(conquista)
                                
                                
                            } label: {
                                
                                ZStack{
                                    Rectangle()
                                        .frame(height:30)
                                        .foregroundColor(.blue)
                                        .cornerRadius(8)
                                    Text("Adicionar conquista")
                                        .foregroundColor(.white)
                                }
                                
                            }
                            
                            
                            
                            
                            ForEach(conquistas, id:\.self) { i in
                                
                                Text(i)
                                
                            }
                            
                            
                            
                            
                        }
                        
                        Section(header: Text("Estatísticas")){
                            
                            Text("Partidas jogadas")
                            TextField("partidas", value: $statJogadas, formatter: NumberFormatter())
                            Text("Partidas vencidas")
                            TextField("partidas", value: $statVencidas, formatter: NumberFormatter())
                            
                            Button {
                                
                                stats.partidasJogadas = statJogadas
                                stats.partidasVencidas = statVencidas
                                
                                
                            } label: {
                                
                                ZStack{
                                    Rectangle()
                                        .frame(height:30)
                                        .foregroundColor(.blue)
                                        .cornerRadius(8)
                                    Text("Salvar estatística")
                                        .foregroundColor(.white)
                                }
                                
                            }
                            
                        }
                        
                    }
                    else if profileType == "Profissional"{
                        
                        Section(header:Text("Informaçoes")){
                            
                            HStack{
                                Text("Nome de Usurio:  @")
                                TextField("usuario", text: $username)
                            }
                            
                            HStack{
                                Text("Nome Social: ")
                                TextField("Nome", text: $nomeSocial)
                            }
                            
                            HStack{
                                Text("Nacionalidade: ")
                                TextField("Pais", text: $nacionalidade)
                            }
                            
                            HStack {
                                Spacer()
                                Text("Classificação - Profissional de: ")
                                Spacer()
                            }
                            
                            Picker("", selection: $classific){
                                
                                Text("Saúde").tag("Saúde")
                                Text("Comunicação").tag("Comunicação")
                                Text("Esporte").tag("Esporte")
                                
                            }.pickerStyle(SegmentedPickerStyle())
                            
                            HStack{
                                Text("Biografia: ")
                                TextField("Fale mais sobre você", text: $biografia)
                            }
                            
                            
                        }
                        
                        Section(header: Text("Titulos")){
                            
                            HStack{
                                Text("Titulo: ")
                                TextField("Ex.: Ortopedista", text: $titulo)
                            }
                            
                            HStack{
                                Text("Órgão da classe: ")
                                TextField("Ex.: CRM", text: $orgao)
                            }
                            
                            Button {
                                
                                titDisp = titulo + " - " + orgao
                                tituloDisplay.append(titDisp)
                                
                                tituloX.titulo = titulo
                                tituloX.orgao = orgao
                                
                                titulos.append(tituloX)

                            } label: {
                                
                                ZStack{
                                    Rectangle()
                                        .frame(height:30)
                                        .foregroundColor(.blue)
                                        .cornerRadius(8)
                                    Text("Adicionar titulo")
                                        .foregroundColor(.white)
                                }
                                
                            }
                            
                            ForEach(tituloDisplay, id: \.self) { i in
                                
                                HStack{
                                    Text(i)
                                }
                                
                            }
                            
                        }
                        
                        Section(header: Text("Experiencia")){
                            
                            HStack{
                                Text("Inicio: ")
                                DatePicker("", selection: $expInicio, displayedComponents: [.date]).accentColor(.primary)
                            }
                            HStack{
                                Text("Fim: ")
                                DatePicker("", selection: $expFim, displayedComponents: [.date]).accentColor(.primary)
                            }
                            HStack{
                                Text("Descrição: ")
                                TextField("Experiência", text: $expDetalhes)
                            }
                            
                            Button {
                                
                                detalhes.append(expDetalhes)
                                
                                exp.inicio = expInicio
                                exp.fim = expFim
                                exp.detalhes = expDetalhes
                                
                                
                                exps.append(exp)
                                
                                
                            } label: {
                                
                                ZStack{
                                    Rectangle()
                                        .frame(height:30)
                                        .foregroundColor(.blue)
                                        .cornerRadius(8)
                                    Text("Adicionar experiência")
                                        .foregroundColor(.white)
                                }
                                
                            }
                            
                            ForEach(detalhes, id:\.self) { i in
                                
                                Text(i)
                                
                            }
                            
                        }
                        
                        Section(header: Text("Cases de sucesso")){
                            
                            HStack{
                                Text("Nome: ")
                                TextField("paciente/cliente", text: $caseUser)
                            }
                            HStack{
                                Text("Detalhes: ")
                                TextField("Descrição do case", text: $caseDetalhes)
                            }
                            
                            Button {
                                
                                casesPrint.append(caseUser)
                                
                                caseSucesso.usuario = caseUser
                                caseSucesso.descricao = caseDetalhes
                                
                                casesSucesso.append(caseSucesso)
                                
                                
                            } label: {
                                
                                ZStack{
                                    Rectangle()
                                        .frame(height:30)
                                        .foregroundColor(.blue)
                                        .cornerRadius(8)
                                    Text("Adicionar case")
                                        .foregroundColor(.white)
                                }
                                
                            }
                            
                            ForEach(casesPrint, id:\.self) { i in
                                
                                Text(i)
                                
                            }
                            
                        }
                        
                    }
                    else if profileType == "Business"{
                        
                        Section(header:Text("Informaçoes")){
                            
                            HStack{
                                Text("Nome de Usurio:  @")
                                TextField("usuario", text: $username)
                            }
                            
                            HStack{
                                Text("Nome Social: ")
                                TextField("Nome", text: $nomeSocial)
                            }
                            
                            HStack{
                                Text("Nacionalidade: ")
                                TextField("Pais", text: $nacionalidade)
                            }
                            
                            Picker("Classificação - Profissional de: ", selection: $classific){
                                
                                Text("Clube").tag("Saúde")
                                Text("Liga").tag("Comunicação")
                                Text("Confederação").tag("Esporte")
                                Text("Canal de comunicação").tag("Esporte")
                                Text("Investidor").tag("Esporte")
                                
                            }
                            
                            HStack{
                                Text("Titulo: ")
                                TextField("Ex.: Ortopedista", text: $titulo)
                            }
                            
                            HStack{
                                Text("Biografia: ")
                                TextField("Fale mais sobre você", text: $biografia)
                            }
                            
                            
                        }
                        
                        Section(header:Text("Conquistas")){
                            
                            TextField("Conquistas", text: $conquista)
                            
                            Button {
                                
                                conquistas.append(conquista)
                                
                                
                            } label: {
                                
                                ZStack{
                                    Rectangle()
                                        .frame(height:30)
                                        .foregroundColor(.blue)
                                        .cornerRadius(8)
                                    Text("Adicionar conquista")
                                        .foregroundColor(.white)
                                }
                                
                            }
                            
                            
                            
                            
                            ForEach(conquistas, id:\.self) { i in
                                
                                Text(i)
                                
                            }
                            
                            
                            
                            
                        }
                        
                        Section(header: Text("Cases de sucesso")){
                            
                            HStack{
                                Text("Nome: ")
                                TextField("paciente/cliente", text: $caseUser)
                            }
                            HStack{
                                Text("Detalhes: ")
                                TextField("Descrição do case", text: $caseDetalhes)
                            }
                            
                            Button {
                                
                                casesPrint.append(caseUser)
                                
                                caseSucesso.usuario = caseUser
                                caseSucesso.descricao = caseDetalhes
                                
                                casesSucesso.append(caseSucesso)
                                
                                
                            } label: {
                                
                                ZStack{
                                    Rectangle()
                                        .frame(height:30)
                                        .foregroundColor(.blue)
                                        .cornerRadius(8)
                                    Text("Adicionar case")
                                        .foregroundColor(.white)
                                }
                                
                            }
                            
                            ForEach(casesPrint, id:\.self) { i in
                                
                                Text(i)
                                
                            }
                            
                        }
                        
                    }
                    else if profileType == "Sport Fan"{
                        
                        Section(header:Text("Informaçoes")){
                            
                            HStack{
                                Text("Nome de Usurio:  @")
                                TextField("usuario", text: $username)
                            }
                            
                            HStack{
                                Text("Nome Social: ")
                                TextField("Nome", text: $nomeSocial)
                            }
                            
                            HStack{
                                Text("Nacionalidade: ")
                                TextField("Pais", text: $nacionalidade)
                            }
                            
                            Picker("Classificação: ", selection: $classific){
                                
                                Text("Selecione: Sport Fan").tag("Sport Fan")
                                
                            }.pickerStyle(SegmentedPickerStyle())
                            
                            HStack{
                                Text("Titulo: ")
                                TextField("Ex.: Ortopedista", text: $titulo)
                            }
                            
                            HStack{
                                Text("Biografia: ")
                                TextField("Fale mais sobre você", text: $biografia)
                            }
                            
                            
                        }
                        
                        Section(header:Text("Interesses")){
                            
                            TextField("Interesses", text: $interesse)
                            
                            Button {
                                
                                interesses.append(interesse)
                                
                                
                            } label: {
                                
                                ZStack{
                                    Rectangle()
                                        .frame(height:30)
                                        .foregroundColor(.blue)
                                        .cornerRadius(8)
                                    Text("Adicionar interesse")
                                        .foregroundColor(.white)
                                }
                                
                            }

                            ForEach(conquistas, id:\.self) { i in
                                
                                Text(i)
                                
                            }
    
                        }
                        
                    }
                    
                    Button(action: {
                        
                        buildProfile()
                        
                    }, label: {
                        
                        HStack {
                            Spacer()
                            Text("Completar").bold()
                            Spacer()
                        }
                    })
                    
                }
    
            }
            .navigationBarTitle("Crie uma conta!")
            .navigationBarBackButtonHidden(false)
            
        }
        
    }
    
    func buildProfile(){
        
        if let currentUser = Auth.auth().currentUser {
            
            profindex = model.model.perfis.count
            
            let db = Firestore.firestore()
            let path = db
                .collection("users")
                .document(currentUser.uid).collection("Perfis").document("perfil\(profindex)")
            
            DispatchQueue.main.async {
                
                path.setData([
                    "Tipo de perfil":profileType,
                    "username":username,
                    "nome social":nomeSocial,
                    "nacionalidade":nacionalidade,
                    "pcd":pcd,
                    "altura":altura,
                    "peso":peso,
                    "gordura corporal":gorduraCorporal,
                    "biografia":biografia,
                    "classificação":classific,
                    "redes sociais":redesSociais,
                    //"experiencias":exps,
                    "conquistas":conquistas,
                    "partidas jogadas":statJogadas,
                    "partidas vencidas":statVencidas,
                    //"titulos":titulos,
                    //"cases de sucesso":casesSucesso,
                    "interesses":interesses
                    
                ]) { (error) in
                    
                    if error == nil {
                        
                        //saved
                        perfil.profType = profileType
                        perfil.username = username
                        perfil.nomeSocial = nomeSocial
                        perfil.nacionalidade = nacionalidade
                        perfil.pcd = pcd
                        perfil.altura = altura
                        perfil.peso = peso
                        perfil.percentualGordura = gorduraCorporal
                        perfil.biog = biografia
                        perfil.classificacao = classific
                        perfil.redes = redesSociais
                        perfil.id = profindex
                        //perfil.experienciaProf = exps
                        //perfil.estatisticas = stats
                        //perfil.titulos = titulos
                              
                        model.model.perfis.append(perfil)
                        model.perfis.append(perfil)

                        formShowing = false

                    }
                    else{
                        errorMessage = error?.localizedDescription
                    }
                    
                }
                
            }
            
        }

        
    }
    
}

struct CreateProfileForm_Previews: PreviewProvider {
    
    static var previews: some View {
        
        CreateProfileForm(formShowing: Binding.constant(true))
   
    }
    
}
