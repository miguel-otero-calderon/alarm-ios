import SwiftUI

struct BlackoutView: View {
    @ObservedObject var viewModel: BlackoutViewModel
    var body: some View {
        VStack {
            Image(BlackoutViewConstants.blackoutBackgorund)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: BlackoutViewConstants.headerHeight)

            Image(BlackoutViewConstants.blackoutImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: BlackoutViewConstants.iconWidth, height: BlackoutViewConstants.iconHeight)
                .padding(.top, BlackoutViewConstants.iconTop)

            Text(viewModel.title)
                .font(.sourceSansProBold(size: BlackoutViewConstants.Title.fontSize))
                .foregroundColor(Color.greenJumbo)
                .padding(.top, BlackoutViewConstants.Title.top)
                .padding(.horizontal, BlackoutViewConstants.Title.horizontal)

            Text(viewModel.message)
                .font(.sourceSansProRegular(size: BlackoutViewConstants.Message.fontSize))
                .foregroundColor(Color.blackJumbo)
                .padding([.top, .horizontal], BlackoutViewConstants.Message.horizontal)

            Text(viewModel.footer)
                .font(.sourceSansProBold(size: BlackoutViewConstants.Footer.fontSize))
                .padding(.top, BlackoutViewConstants.Footer.top)
                .padding(.horizontal, BlackoutViewConstants.Footer.horizontal)
            
            Spacer()
        }
        .frame(minWidth: .zero, maxWidth: .infinity, minHeight: .zero, maxHeight: .infinity)
        .background(Color.systemBackgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}


