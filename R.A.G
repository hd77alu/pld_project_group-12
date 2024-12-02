#!/usr/bin/python3
"""RAG is a menu list of 10 interesting books that can supportindividuals in their journey of personal growth.
The user can display the book list, select a book, mark them as read or unread, request book recommendation, and search using keywords.
"""

# Class to represent a Book
import random

class Book:
    def __init__(self, id, title, description):
        # Initialize book with ID, title, description, and read status
        self.title = title
        self.description = description
        self.read = False  # Books are unread by default
        self.id = id

    def mark_as_read(self):
        # Mark the book as read
        self.read = True

    def mark_as_unread(self):
        # Mark the book as unread
        self.read = False

# Class to represent a User
class User:
    def __init__(self, username):
        # Initialize the user with a username and an empty books record
        self.username = username
        self.books_record = []

    def add_to_record(self, book):
        # Add a book to the user's reading record
        self.books_record.append(book)

    def view_record(self):
        # View the user's book record
        if not self.books_record:
            print("\nNo books in your record.\n")
        else:
            print(f"\n{self.username}'s Book Record:")
            # Print each book's title and description, along with its read/unread status
            for book in self.books_record:
                status = "✓" if book.read else "x"
                print(f"{status} {book.title} - {book.description}")

    def mark_book_status(self, book_title, status):
        # Mark a specific book as read or unread based on its title
        for book in self.books_record:
            if book.title.lower() == book_title.lower():
                if status == "read":
                    book.mark_as_read()
                elif status == "unread":
                    book.mark_as_unread()
                print(f"{book.title} marked as {'read' if status == 'read' else 'unread'}.")
                return
        print("\nBook not found in your record.\n")


