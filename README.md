# Flutter JazzCash & EasyPaisa Integration Example

<p align="center">
  <img src="https://i.pinimg.com/originals/f1/e7/34/f1e734f9cade86fe737a9aa404ad5677.gif" alt="Flutter" width="400"/>
</p>

---

### 👋 **Hi, I'm Muhammad Anus Gul!**

🚀 **Flutter Developer** | 🌍 **Pakistan**

This repository demonstrates the integration of **JazzCash**, **EasyPaisa**, and **Credit Card** payment gateways into a Flutter application using the `paymob_pakistan` package. The project is designed to help developers understand how to implement seamless payment solutions in their Flutter apps.

---

### 🛠 **Features**

- **Initial Payment**: A one-time payment of PKR 15,000 through JazzCash, EasyPaisa, or Credit Card.
- **Daily Credit System**: Automatically adds PKR 500 to the user's account daily.
- **Weekly Withdrawal**: Allows users to withdraw their balance on Sundays using JazzCash or EasyPaisa.
- **Multi-Payment Support**: Demonstrates integration with multiple payment methods, ensuring flexibility for users.
- **Balance Management**: Real-time display and update of user account balance.

---

### 💻 **Tech Stack**

- **Flutter Framework**: Cross-platform app development.
- **Dart Programming Language**: Clean and maintainable code.
- **Paymob Pakistan Package**: Payment gateway integration.
- **State Management**: Efficient state handling for balance updates and user actions.

---

### 🚀 **Getting Started**

Follow these steps to run the project locally:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/AnssGul/flutter-jazzcash-easypaisa-integration.git
   cd flutter-jazzcash-easypaisa-integration
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Add Your Payment Gateway Credentials:**
   Replace placeholders like `{YOUR_API_KEY}`, `integrationID`, `jazzcashIntegrationId`, and `easypaisaIntegrationID` in the `main.dart` file with your actual credentials.

4. **Run the App:**
   ```bash
   flutter run
   ```

---

### 📂 **Project Structure**

```
flutter-jazzcash-easypaisa-integration/
├── lib/
   ├── main.dart         # Entry point of the app
   ├── home/
      ├── home_view.dart  # Home screen implementation
   ├── models/
      ├── user_balance.dart  # User balance management
   ├── services/
      ├── payment_service.dart  # Payment gateway logic
```

---

### 🔧 **Usage**

#### Payment Initialization

```dart
PaymobPakistan.instance.initialize(
  apiKey: "{YOUR_API_KEY}",
  integrationID: 123456,
  iFrameID: 123456,
  jazzcashIntegrationId: 123456,
  easypaisaIntegrationID: 123456,
);
```

#### Payment Process

```dart
PaymobPakistan.instance.makePayment(
  context,
  currency: "PKR",
  amountInCents: "1500000",
  paymentType: PaymentType.jazzcash,
  authToken: response.authToken,
  orderID: response.orderID,
  onPayment: (result) {
    if (result.success ?? false) {
      // Update balance
    }
  },
);
```

---

### 🌟 **Author**

**Muhammad Anus Gul**  
🚀 Passionate **Flutter Developer** specializing in seamless app experiences.

💬 Feel free to reach out for collaboration or queries:

- **Email**: muhammadanssguljalal@gmail.com
- **LinkedIn**: [Connect with Me](https://www.linkedin.com/in/muhammadanusgull)
- **Instagram**: [Follow Me](https://instagram.com/muhammadanssgul)

---

### 📜 **License**

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### 🌟 **Contributions**

Contributions are always welcome! If you have ideas or improvements, feel free to open an issue or submit a pull request.

