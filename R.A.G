#!/usr/bin/python3
"""RAG is a menu list of 10 interesting books that can support individuals in their journey of personal growth.
The users can view the books list,select a book, mark them as read or unread, request book recommendation, and search for a book using keywords.
"""


import random

class Book:
    def __init__(self, id, title, description):
<<<<<<< HEAD

      self.title = title

      self.description = description

      self.read = False

      self.id = id
=======
        self.title = title
        self.description = description
        self.read = False
        self.id = id
>>>>>>> 4eb324250b3cf668378e2a5cdec79a5b2ef126a5

    def mark_as_read(self):
        self.read = True

    def mark_as_unread(self):
        self.read = False


class User:
    def __init__(self, username):
<<<<<<< HEAD

        self.username = username

=======
        self.username = username
>>>>>>> 4eb324250b3cf668378e2a5cdec79a5b2ef126a5
        self.books_record = []

    def add_to_record(self, book):
        self.books_record.append(book)

    def view_record(self):
        if not self.books_record:
            print("\nNo books in your record.\n")
        else:
            print(f"\n{self.username}'s Book Record:")
            for book in self.books_record:
                status = "✓" if book.read else "x"
                print(f"{status} {book.title} - {book.description}")

    def mark_book_status(self, book_title, status):
        for book in self.books_record:
            if book.title.lower() == book_title.lower():
                if status == "read":
                    book.mark_as_read()
                elif status == "unread":
                    book.mark_as_unread()
                print(f"{book.title} marked as {'read' if status == 'read' else 'unread'}.")
                return
        print("\nBook not found in your record.\n")


class RAG:
    def __init__(self):
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
        user_input = input(input_message + "\n")
        while user_input not in choices:
            user_input = input(f"⚠️ Invalid response ⚠️ \n{input_message}\n")
        return user_input

    def new_tab(self):
        print("\n\n" + "".ljust(35, "_") + "\nR.A.G (Read & Grow)".ljust(30, "*") + "\n")

    def view_books(self):
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
            selected_book = self.books[current_book]
            self.user.add_to_record(selected_book)
            print(f"{selected_book.title} added to your record.")
<<<<<<< HEAD
 
    def main_menu(self):
    while True:
        self.new_tab()
        self.display_intro()
        print("\nMain Menu:")
        print("1. What is our project? & How does it work?")
        print("2. View the books list")
        print("3. Exit")
        print("4. Random recommendation")
        print("5. View my record")
        print("6. Keyword Search")
                choice = input("Choose an option: ")
        if choice == '1':
            self.display_intro()
        elif choice == '2':
            self.view_books()
        elif choice == '3':
            print("Thank you for using R.A.G (Read & Grow)!")
            break
=======

    def main_menu(self):
        while True:
            self.new_tab()
            self.display_intro()
            print("\nMain Menu:")
            print("1. What is our project? & How does it work?")
            print("2. View the books list")
            print("3. Exit")
            print("4. Random recommendation")
            print("5. View my record")
            print("6. Keyword Search")
            choice = input("Choose an option: ")
            if choice == '1':
                self.display_intro()
            elif choice == '2':
                self.view_books()
            elif choice == '3':
                print("Thank you for using R.A.G (Read & Grow)!")
                break

>>>>>>> 4eb324250b3cf668378e2a5cdec79a5b2ef126a5

if __name__ == "__main__":
    app = RAG()
    app.main_menu()
