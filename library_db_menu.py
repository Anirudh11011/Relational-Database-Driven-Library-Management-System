from db import transact


def _fetch_table(cursor, table_name):
    """
    Fetches all rows from a given table, converting any LOBs to Python str.
    Returns (columns, rows).
    """
    cursor.execute(f"SELECT * FROM {table_name}")
    cols = [desc[0] for desc in cursor.description]

    rows = []
    for raw_row in cursor.fetchall():
        cleaned = []
        for val in raw_row:
            # if it's a LOB then read it now:
            if hasattr(val, "read"):
                cleaned.append(val.read())
            else:
                cleaned.append(val)
        rows.append(tuple(cleaned))

    return cols, rows

def show_table(table_name):
    """
    Retrieves and prints all rows from a table via transact().
    """
    cols, rows = transact(_fetch_table, table_name)
    print(f"\n=== {table_name} ===")
    print(" | ".join(f"{col:^15}" for col in cols))
    print("-" * (17 * len(cols)))
    for row in rows:
        print(" | ".join(str(val).ljust(15) for val in row))


def library_db_menu():
    tables = {
        "1": "Member",
        "2": "MembershipCard",
        "3": "Remainder",
        "4": "Catalog",
        "5": "Book",
        "6": "BookCopy",
        "7": "LibraryStaff",
        "8": "AcquisitionInterestList",
        "b": None
    }
    while True:
        print("\n--- Library Database ---")
        for key, tbl in tables.items():
            if key == "b":
                print(f" {key}. Back to Main Menu")
            else:
                print(f" {key}. {tbl}")
        choice = input("Select table> ").strip().lower()
        if choice == "b":
            return
        table = tables.get(choice)
        if table:
            show_table(table)
        else:
            print("⚠️  Invalid choice, try again.")