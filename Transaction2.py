#!/usr/bin/env python3
# add_book.py

from db import transact
from datetime import date

def _do_add_book(cursor,
                 isbn: int,
                 description: str,
                 title: str,
                 author: str,
                 subject_area: str,
                 is_lendable: str,
                 binding: str,
                 language: str,
                 edition: str,
                 num_copies: int):
    # 1) Insert into Book (parent)
    cursor.execute("""
      INSERT INTO Book
        (ISBN,
         Title,
         Author,
         SubjectArea,
         IsLendable,
         Binding,
         Language,
         Edition)
      VALUES
        (:1, :2, :3, :4, :5, :6, :7, :8)
    """, (
        isbn,
        title,
        author,
        subject_area,
        is_lendable,
        binding,
        language,
        edition
    ))

    # 2) Insert into Catalog (child) using the same numeric ISBN as CatalogID
    cursor.execute("""
      INSERT INTO Catalog
        (CatalogID,
         ISBN,
         Description)
      VALUES
        (:1, :2, :3)
    """, (
        isbn,        # CatalogID
        isbn,        # ISBN FK → Book.ISBN
        description
    ))

    # 3) Insert requested number of physical copies
    acq_date = date.today().isoformat()
    for _ in range(num_copies):
        cursor.execute("""
          INSERT INTO BookCopy
            (CopyID,
             ISBN,
             AcquisitionDate,
             Status)
          VALUES
            (BOOKCOPY_SEQ.NEXTVAL,
             :1,
             TO_DATE(:2,'YYYY-MM-DD'),
             'Available')
        """, (isbn, acq_date))

    print(f"✔ Added Book {isbn}, CatalogID={isbn}, with {num_copies} copies.")

def add_book():
    """CLI entrypoint for adding a new book + catalog + copies."""
    print("=== Add New Book ===")
    raw = input("ISBN (numeric): ").strip()
    if not raw.isdigit():
        print("✘ ISBN must be a number.")
        return
    isbn = int(raw)

    description  = input("Catalog Description: ").strip()
    title        = input("Title: ").strip()
    author       = input("Author: ").strip()
    subject_area = input("Subject Area: ").strip()
    is_lendable  = input("Is Lendable (Y/N): ").strip().upper()
    binding      = input("Binding (Hardcover/Paperback): ").strip()
    language     = input("Language: ").strip()
    edition      = input("Edition: ").strip()
    try:
        num_copies = int(input("Number of Copies: ").strip())
    except ValueError:
        print("✘ Number of Copies must be an integer.")
        return

    try:
        transact(
            _do_add_book,
            isbn,
            description,
            title,
            author,
            subject_area,
            is_lendable,
            binding,
            language,
            edition,
            num_copies
        )
    except Exception as e:
        print("✘ Failed to add book:", e)


if __name__ == "__main__":
    add_book()
