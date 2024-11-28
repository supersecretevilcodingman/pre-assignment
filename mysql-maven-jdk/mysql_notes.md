
- [What is MySQL?](#what-is-mysql)
  - [Key Features](#key-features)
  - [MySQL Architecture](#mysql-architecture)
  - [Common MySQL Commands (Use Powershell)](#common-mysql-commands-use-powershell)
    - [Connecting to MySQL](#connecting-to-mysql)
    - [Database Operations](#database-operations)
    - [Table Operations](#table-operations)
    - [Data Operations](#data-operations)
  - [Advanced Topics](#advanced-topics)
    - [Indexing](#indexing)
    - [Transactions](#transactions)
    - [Joins](#joins)
  - [MySQL Best Practices](#mysql-best-practices)
  - [Resources](#resources)

# What is MySQL?
MySQL is an open-source relational database management system (RDBMS) that uses Structured Query Language (SQL) to interact with databases. It is widely used for web applications, data storage, and processing.

## Key Features
- **Relational Database**: Organises data in tables with rows and columns.
- **Scalability**: Supports small to enterprise-scale applications.
- **High Performance**: Optimised for read-heavy operations.
- **Open Source**: Freely available with commercial support options.
- **Cross-Platform**: Compatible with various operating systems, including Linux, Windows, and macOS.

## MySQL Architecture
1. **Client Layer**: Interfaces through MySQL Client or APIs like PHP, Python, or Java.
2. **Server Layer**: The core MySQL server processes queries and manages database operations.
3. **Storage Layer**: Stores data in storage engines such as:
   - **InnoDB**: Default engine, supports transactions and foreign keys.
   - **MyISAM**: Older engine, suitable for read-heavy workloads.

## Common MySQL Commands (Use Powershell)

### Connecting to MySQL
```bash
mysql -u username -p
```
- Replace `username` with your MySQL username.
- Enter the password when prompted.

### Database Operations
- **Create a database**:
  ```sql
  CREATE DATABASE database_name;
  ```
- **Show all databases**:
  ```sql
  SHOW DATABASES;
  ```
- **Use a database**:
  ```sql
  USE database_name;
  ```
- **Drop a database**:
  ```sql
  DROP DATABASE database_name;
  ```

### Table Operations
- **Create a table**:
  ```sql
  CREATE TABLE table_name (
      column_name1 datatype constraints,
      column_name2 datatype constraints
  );
  ```
- **Show all tables**:
  ```sql
  SHOW TABLES;
  ```
- **Describe a table structure**:
  ```sql
  DESCRIBE table_name;
  ```
- **Drop a table**:
  ```sql
  DROP TABLE table_name;
  ```

### Data Operations
- **Insert data**:
  ```sql
  INSERT INTO table_name (column1, column2) VALUES (value1, value2);
  ```
- **Select data**:
  ```sql
  SELECT column1, column2 FROM table_name WHERE condition;
  ```
- **Update data**:
  ```sql
  UPDATE table_name SET column1 = value1 WHERE condition;
  ```
- **Delete data**:
  ```sql
  DELETE FROM table_name WHERE condition;
  ```

## Advanced Topics

### Indexing
- Speeds up data retrieval.
- Create an index:
  ```sql
  CREATE INDEX index_name ON table_name(column_name);
  ```

### Transactions
- Ensures atomicity, consistency, isolation, and durability (ACID).
- Commands:
  ```sql
  START TRANSACTION;
  -- SQL commands here
  COMMIT; -- Save changes
  ROLLBACK; -- Undo changes
  ```

### Joins
- Combines rows from multiple tables.
- **Inner Join**:
  ```sql
  SELECT * FROM table1 INNER JOIN table2 ON table1.column = table2.column;
  ```
- **Left Join**:
  ```sql
  SELECT * FROM table1 LEFT JOIN table2 ON table1.column = table2.column;
  ```
- **Right Join**:
  ```sql
  SELECT * FROM table1 RIGHT JOIN table2 ON table1.column = table2.column;
  ```

## MySQL Best Practices
1. Use normalisation to avoid data redundancy.
2. Back up databases regularly.
3. Avoid using `SELECT *` in queries; specify columns explicitly.
4. Use indexing wisely; too many indexes can slow down write operations.
5. Optimise queries using `EXPLAIN` to analyse performance.

## Resources
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [MySQL Workbench](https://dev.mysql.com/workbench/) – A graphical tool for database design and administration.