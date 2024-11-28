- [What is Maven?](#what-is-maven)
  - [Key Features](#key-features)
  - [Maven Core Concepts](#maven-core-concepts)
    - [Project Object Model (POM)](#project-object-model-pom)
    - [Repository](#repository)
  - [Maven Commands](#maven-commands)
    - [Basic Commands](#basic-commands)
    - [Lifecycle Phases](#lifecycle-phases)
  - [Dependency Management](#dependency-management)
    - [Adding Dependencies](#adding-dependencies)
    - [Managing Dependency Scope](#managing-dependency-scope)
  - [Maven Plugins](#maven-plugins)
  - [Maven Best Practices](#maven-best-practices)
  - [Resources](#resources)

# What is Maven?
Maven is a powerful build automation and project management tool primarily used for Java-based projects. It simplifies the build process, dependency management, and project configuration through its declarative XML configuration file (`pom.xml`).

## Key Features
- **Dependency Management**: Automatically downloads and resolves dependencies.
- **Standard Directory Layout**: Enforces a standard project structure.
- **Build Automation**: Compiles, tests, and packages applications seamlessly.
- **Plugins**: Extensible through a wide range of plugins for additional functionality.
- **Project Documentation**: Generates project documentation and reports.

## Maven Core Concepts

### Project Object Model (POM)
- A configuration file named `pom.xml` that defines the project and its dependencies, plugins, and configurations.
- Key sections in a `pom.xml`:
  - `<modelVersion>`: Specifies the POM model version.
  - `<groupId>`: Represents the project’s unique namespace (e.g., `com.example`).
  - `<artifactId>`: The project's name (e.g., `my-app`).
  - `<version>`: Version of the project (e.g., `1.0-SNAPSHOT`).
  - `<dependencies>`: Lists all external libraries required by the project.

### Repository
- Maven downloads dependencies from repositories:
  - **Local Repository**: Stored on your machine, typically in `~/.m2/repository`.
  - **Remote Repository**: Online repositories like Maven Central (`https://repo.maven.apache.org/maven2`).

## Maven Commands

### Basic Commands
- **Compile the project**:
  ```bash
  mvn compile
  ```
- **Run tests**:
  ```bash
  mvn test
  ```
- **Package the project**:
  ```bash
  mvn package
  ```
  - Generates a JAR or WAR file in the `target/` directory.
- **Install to local repository**:
  ```bash
  mvn install
  ```
- **Clean build files**:
  ```bash
  mvn clean
  ```
  - Removes files from the `target/` directory.
- **Execute a Maven goal**:
  ```bash
  mvn <goal>
  ```

### Lifecycle Phases
Maven defines a build lifecycle with specific phases:
1. **Validate**: Validates the project is correct and all required information is available.
2. **Compile**: Compiles the source code.
3. **Test**: Runs unit tests using frameworks like JUnit or TestNG.
4. **Package**: Packages the compiled code into a distributable format (JAR, WAR, etc.).
5. **Verify**: Runs checks to verify the integrity of the package.
6. **Install**: Installs the package to the local repository.
7. **Deploy**: Copies the package to a remote repository for sharing.

## Dependency Management

### Adding Dependencies
Dependencies are defined in the `pom.xml` file under the `<dependencies>` section:
```xml
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-lang3</artifactId>
    <version>3.12.0</version>
</dependency>
```

### Managing Dependency Scope
Maven supports different dependency scopes:
- **Compile**: Default scope, required for compilation and runtime.
- **Provided**: Available during compilation but not included in the package (e.g., servlet APIs).
- **Runtime**: Required only during runtime.
- **Test**: Available only during testing.

## Maven Plugins
Plugins add functionality to Maven. Examples:
- **Compiler Plugin**: Compiles Java source code.
  ```xml
  <build>
      <plugins>
          <plugin>
              <groupId>org.apache.maven.plugins</groupId>
              <artifactId>maven-compiler-plugin</artifactId>
              <version>3.8.1</version>
              <configuration>
                  <source>11</source>
                  <target>11</target>
              </configuration>
          </plugin>
      </plugins>
  </build>
  ```
- **Surefire Plugin**: Executes unit tests.
- **Assembly Plugin**: Packages the project into a specific format (e.g., a ZIP).

## Maven Best Practices
1. Use a standard directory structure:
   ```
   src/
       main/
           java/
           resources/
       test/
           java/
           resources/
   ```
2. Define dependencies with specific versions to ensure consistency.
3. Avoid storing unnecessary JARs in the version control system.
4. Use profiles in `pom.xml` to manage environment-specific configurations (e.g., for dev, test, and prod environments).
5. Regularly update dependencies and plugins to stay secure and compatible.

## Resources
- [Maven Documentation](https://maven.apache.org/guides/index.html)
- [Maven Central Repository](https://search.maven.org/)
- [Maven in 5 Minutes](https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html)