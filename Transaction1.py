#!/usr/bin/env python3
# add_member.py

from db import transact
from datetime import datetime, date

def _add_years(orig: date, years: int) -> date:
    """
    Safely add `years` to a date, rolling Feb 29 → Feb 28 if needed.
    """
    try:
        return orig.replace(year=orig.year + years)
    except ValueError:
        # Handles leap-year edge case
        return orig.replace(month=2, day=28, year=orig.year + years)

def _do_add_member(cursor,
                   member_id: int,
                   ssn: str,
                   start_date_str: str,
                   name: str,
                   campus_address: str,
                   home_address: str,
                   phone: str,
                   loan_days: int,
                   grace_days: int,
                   mtype: str):
    # 1) Insert into Member
    cursor.execute("""
      INSERT INTO Member
        (MemberId,
         SSN,
         MembershipStartDate,
         Name,
         CampusAddress,
         HomeAddress,
         Phone,
         LoanPeriodDays,
         GracePeriodDays,
         Type)
      VALUES
        (:1, :2, TO_DATE(:3,'YYYY-MM-DD'), :4,
         :5, :6, :7,
         :8, :9, :10)
    """, (
        member_id,
        ssn,
        start_date_str,  # Use the exact text the user entered
        name,
        campus_address,
        home_address,
        phone,
        loan_days,
        grace_days,
        mtype
    ))

    # 2) Issue MembershipCard using that same start_date
    start_dt  = datetime.strptime(start_date_str, "%Y-%m-%d").date()
    expiry_dt = _add_years(start_dt, 4)  # ← add 4 years here

    cursor.execute("""
      INSERT INTO MembershipCard
        (CardID,
         MemberId,
         IssueDate,
         ExpiryDate,
         Photo,
         IsActive)
      VALUES
        (:1,   -- CardID
         :2,   -- MemberId (FK)
         TO_DATE(:3,'YYYY-MM-DD'),
         TO_DATE(:4,'YYYY-MM-DD'),
         NULL,
         'Y')
    """, (
        member_id,            # :1 → CardID
        member_id,            # :2 → MemberId FK
        start_date_str,       # :3 → IssueDate from your input
        expiry_dt.isoformat() # :4 → ExpiryDate 4 years after that
    ))

    print("✔ Member added and MembershipCard issued:")
    print(f"  • MemberID/CardID = {member_id}")
    print(f"  • IssueDate       = {start_date_str}")
    print(f"  • ExpiryDate      = {expiry_dt.isoformat()}")

def add_member():
    """
    Prompts for all Member fields, then in one transaction:
      1) Inserts a Member row
      2) Inserts a corresponding MembershipCard row
    """
    print("=== Add New Member ===")
    member_id      = int(input("Member ID: "))
    ssn            = input("SSN (e.g. 123-45-6789): ")
    start_date     = input("Membership Start Date (YYYY-MM-DD): ")
    name           = input("Full Name: ")
    campus_address = input("Campus Address: ")
    home_address   = input("Home Address: ")
    phone          = input("Phone: ")
    loan_days      = int(input("Loan Period (days): "))
    grace_days     = int(input("Grace Period (days): "))
    mtype          = input("Type (Student/Professor/Non Academic Staff): ")

    try:
        transact(
            _do_add_member,
            member_id,
            ssn,
            start_date,
            name,
            campus_address,
            home_address,
            phone,
            loan_days,
            grace_days,
            mtype
        )
    except Exception as e:
        print("✘ Failed to add member:", e)


if __name__ == "__main__":
    add_member()
