# SmartDine Restaurant Management System
**Personal Feature Development by LuongMarus**

A comprehensive restaurant management system with advanced features for branch management, order tracking, analytics, and real-time notifications. Built with Flutter for mobile/web frontend and Spring Boot for the backend.

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.0-6DB33F?logo=spring-boot)](https://spring.io/projects/spring-boot)
[![Java](https://img.shields.io/badge/Java-17-007396?logo=java)](https://www.oracle.com/java/)

## 🚀 Features

### 📍 Branch Management
- Create, update, and manage multiple restaurant branches
- Track branch status (Active, Inactive, Maintenance)
- Manage branch details (location, contacts, manager assignments)
- Search and filter branches

### 📦 Order Tracking
- Real-time order management and tracking
- Multi-status order workflow (Pending → Confirmed → Preparing → Ready → Delivered)
- Order history and analytics
- Customer order details and special instructions
- Order cancellation support

### 📊 Analytics Dashboard
- Revenue analytics (Daily, Weekly, Monthly, Yearly)
- Order statistics and trends
- Top-selling items tracking
- Customer satisfaction metrics
- Interactive charts and visualizations
- Performance metrics per branch

### 🔔 Notifications
- Real-time push notifications
- Order status updates
- Branch alerts and system notices
- Unread notification badges
- Notification history

## 🛠️ Technology Stack

### Frontend (Flutter)
- **Framework**: Flutter 3.x
- **State Management**: Provider
- **Navigation**: GoRouter
- **HTTP Client**: Dio
- **Charts**: FL Chart, Syncfusion Charts
- **UI Components**: Material Design 3
- **Local Storage**: SharedPreferences, SQLite

### Backend (Spring Boot)
- **Framework**: Spring Boot 3.2.0
- **Language**: Java 17
- **Database**: H2 (Development), PostgreSQL (Production)
- **ORM**: Spring Data JPA
- **Build Tool**: Maven
- **API**: RESTful APIs with CORS support

## 📁 Project Structure

```
SmartDine_Marus_Feature/
├── frontend/                 # Flutter mobile/web application
│   ├── lib/
│   │   ├── models/          # Data models
│   │   ├── screens/         # UI screens
│   │   ├── services/        # API services
│   │   ├── providers/       # State management
│   │   ├── widgets/         # Reusable components
│   │   └── utils/           # Utilities
│   ├── assets/              # Images, icons, fonts
│   └── pubspec.yaml         # Flutter dependencies
├── backend/                  # Spring Boot REST API
│   ├── src/
│   │   ├── main/java/com/smartdine/
│   │   │   ├── controller/  # REST controllers
│   │   │   ├── model/       # JPA entities
│   │   │   ├── repository/  # Data repositories
│   │   │   ├── service/     # Business logic
│   │   │   └── dto/         # Data transfer objects
│   │   └── resources/       # Application properties
│   └── pom.xml              # Maven dependencies
└── docs/                     # Documentation
    └── API_DOCUMENTATION.md # API reference
```

## 🚀 Getting Started

### Prerequisites
- **Flutter SDK**: 3.0 or higher
- **Java JDK**: 17 or higher
- **Maven**: 3.6 or higher
- **IDE**: Android Studio / VS Code / IntelliJ IDEA

### Backend Setup

1. Navigate to backend directory:
```bash
cd backend
```

2. Build the project:
```bash
mvn clean install
```

3. Run the application:
```bash
mvn spring-boot:run
```

The backend will start at `http://localhost:8080`

**H2 Console**: Access at `http://localhost:8080/h2-console`
- JDBC URL: `jdbc:h2:mem:smartdine`
- Username: `sa`
- Password: (empty)

### Frontend Setup

1. Navigate to frontend directory:
```bash
cd frontend
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

For web:
```bash
flutter run -d chrome
```

## 📱 Screens

1. **Home Dashboard** - Overview with key metrics and quick actions
2. **Branch Management** - Manage restaurant branches
3. **Order Tracking** - Monitor and update orders in real-time
4. **Analytics** - View business insights and trends
5. **Notifications** - Stay updated with system alerts

## 🔌 API Endpoints

### Branch API
- `GET /api/v1/branches` - Get all branches
- `POST /api/v1/branches` - Create branch
- `PUT /api/v1/branches/{id}` - Update branch
- `DELETE /api/v1/branches/{id}` - Delete branch

### Order API
- `GET /api/v1/orders` - Get all orders
- `POST /api/v1/orders` - Create order
- `PUT /api/v1/orders/{id}/status` - Update order status
- `DELETE /api/v1/orders/{id}` - Cancel order

### Analytics API
- `GET /api/v1/analytics/{branchId}` - Get analytics data
- `GET /api/v1/analytics/{branchId}/dashboard` - Get dashboard stats
- `GET /api/v1/analytics/{branchId}/top-items` - Get top selling items

### Notification API
- `GET /api/v1/notifications` - Get all notifications
- `PUT /api/v1/notifications/{id}/read` - Mark as read
- `PUT /api/v1/notifications/read-all` - Mark all as read

For complete API documentation, see [API_DOCUMENTATION.md](docs/API_DOCUMENTATION.md)

## 🧪 Testing

### Backend Tests
```bash
cd backend
mvn test
```

### Frontend Tests
```bash
cd frontend
flutter test
```

## 📦 Building for Production

### Backend
```bash
cd backend
mvn clean package
java -jar target/smartdine-backend-1.0.0.jar
```

### Frontend
```bash
cd frontend

# Android
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

## 🔧 Configuration

### Backend Configuration
Edit `backend/src/main/resources/application.properties`:
```properties
server.port=8080
spring.datasource.url=jdbc:h2:mem:smartdine
# Add PostgreSQL config for production
```

### Frontend Configuration
Edit `frontend/lib/services/api_service.dart`:
```dart
static const String baseUrl = 'http://localhost:8080/api/v1';
```

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**LuongMarus**
- Personal feature development for SmartDine Restaurant Management System
- Independent contributions to the restaurant management ecosystem

## 🤝 Contributing

This is a personal project for feature development. Feel free to fork and adapt for your own use.

## 📧 Support

For issues or questions, please open an issue on GitHub.

## 🎯 Roadmap

- [ ] User authentication and authorization
- [ ] Role-based access control
- [ ] Menu management
- [ ] Table reservation system
- [ ] Payment integration
- [ ] Inventory management
- [ ] Staff management
- [ ] Multi-language support
- [ ] Dark mode theme
- [ ] Mobile app deployment

## 🌟 Acknowledgments

Built with Flutter and Spring Boot frameworks
- Flutter team for the amazing cross-platform framework
- Spring community for robust backend solutions
