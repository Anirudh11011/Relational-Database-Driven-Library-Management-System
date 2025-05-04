#!/usr/bin/env python3
# renew_membership.py

from db import transact
from datetime import datetime, date

def _add_years(orig: date, years: int) -> date:
    """
    Safely add `years` to a date, rolling Feb 29 → Feb 28 if needed.
    """
    try:
        return orig.replace(year=orig.year + years)
    except ValueError:
        return orig.replace(month=2, day=28, year=orig.year + years)

def _do_renew_card(cursor, member_id: int, extend_years: int):
    # 1) Fetch the current expiry date
    cursor.execute("""
      SELECT ExpiryDate
        FROM MembershipCard
       WHERE MemberId = :1
    """, (member_id,))
    row = cursor.fetchone()
    if not row:
        raise Exception(f"No membership card found for MemberID={member_id}.")

    # cx_Oracle might return a datetime; convert to date
    current_expiry = row[0].date() if hasattr(row[0], "date") else row[0]

    # 2) Compute the new expiry date
    new_expiry = _add_years(current_expiry, extend_years)

    # 3) Update the card
    cursor.execute("""
      UPDATE MembershipCard
         SET ExpiryDate = TO_DATE(:1,'YYYY-MM-DD'),
             IsActive   = 'Y'
       WHERE MemberId  = :2
    """, (new_expiry.isoformat(), member_id))

    print(f"✔ Membership renewed for MemberID={member_id}")
    print(f"  • Old Expiry : {current_expiry.isoformat()}")
    print(f"  • New Expiry : {new_expiry.isoformat()}")

def renew_membership():
    """
    CLI entrypoint: asks for Member ID and extension length, then renews.
    """
    print("=== Renew Membership ===")
    member_id    = int(input("Member ID: "))
    extend_years = int(input("Extend by how many years? "))

    try:
        transact(_do_renew_card, member_id, extend_years)
    except Exception as e:
        print("✘ Failed to renew membership:", e)

if __name__ == "__main__":
    renew_membership()
