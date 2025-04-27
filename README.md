# 📱 MazaadyPortalApp

A modern iOS application built with **UIKit**, displaying auction products in a dynamic waterfall grid layout with live countdowns and special offers.

## ✨ Features
- Product list with:
  - Image
  - Name
  - Price
  - Special Offer (if available)
  - Countdown Timer (if available)
- Dynamic cell heights using custom `UICollectionViewLayout`
- No third-party libraries (fully native UIKit)

## 🛠️ Requirements
- iOS 16.0+
- Xcode 15+
- Swift 5.9

## 🚀 Installation
1. Clone the repository:
    ```bash
    git clone https://github.com/SandraGeorge19/MazaadyPortalApp.git
    ```
2. Open `MazaadyPortal.xcodeproj` in Xcode.
3. Build and run on a simulator or device.

## 📋 Project Structure
> Project is organized following **Clean Architecture** principles (Service → Repository → UseCase → ViewModel → ViewController).
- `Services/`: Networking layer handling API calls.
- `Repositories/`: Responsible for data handling and communication between services and use cases.
- `UseCases/`: Business logic of the app, coordinates between repositories and view models.
- `ViewModels/`: Prepare and manage data for the UI.
- `Views/`: Reusable UI components created using UIKit with `.xib` (Nib) files.
- `Controllers/`: ViewControllers that bind the ViewModels to the Views.


## 👩‍💻 Author
- Sandra George
- [GitHub](https://github.com/SandraGeorge19)

---

Feel free to ⭐️ the repo if you find it useful!
