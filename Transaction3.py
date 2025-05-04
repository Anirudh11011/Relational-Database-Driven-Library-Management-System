# borrowing.py
from db import transact
from datetime import datetime, date, timedelta
import calendar

def add_months(orig_date: date, months: int) -> date:
    m = orig_date.month - 1 + months
    y = orig_date.year + m // 12
    m = m % 12 + 1
    d = min(orig_date.day, calendar.monthrange(y, m)[1])
    return date(y, m, d)

def _do_borrow(cursor,
               borrow_id,
               isbn,        
               member_id,
               staff_id,
               borrow_date_str):
    # 0) Enforce 5-book limit
    cursor.execute("""
        SELECT COUNT(*) FROM Borrowing
         WHERE MemberID = :1
           AND ReturnDate IS NULL
    """, (member_id,))
    if cursor.fetchone()[0] >= 5:
        raise Exception(f"Member {member_id} already has 5 books out.")

    # 1) Find an available copy
    cursor.execute("""
        SELECT CopyID FROM BookCopy
         WHERE ISBN = :1
           AND Status = 'Available'
         FETCH FIRST 1 ROWS ONLY
    """, (isbn,))
    row = cursor.fetchone()
    if not row:
        raise Exception(f"No available copy for ISBN={isbn}.")
    copy_id = row[0]

    # 1b) Load full book + catalog details
    cursor.execute("""
       SELECT bk.Title,
              bk.Author,
              bk.SubjectArea,
              bk.IsLendable,
              bk.Binding,
              bk.Language,
              bk.Edition,
              c.Description
       FROM Book bk
       JOIN Catalog c    ON bk.ISBN = c.ISBN
       JOIN BookCopy bc  ON bc.ISBN = bk.ISBN
      WHERE bc.CopyID = :1
    """, (copy_id,))
    title, author, subj, lendable, binding, lang, edition, cat_desc = cursor.fetchone()

    # 2) Lookup member type
    cursor.execute("SELECT Type FROM Member WHERE MemberId = :1", (member_id,))
    row = cursor.fetchone()
    if not row:
        raise Exception(f"Member {member_id} not found.")
    member_type = row[0]

    # 3) Compute due_date_str
    bd = datetime.strptime(borrow_date_str, "%Y-%m-%d").date()
    if member_type in ("Student", "Non Academic Staff"):
        due_dt = bd + timedelta(days=21)
    else:  # Professor
        due_dt = add_months(bd, 3)
    due_date_str = due_dt.isoformat()

    # 4) Mark copy borrowed
    cursor.execute("""
        UPDATE BookCopy
           SET Status = 'Borrowed'
         WHERE CopyID = :1
           AND Status = 'Available'
    """, (copy_id,))
    if cursor.rowcount == 0:
        raise Exception(f"Failed to mark CopyID {copy_id} as Borrowed.")

    # 5) Insert the loan
    cursor.execute("""
        INSERT INTO Borrowing
          (BorrowID, CopyID, MemberID, StaffID,
           BorrowDate, DueDate, ReturnDate)
        VALUES
          (:1, :2, :3, :4,
           TO_DATE(:5,'YYYY-MM-DD'),
           TO_DATE(:6,'YYYY-MM-DD'),
           NULL)
    """, (borrow_id, copy_id, member_id, staff_id, borrow_date_str, due_date_str))

    # 6) Print full details
    print(f"\n✔ Borrow recorded: BorrowID={borrow_id}, CopyID={copy_id}")
    print(f"   ISBN          : {isbn}")
    print(f"   Title         : {title}")
    print(f"   Author        : {author}")
    print(f"   Subject Area  : {subj}")
    print(f"   Lendable      : {lendable}")
    print(f"   Binding       : {binding}")
    print(f"   Language      : {lang}")
    print(f"   Edition       : {edition}")
    print(f"   Catalog Desc. : {cat_desc}")
    print(f"   Borrow Date   : {borrow_date_str}")
    print(f"   Due Date      : {due_date_str}\n")

def borrowing():
    """
    CLI entrypoint: prompt ISBN, Member ID, Staff ID,
    then find a copy, enforce rules, and commit.
    """
    print("=== Borrow a Book ===")
    borrow_id   = int(input("Borrow ID: "))
    isbn        = input("ISBN: ").strip()
    member_id   = int(input("Member ID: "))
    staff_id    = int(input("Processing Staff ID: "))
    borrow_date = date.today().isoformat()

    try:
        transact(
            _do_borrow,
            borrow_id,
            isbn,
            member_id,
            staff_id,
            borrow_date
        )
    except Exception as e:
        print("✘ Could not borrow:", e)
