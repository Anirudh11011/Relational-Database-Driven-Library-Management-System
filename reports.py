from db import transact


def _fetch_entire_report(cursor):
    """
    Fetches all-time weekly borrowing activity grouped by ISO week,
    subject area, and author.
    Returns list of rows.
    """
    sql = """
    SELECT
      TO_CHAR(b.BorrowDate,'IYYY-"W"IW') AS Week,
      bk.SubjectArea,
      bk.Author,
      COUNT(*)                          AS CopiesLoaned,
      SUM(NVL(b.ReturnDate, SYSDATE) - b.BorrowDate) AS DaysLoaned
    FROM Borrowing b
    JOIN BookCopy bc ON b.CopyID = bc.CopyID
    JOIN Book     bk ON bc.ISBN  = bk.ISBN
    GROUP BY
      TO_CHAR(b.BorrowDate,'IYYY-"W"IW'),
      bk.SubjectArea,
      bk.Author
    ORDER BY Week, bk.SubjectArea, bk.Author
    """
    cursor.execute(sql)
    return cursor.fetchall()


def show_entire_report():
    """
    Retrieves and prints the entire weekly report.
    """
    rows = transact(_fetch_entire_report)
    print("\nWeek      | Subject Area         | Author              | #Copies | TotalDays")
    print("----------+----------------------+---------------------+---------+----------")
    for week, subj, auth, cnt, days in rows:
        print(f"{week:10} | {subj[:20]:20} | {auth[:19]:19} | {cnt:7} | {int(days):8}")


def _fetch_report_by_year(cursor, year):
    """
    Fetches weekly borrowing activity for a specific year.
    """
    sql = """
    SELECT
      TO_CHAR(b.BorrowDate,'IW')       AS ISOWeek,
      bk.SubjectArea,
      bk.Author,
      COUNT(*)                         AS CopiesLoaned,
      SUM(NVL(b.ReturnDate, SYSDATE) - b.BorrowDate) AS DaysLoaned
    FROM Borrowing b
    JOIN BookCopy bc ON b.CopyID = bc.CopyID
    JOIN Book     bk ON bc.ISBN  = bk.ISBN
    WHERE TO_CHAR(b.BorrowDate,'YYYY') = :1
    GROUP BY
      TO_CHAR(b.BorrowDate,'IW'),
      bk.SubjectArea,
      bk.Author
    ORDER BY ISOWeek, bk.SubjectArea, bk.Author
    """
    cursor.execute(sql, (year,))
    return cursor.fetchall()


def show_report_by_year():
    """
    Prompts for a year, retrieves and prints that year's weekly report.
    """
    year = input("Enter year (YYYY): ").strip()
    if not (year.isdigit() and len(year) == 4):
        print("⚠️  Invalid year format.")
        return
    rows = transact(_fetch_report_by_year, year)
    print(f"\nWeekly Report for {year}")
    print("Week | Subject Area         | Author              | #Copies | TotalDays")
    print("-----+----------------------+---------------------+---------+----------")
    for week, subj, auth, cnt, days in rows:
        print(f"{week:4} | {subj[:20]:20} | {auth[:19]:19} | {cnt:7} | {int(days):8}")


def report_menu():
    options = {
        "1": ("Show entire report", show_entire_report),
        "2": ("Report by year",      show_report_by_year),
        "b": ("Back to Main Menu",   None),
    }
    while True:
        print("\n--- Reports ---")
        for k, (desc, _) in options.items():
            print(f" {k}. {desc}")
        choice = input("Select report> ").strip().lower()
        if choice == "b":
            return
        cmd = options.get(choice)
        if cmd:
            _, fn = cmd
            fn()
        else:
            print("⚠️  Invalid choice, try again.")