# Main class for the R.A.G (Read & Grow) application
class RAG:
    def __init__(self):
        # A list of books in the R.A.G system
        self.books = [
            Book(1, "Rich Dad, Poor Dad", "A book by Robert T. Kiyosaki on financial literacy and investing."),
            Book(2, "80/20 Principle", "A book by Richard Koch on maximizing productivity by focusing on vital tasks."),
            Book(3, "Atomic Habits", "A book by James Clear on building effective habits."),
            Book(4, "Grit: The Power of Passion and Perseverance",
                 "A book by Angela Duckworth about resilience and determination."),
            Book(5, "The Power of Now",
                 "A guide by Eckhart Tolle on achieving spiritual enlightenment by living in the present."),
            Book(6, "Mindset: The New Psychology of Success",
                 "A book by Carol S. Dweck on how mindset shapes success."),
            Book(7, "The 7 Habits of Highly Effective People",
                 "Stephen R. Covey's guide on building personal and professional effectiveness."),
            Book(8, "The Four Agreements", "A practical guide by Don Miguel Ruiz on achieving personal freedom."),
            Book(9, "How to Win Friends and Influence People",
                 "A classic by Dale Carnegie on improving social and communication skills."),
            Book(10, "48 Laws of Power", "A book by Robert Greene on mastering power and influence.")
        ]

        self.user = None

    def display_intro(self):
        # Display introductory information about the project
        print(str("Welcome to the R.A.G").center(30, "*"))
        print("This app helps you find books, track your reading progress, and get random recommendations.")
        print("\nProblem Statement:")
        print(
            "In today's fast-paced age, despite the wealth of knowledge available, many people struggle to find books "
            "and materials that help them in their personal development journey. This dispersion while searching for "
            "self-development books can hinder personal growth and the integration of technology in education.")
        print("\nAbout Our Project - R.A.G:")
        print(
            "R.A.G stands for Read and Grow. Our mission is to integrate technology into education and support personal growth.")
        print(
            "This project aims to empower individuals in their personal development journey by providing a curated list "
            "of books focused on personal growth and development.")

    def trychoice_input_loop(self, choices, input_message):
        # Helper function to ensure user input is valid
        user_input = input(input_message + "\n")
        while user_input not in choices:
            user_input = input(f"⚠️ Invalid response ⚠️ \n{input_message}\n")
        return user_input

    def new_tab(self):
        # Print a separator to simulate a new tab for better user experience
        print("")
        print("")
        print("".ljust(35, "_"))
        print("R.A.G (Read & Grow)".ljust(30, "*"))
        print("")

    def view_books(self):
        # Display the list of books and handle user interaction
        self.new_tab()
        print("\nBooks List:")
        validchoices = ""
        for idx, book in enumerate(self.books, 1):
            print(f"{book.id}. {book.title} ")
            validchoices += f"{book.id}"
        input_number = self.trychoice_input_loop(validchoices, "Please choose the book:")
        self.new_tab()
        for idx, book in enumerate(self.books, 1):
            if book.id == int(input_number):
                print(f"Book Name: {book.title}\n")
                print(f"Book description: \n {book.description}")
                current_book = idx - 1
        if self.user:
            input_number = self.trychoice_input_loop("123", "Please choose: \n1. Back \n2. Exit \n3. Add to records \nChoose an option:")
        else:
            input_number = self.trychoice_input_loop("12", "Please choose: \n1. Back \n2. Exit \nChoose an option:")
        if input_number == "2":
            exit()
        elif self.user and input_number == "3":
            try:
                selected_book = self.books[current_book]
                self.user.add_to_record(selected_book)
                print(f"{selected_book.title} added to your record.")
            except (ValueError, IndexError):
                print("Invalid selection.")
            input_number = self.trychoice_input_loop("1", "Please choose: \n1. To go back \nChoose an option:")

    def random_recommendation(self):
        # Provide a random book recommendation
        self.new_tab()
        book = random.choice(self.books)
        print("\nRandom Book Recommendation:\n")
        print(f"{book.title} - {book.description}")
        input_number = self.trychoice_input_loop("12", "Please choose: \n1. Back \n2. Exit\nChoose an option:")
        if input_number == "2":
            exit()

    def sign_in(self, username):
        # Sign in the user and create a record for them
        self.new_tab()
        self.user = User(username)
        print(f"\nWelcome, {username}! You can now add books to your record and track your reading progress.")

    def search_books(self, query):
        # Search for books based on a keyword query
        self.new_tab()
        stop_words = {"i", "and", "or", "the", "a", "an", "of", "in", "to", "with", "book"}
        keywords = [word for word in query.lower().split() if word not in stop_words]
        results = []
        for idx, book in enumerate(self.books, 1):
            if any(keyword in book.title.lower() or keyword in book.description.lower() for keyword in keywords):
                results.append(book)
        if results:
            print("\nSearch Results:")
            for book in results:
                print("")
                print(f"{book.title} - {book.description}")
                print("")
        else:
            print("")
            print("No books found matching that description.")
            print("")
        input_number = self.trychoice_input_loop("12", "Please choose: \n1. Back \n2. Exit\nChoose an option:")
        if input_number == "2":
            exit()

    def main_menu(self):
        # Main menu where users can choose actions
        while True:
            self.new_tab()
            print("\nMain Menu:")
            print("1. What is our project? & How does it work?")
            print("2. View the books list")
            print("3. Exit")
            print("4. Random recommendation")
            print("5. View my record")
            print("6. Keyword Search")
            choice = input("Choose an option: ")
            if choice == '1':
                self.new_tab()  # Open a new tab for the project info
                self.display_intro()  # Show the project details
                input_number = self.trychoice_input_loop("12", "Please choose \n1. Back\n2. Exit\nChoose an option:")
                if input_number == "1":
                    continue
                elif input_number == "2":
                    print("Thank you for using R.A.G (Read & Grow)!")
                    exit()
            elif choice == '2':
                self.view_books()
            elif choice == '3':
                print("Thank you for using R.A.G (Read & Grow)!")
                break
            elif choice == '4':
                self.random_recommendation()
            elif choice == '5':
                while self.user == None:
                    self.new_tab()
                    print("Please sign in to use this feature.")
                    username = input("Enter a username to sign in: ")
                    self.sign_in(username)  # Signing in process
                self.user.view_record()     # View the user's record of books
                if self.user.books_record:
                    self.new_tab()
                    mark_choice = self.trychoice_input_loop("12", "Would you like to mark a book as read/unread? \n1. yes \n2. no): ")
                    if mark_choice == "1":
                        book_title = input("Enter the book title: ")
                        status_input = self.trychoice_input_loop("12", "Mark as read or unread? \n 1. Read \n 2. Unread: ")
                        status = "read" if status_input == "1" else "unread"
                        self.user.mark_book_status(book_title, status)
            elif choice == '6':
                # Prompt user to enter a keyword to search for books
                query = input("Enter a keyword to search for books: ")
                # Call the method to perform the search
                self.search_books(query)

# Main entry point of the program
if __name__ == "__main__":
    rag = RAG()
    rag.main_menu()
