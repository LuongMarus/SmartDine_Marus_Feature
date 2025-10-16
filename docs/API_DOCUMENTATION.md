# SmartDine Restaurant Management System - API Documentation

## Overview
SmartDine is a comprehensive restaurant management system built with Flutter (frontend) and Spring Boot (backend). This system provides features for branch management, order tracking, analytics, and notifications.

## Technology Stack

### Frontend (Flutter)
- **Framework**: Flutter 3.x
- **State Management**: Provider
- **Routing**: GoRouter
- **HTTP Client**: Dio
- **Charts**: FL Chart, Syncfusion Charts
- **Local Storage**: SharedPreferences, SQLite
- **Notifications**: Flutter Local Notifications

### Backend (Spring Boot)
- **Framework**: Spring Boot 3.2.0
- **Language**: Java 17
- **Database**: H2 (development), PostgreSQL (production)
- **ORM**: Spring Data JPA
- **Build Tool**: Maven

## API Endpoints

### Branch Management
- `GET /api/v1/branches` - Get all branches
- `GET /api/v1/branches/{id}` - Get branch by ID
- `POST /api/v1/branches` - Create new branch
- `PUT /api/v1/branches/{id}` - Update branch
- `DELETE /api/v1/branches/{id}` - Delete branch
- `GET /api/v1/branches?status={status}` - Get branches by status

### Order Tracking
- `GET /api/v1/orders` - Get all orders
- `GET /api/v1/orders/{id}` - Get order by ID
- `POST /api/v1/orders` - Create new order
- `PUT /api/v1/orders/{id}/status` - Update order status
- `DELETE /api/v1/orders/{id}` - Cancel order
- `GET /api/v1/orders?branchId={id}` - Get orders by branch
- `GET /api/v1/orders?status={status}` - Get orders by status

### Analytics
- `GET /api/v1/analytics/{branchId}?period={period}` - Get analytics for branch
- `GET /api/v1/analytics/{branchId}/dashboard` - Get dashboard statistics
- `GET /api/v1/analytics/{branchId}/top-items?limit={n}` - Get top selling items

### Notifications
- `GET /api/v1/notifications` - Get all notifications
- `GET /api/v1/notifications/{id}` - Get notification by ID
- `GET /api/v1/notifications?isRead=false` - Get unread notifications
- `GET /api/v1/notifications/unread-count` - Get unread count
- `POST /api/v1/notifications` - Create notification
- `PUT /api/v1/notifications/{id}/read` - Mark notification as read
- `PUT /api/v1/notifications/read-all` - Mark all as read
- `DELETE /api/v1/notifications/{id}` - Delete notification

## Data Models

### Branch
```json
{
  "id": "uuid",
  "name": "Branch Name",
  "address": "123 Main St",
  "phone": "+1234567890",
  "email": "branch@example.com",
  "manager": "John Doe",
  "status": "ACTIVE|INACTIVE|MAINTENANCE",
  "createdAt": "2024-01-01T00:00:00",
  "updatedAt": "2024-01-01T00:00:00",
  "metadata": {}
}
```

### Order
```json
{
  "id": "uuid",
  "branchId": "uuid",
  "customerId": "uuid",
  "customerName": "Jane Smith",
  "items": [
    {
      "id": "uuid",
      "name": "Item Name",
      "quantity": 2,
      "price": 15.99,
      "notes": "Extra sauce"
    }
  ],
  "totalAmount": 31.98,
  "status": "PENDING|CONFIRMED|PREPARING|READY|DELIVERED|CANCELLED",
  "specialInstructions": "No onions",
  "createdAt": "2024-01-01T00:00:00",
  "updatedAt": "2024-01-01T00:00:00",
  "completedAt": "2024-01-01T00:00:00",
  "assignedTo": "chef-id"
}
```

### Notification
```json
{
  "id": "uuid",
  "title": "Notification Title",
  "message": "Notification message",
  "type": "GENERAL|ORDER_UPDATE|BRANCH_ALERT|SYSTEM_NOTICE",
  "branchId": "uuid",
  "orderId": "uuid",
  "isRead": false,
  "createdAt": "2024-01-01T00:00:00",
  "data": {}
}
```

## Setup Instructions

### Backend Setup
```bash
cd backend
mvn clean install
mvn spring-boot:run
```

The backend will be available at `http://localhost:8080`
H2 Console: `http://localhost:8080/h2-console`

### Frontend Setup
```bash
cd frontend
flutter pub get
flutter run
```

## Features

### 1. Branch Management
- Create, read, update, and delete restaurant branches
- Track branch status (active, inactive, maintenance)
- Manage branch information (address, phone, email, manager)

### 2. Order Tracking
- Real-time order tracking
- Order status updates (pending, confirmed, preparing, ready, delivered, cancelled)
- Order history and filtering
- Customer order details

### 3. Analytics
- Revenue analytics by period (daily, weekly, monthly, yearly)
- Order statistics
- Top selling items
- Customer satisfaction metrics
- Visual charts and graphs

### 4. Notifications
- Real-time push notifications
- Order status updates
- Branch alerts
- System notices
- Unread notification badges

## Development

### Running Tests
Backend:
```bash
cd backend
mvn test
```

Frontend:
```bash
cd frontend
flutter test
```

### Building for Production
Backend:
```bash
cd backend
mvn clean package
java -jar target/smartdine-backend-1.0.0.jar
```

Frontend:
```bash
cd frontend
flutter build apk  # Android
flutter build ios  # iOS
flutter build web  # Web
```

## Environment Variables
Create a `.env` file in the backend directory:
```
SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/smartdine
SPRING_DATASOURCE_USERNAME=your_username
SPRING_DATASOURCE_PASSWORD=your_password
```

## License
Apache License 2.0

## Author
LuongMarus - Personal Feature Development

## Support
For issues and questions, please open an issue on GitHub.
