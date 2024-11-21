#!/usr/bin/python3
"""RAG is a menu list of 10 interesting books that can support individuals in their journey of personal growth.
"""

import random

class Book:

def __init__(self, id, title, description):

self.title = title

self.description description

self.read = False

self.id = id

def mark_as_read(self):

self.read = True

def mark_as_unread (self):

self.read = False

class User:

def __init__(self, username):

self.username username

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
