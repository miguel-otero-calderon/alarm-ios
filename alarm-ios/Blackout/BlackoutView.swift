import SwiftUI

struct BlackoutView: View {
    var body: some View {
        VStack {
            Image("blackoutBackgorund")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 207)

            Image("blackoutImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 123, height: 123)
                .padding(.top, -60)

            Text("Nuestra app está en mantención")
                .font(.custom("SourceSansPro-Bold", size: 22))
                .foregroundColor(Color("greenJumbo"))
                .padding(.top, 49)
                .padding(.horizontal, 16)

            Text("Porque queremos entregarte siempre un buen servicio, estamos trabajando para mejorar tu experiencia de compra.")
                .font(.custom("SourceSansPro-Regular", size: 16))
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                .padding([.top, .horizontal], 16)

            Text("Pronto estará disponible.")
                .font(.custom("SourceSansPro-Bold", size: 16))
                .padding(.top, 24)
                .padding(.horizontal, 16)
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("systemBackgroundColor"))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BlackoutView()
}

