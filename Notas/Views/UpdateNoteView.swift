//
//  UpdateNoteView.swift
//  Notas
//
//  Created by Armando Rodríguez on 28/11/23.
//

import SwiftUI

struct UpdateNoteView: View {
    var viewModel: ViewModel
    let id: UUID
    @State var title: String = ""
    @State var text: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Form {
                
                Section {
                    TextField("",text: $title, prompt: Text("*Título"), axis:.vertical   )
                    TextField("",text: $text, prompt: Text("*Texto"), axis:.vertical   )
                }
            }
            Button(action: {
                viewModel.removeNoteWith(id: id)
                dismiss()
            }, label: {
                Text("Eliminar Nota")
                    .foregroundStyle(.gray)
                    .underline()
            })
            .buttonStyle(BorderlessButtonStyle())
            Spacer()
            
        }
        .background(Color(uiColor: .systemBackground))
        .toolbar{
            
            ToolbarItem{
                Button {
                    viewModel.updateNoteWith(id:id, newTitle: title, newText: text)
                    dismiss()
                }label: {
                    Text("Guardar")
                        .bold()
                }
            }
        }
        .navigationTitle("Modificar Nota")

        
    }
}

#Preview {
    
    NavigationStack{
        UpdateNoteView(viewModel: .init(), id: .init(),title: "Modificando la Nota",text: "Aquí andamos modificando una nota")
    }
}
