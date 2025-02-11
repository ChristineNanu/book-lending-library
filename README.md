# Book Lending Library

A simple book lending library application built with **Ruby on Rails 8**. This application allows users to manage books, borrow and return them, and includes authentication features.

## Features
- User authentication (Devise)
- CRUD operations for books
- Borrowing and returning books
- User roles (Admin & Regular User)
- Test coverage with RSpec & Capybara

## Prerequisites
Make sure you have the following installed on your system:
- Ruby 3.x
- Rails 8
- PostgreSQL
- Bundler
- Git

## Installation

1. **Clone the repository**
   ```sh
   git clone https://github.com/ChristineNanu/book-lending-library.git
   cd book-lending-library
   ```

2. **Install dependencies**
   ```sh
   bundle install
   ```

3. **Set up the database**
   ```sh
   rails db:create db:migrate db:seed
   ```

4. **Start the server**
   ```sh
   rails server
   ```
   The application will be accessible at `http://localhost:3000/`

## Usage

1. **Register/Login** to access the application.
2. **Browse books** and check their availability.
3. **Borrow a book** (if available).
4. **Return a borrowed book** to make it available for others.
5. **Admin users** can add, edit, or delete books.

## Running Tests
To run the test suite, execute:
```sh
rspec
```
Ensure all tests pass before making changes.

## Deployment
To deploy the application:
```sh
# Precompile assets
rails assets:precompile

# Run database migrations
rails db:migrate
```
Host on a cloud provider such as Render, Heroku, or AWS.

## Contributing
1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a Pull Request.

## License
This project is licensed under the MIT License.



