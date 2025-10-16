# SmartDine Backend

Spring Boot backend API for the SmartDine Restaurant Management System.

## Getting Started

### Build the Project
```bash
mvn clean install
```

### Run the Application
```bash
mvn spring-boot:run
```

The API will be available at: `http://localhost:8080`

### Access H2 Console
URL: `http://localhost:8080/h2-console`
- JDBC URL: `jdbc:h2:mem:smartdine`
- Username: `sa`
- Password: (leave empty)

### Run Tests
```bash
mvn test
```

### Build JAR
```bash
mvn clean package
java -jar target/smartdine-backend-1.0.0.jar
```

## API Endpoints

See [API Documentation](../docs/API_DOCUMENTATION.md) for complete API reference.

## Configuration

Edit `src/main/resources/application.properties` to configure:
- Server port
- Database connection
- JPA settings
- Logging levels

## Project Structure
```
src/main/java/com/smartdine/
├── controller/    # REST controllers
├── model/         # JPA entities
├── repository/    # Data repositories
├── service/       # Business logic
├── dto/           # Data transfer objects
└── config/        # Configuration classes
```
