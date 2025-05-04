# return_book.py
from db import transact
from datetime import datetime, date

def _do_return(cursor, borrow_id, return_date_str):
    # 1) Fetch the outstanding borrowing record + book details
    cursor.execute("""
        SELECT 
          b.CopyID,
          b.BorrowDate,
          b.MemberID,
          bc.ISBN,
          bk.Title
        FROM Borrowing b
        JOIN BookCopy bc ON b.CopyID = bc.CopyID
        JOIN Book     bk ON bc.ISBN  = bk.ISBN
        WHERE b.BorrowID   = :1
          AND b.ReturnDate IS NULL
    """, (borrow_id,))
    row = cursor.fetchone()
    if not row:
        raise Exception(f"BorrowID {borrow_id} not found or already returned.")
    copy_id, borrow_dt, member_id, isbn, title = row

    # 2) Update the ReturnDate on the borrowing record
    cursor.execute("""
        UPDATE Borrowing
           SET ReturnDate = TO_DATE(:1,'YYYY-MM-DD')
         WHERE BorrowID  = :2
    """, (return_date_str, borrow_id))

    # 3) Mark the copy back to available
    cursor.execute("""
        UPDATE BookCopy
           SET Status = 'Available'
         WHERE CopyID = :1
    """, (copy_id,))

    return copy_id, borrow_dt, member_id, isbn, title

def return_book():
    """
    Prompts for BorrowID, updates Borrowing and BookCopy, then prints a receipt.
    """
    print("=== Return a Book ===")
    borrow_id   = int(input("Borrow ID: "))
    return_date = date.today().isoformat()

    try:
        copy_id, borrow_dt, member_id, isbn, title = transact(
            _do_return,
            borrow_id,
            return_date
        )
        # compute days borrowed
        bd   = borrow_dt.date() if hasattr(borrow_dt, "date") else borrow_dt
        days = (date.fromisoformat(return_date) - bd).days

        # print receipt
        print("\n--- Return Receipt ---")
        print(f"Borrow ID   : {borrow_id}")
        print(f"Member ID   : {member_id}")
        print(f"Copy ID     : {copy_id}")
        print(f"ISBN        : {isbn}")
        print(f"Title       : {title}")
        print(f"Borrow Date : {bd}")
        print(f"Return Date : {return_date}")
        print(f"Days Out    : {days}")
        print("-----------------------\n")

    except Exception as e:
        print("✘ Failed to process return:", e)
