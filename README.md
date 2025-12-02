# 🍽️ SmartDine - Branch Management Module

[![Flutter](https://img.shields.io/badge/Flutter-3.7.0-blue.svg)](https://flutter.dev/)
[![Spring Boot](https://img.shields.io/badge/Spring_Boot-2.7+-green.svg)](https://spring.io/projects/spring-boot)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

> **Developer**: Hà Đức Lương (Marus)  
> **Branch Management Module for SmartDine Restaurant Management System**

---

## 👋 Welcome!

This repository showcases the **Branch Management Module** I developed for SmartDine RMS - a comprehensive solution for restaurant branch operations with 12 interactive screens and complete backend integration.

---

## ✨ Branch Management Features

### 🎯 Complete Branch Operations Suite
**Status**: ✅ Production Ready | **Screens**: 12 | **Tech**: Flutter + Spring Boot + PostgreSQL

A full-featured branch management system including:
- 📊 **Branch Dashboard** - Real-time analytics with interactive charts
- 📈 **Branch Reports** - Date-filtered performance analysis  
- 👥 **Employee Management** - Staff operations & performance tracking
- 🪑 **Table Management** - Table setup, types & occupancy stats
- 📋 **Order Management** - Complete order lifecycle tracking
- 🔔 **Notifications Center** - Smart alert categorization
- ⚙️ **Branch Settings** - Configuration & preferences

---

## 🚀 Quick Start

```bash
# Clone repository
git clone https://github.com/LuongMarus/SmartDine_Marus_Feature.git

# Frontend Setup
cd SmartDine_Marus_Feature/fontend/smart_dine
flutter pub get
flutter run

# Backend Setup  
cd SmartDine_Marus_Feature/backend/backend/SmartDine_Backend
./mvnw spring-boot:run
```

---

## 📱 Branch Management Screens (12 Total)

### 🎯 Main Screens (5)
1. **Branch Dashboard** - Real-time metrics & quick actions
2. **Employee Management** - Staff CRUD operations 
3. **Table Management** - Table setup & type management
4. **Branch Reports** - Date-filtered analytics
5. **Settings** - Branch configuration

### 📋 Supporting Screens (7)  
6. **Order List** - Branch order tracking
7. **Order Detail** - Individual order management
8. **Today Activities** - Daily operations summary
9. **Branch Performance** - Employee & hourly analytics
10. **Notifications** - Alert management center
11. **Table Type Management** - Table category setup
12. **Branch Statistics** - Comprehensive reporting

---

## 🛠️ Technical Implementation

### Frontend (Flutter)
- **State Management**: Riverpod providers
- **Charts**: fl_chart for interactive analytics  
- **UI**: Material Design with dark/light themes
- **Navigation**: Named routes with parameter passing
- **Data**: Real-time updates with proper error handling

### Backend (Spring Boot)
- **Controllers**: 5 main controllers with 15+ endpoints
- **Services**: Business logic with validation
- **Models**: JPA entities with relationships
- **Database**: PostgreSQL with optimized queries
- **Security**: Input validation & error handling

### Key APIs Developed
```
GET /api/orders/statistics/branch/{branchId}?date=YYYY-MM-DD
GET /api/employees/branch/{branchId}
GET /api/table-management/branch/{branchId}  
DELETE /api/table-management/{id} (with validation)
GET /api/orders/branch/{branchId}
```

---

## 🎨 Feature Highlights

### 📊 Interactive Analytics
- **Date Filtering**: Custom date picker with backend integration
- **Real-time Charts**: Revenue, orders, customer metrics
- **Dynamic Updates**: Auto-refresh every 2 minutes
- **Error Handling**: Graceful fallbacks & user feedback

### 🪑 Smart Table Management
- **Validation Logic**: Prevents deleting occupied tables
- **Error Messages**: "Cannot delete table with active orders"
- **Real-time Status**: Table occupancy indicators
- **Type Management**: Categorized table setup

### 📈 Advanced Reporting
- **Date Range Filtering**: Historical data analysis
- **Growth Calculations**: Period-over-period comparisons  
- **Export Ready**: Data formatted for reports
- **Performance Metrics**: Employee rankings & analytics

---

## 🔧 Recent Fixes & Improvements

### ✅ Date Filtering Fix
- **Problem**: Branch reports showed only current date data
- **Solution**: Added optional `date` parameter to backend API
- **Impact**: Proper historical data filtering now works

### ✅ Table Deletion Validation  
- **Problem**: Tables could be deleted while customers seated
- **Solution**: Backend validation checks active orders
- **Impact**: Error message: "Cannot delete table with active orders"

---

## 📊 API Endpoints Summary

| Endpoint | Method | Purpose | Status |
|----------|--------|---------|---------|
| `/api/orders/statistics/branch/{id}` | GET | Branch analytics | ✅ Enhanced |
| `/api/table-management/{id}` | DELETE | Delete table | ✅ Validated |
| `/api/employees/branch/{id}` | GET | Staff list | ✅ Working |
| `/api/orders/branch/{id}` | GET | Branch orders | ✅ Working |
| `/api/notifications/branch/{id}` | GET | Branch alerts | ✅ Working |

---

## 📁 File Structure

```
SmartDine_Marus_Feature/
├── fontend/smart_dine/lib/
│   ├── features/branch_management/
│   │   └── screens/ (12 screens)
│   ├── API/ (5 API files)
│   ├── providers/ (Riverpod state management)
│   └── models/ (Data models)
└── backend/backend/SmartDine_Backend/
    ├── controllers/ (5 controllers)
    ├── services/ (Business logic)
    ├── models/ (JPA entities)
    └── repositories/ (Data access)
```

---

## 🎯 Development Focus

**My Role**: Full-stack development of Branch Management module
- ✅ **12 Flutter screens** with responsive UI
- ✅ **Backend APIs** with proper validation  
- ✅ **State management** using Riverpod
- ✅ **Error handling** & user feedback
- ✅ **Date filtering** & validation logic
- ✅ **Real-time updates** & performance optimization

---

## 📝 Documentation

- 📖 [Branch Management Technical Summary](BRANCH_MANAGEMENT_SUMMARY.md)
- 🔄 [Changelog](CHANGELOG.md)

---

## 🤝 Project Context

**Main Repository**: [SmartDine_Fontend](https://github.com/phuckk05/SmartDine_Fontend)  
**Team Project**: Restaurant Management System  
**My Contribution**: Branch Management Module (12 screens + APIs)

---

## 📞 Connect

- **GitHub**: [@LuongMarus](https://github.com/LuongMarus)  
- **Issues**: [Report bugs or suggestions](https://github.com/LuongMarus/SmartDine_Marus_Feature/issues)

---

## 📄 License

MIT License - See [LICENSE](LICENSE) for details

---

<div align="center">

### ⭐ Star this repo if you find the Branch Management module useful!

**Made with ❤️ by Hà Đức Lương**

*Specialized in Flutter development & restaurant management solutions*

</div>

Bảo mật hệ thống:
Sử dụng JWT Authentication, xác thực bằng token và phân quyền chi tiết theo từng người dùng.
  
# IV. Tổng kết

SmartServe RMS là hệ thống quản lý nhà hàng toàn diện, được thiết kế với:

Ứng dụng di động Flutter cho trải nghiệm người dùng mượt mà, thao tác nhanh.

Backend Spring Boot mạnh mẽ, bảo mật, dễ mở rộng.

Cơ sở dữ liệu Supabase (PostgreSQL) linh hoạt và đáng tin cậy.

Hạ tầng triển khai Render Cloud giúp mở rộng dễ dàng.

Hệ thống hướng đến mục tiêu số hóa quy trình vận hành nhà hàng, giúp quản lý hiệu quả, tiết kiệm chi phí và nâng cao trải nghiệm phục vụ khách hàng.
