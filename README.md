# Relational Database–Driven Library Management System

This project is a command-line interface (CLI) tool for managing a library system. It includes functionality for handling book transactions, generating reports, sending renewal reminders, and interacting with the library's database.

## Project Structure

- `create_table.sql`: Creates all necessary database tables.
- `insert.sql`: Populates the tables with initial data.
- `main.py`: Implements the CLI interface for library operations.

## Features

### Main Menu Options (in `main.py`)

1. **Transaction Management**
   - `Add Member`: Adds a new member to the database.
   - `Add Book`: Adds a new book to the library.
   - `Borrow a Book`: Records the borrowing transaction.
   - `Return a Book`: Records the return of a borrowed book.
   - `Renew Membership`: Renews an existing member's subscription.

2. **Reports**
   - `All Reports`: Displays all transaction data grouped by week.
   - `Yearly Reports`: Displays data grouped by week for a specific year.

3. **Renewal Reminders**
   - Checks for memberships due to expire within the next month and sends reminders.

4. **Library Database Viewer**
   - Displays the names of all tables.
   - Allows the user to select a table to view its full data.

## Additional Components

- **Triggers**:
  - Automated reminders for renewal and overdue books.
- **Spool Files**:
  - `ALLDATA`: Contains output of all `SELECT` queries.
  - `weekreport`: Contains weekly grouped report queries.
- **Extra Data**:
  - Includes supplementary data used by the database tables.
