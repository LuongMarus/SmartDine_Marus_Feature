# Contributing to SmartDine

Thank you for your interest in contributing to the SmartDine Restaurant Management System!

## Development Setup

### Prerequisites
- Flutter SDK 3.0+
- Java JDK 17+
- Maven 3.6+
- Git
- IDE (VS Code, IntelliJ IDEA, or Android Studio)

### Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/LuongMarus/SmartDine_Marus_Feature.git
   cd SmartDine_Marus_Feature
   ```

2. **Backend Setup**
   ```bash
   cd backend
   mvn clean install
   mvn spring-boot:run
   ```

3. **Frontend Setup**
   ```bash
   cd frontend
   flutter pub get
   flutter run
   ```

## Project Structure

```
SmartDine_Marus_Feature/
├── frontend/          # Flutter application
├── backend/           # Spring Boot API
├── docs/             # Documentation
└── README.md         # Project overview
```

## Code Style

### Flutter/Dart
- Follow [Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use `flutter analyze` before committing
- Prefer const constructors where possible
- Use meaningful variable and function names

### Java/Spring Boot
- Follow [Google Java Style Guide](https://google.github.io/styleguide/javaguide.html)
- Use Lombok for reducing boilerplate
- Document complex methods with JavaDoc
- Follow RESTful API conventions

## Branching Strategy

- `main` - Production-ready code
- `develop` - Development branch
- `feature/*` - New features
- `bugfix/*` - Bug fixes
- `hotfix/*` - Urgent production fixes

## Commit Messages

Use conventional commit format:
```
type(scope): description

[optional body]
[optional footer]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Test additions or changes
- `chore`: Build or tooling changes

Examples:
```
feat(orders): add order cancellation feature
fix(analytics): correct revenue calculation
docs(api): update endpoint documentation
```

## Pull Request Process

1. Create a feature branch from `develop`
2. Make your changes
3. Write/update tests
4. Update documentation
5. Run linters and tests
6. Submit pull request to `develop`
7. Request review from maintainers

### PR Checklist
- [ ] Code follows style guidelines
- [ ] Tests added/updated
- [ ] Documentation updated
- [ ] Commits follow convention
- [ ] No breaking changes (or documented)
- [ ] Builds successfully
- [ ] All tests pass

## Testing

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

## Adding New Features

### Backend Feature
1. Create model/entity in `model/`
2. Add repository in `repository/`
3. Implement service in `service/`
4. Create controller in `controller/`
5. Add tests
6. Update API documentation

### Frontend Feature
1. Create model in `lib/models/`
2. Add service in `lib/services/`
3. Create provider in `lib/providers/`
4. Build screen in `lib/screens/`
5. Add widgets in `lib/widgets/`
6. Update navigation
7. Add tests

## Documentation

- Update README.md for major changes
- Keep API_DOCUMENTATION.md current
- Add inline comments for complex logic
- Update CHANGELOG.md

## Questions?

Open an issue for:
- Bug reports
- Feature requests
- Documentation improvements
- General questions

## License

By contributing, you agree that your contributions will be licensed under the Apache License 2.0.
