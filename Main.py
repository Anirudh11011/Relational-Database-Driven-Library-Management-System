# main.py
#!/usr/bin/env python3
from Transaction1       import add_member
from Transaction2         import add_book
from Transaction3        import borrowing
from Transaction4     import return_book
from Transaction5   import renew_membership
from reports          import report_menu
from library_db_menu       import library_db_menu
from renewals             import send_renewal_reminders


def transaction_menu():
    options = {
        "1": ("Add Member",       add_member),
        "2": ("Add Book",         add_book),
        "3": ("Borrow a Book",    borrowing),
        "4": ("Return a Book",    return_book),
        "5": ("Renew Membership", renew_membership),
        "b": ("Back to Main Menu", None),
    }
    while True:
        print("\n--- Transaction Menu ---")
        for key, (desc, _) in options.items():
            print(f" {key}. {desc}")
        choice = input("Select transaction> ").strip().lower()
        if choice == "b":
            return
        if choice in options:
            _, fn = options[choice]
            fn()
        else:
            print("⚠️  Invalid choice, try again.")


def main_menu():
    options = {
        "1": ("Transactions",     transaction_menu),
        "2": ("Reports",          report_menu),
        "3": ("Renewals Reminder", send_renewal_reminders),
        "4": ("Library Database",  library_db_menu),
        "q": ("Quit",             exit),
    }
    while True:
        print("\n=== Library CLI ===")
        for key, (desc, _) in options.items():
            print(f" {key}. {desc}")
        choice = input("Select> ").strip().lower()
        cmd = options.get(choice)
        if cmd:
            _, fn = cmd
            fn()
        else:
            print("⚠️  Invalid choice, try again.")


if __name__ == "__main__":
    main_menu()