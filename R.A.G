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


