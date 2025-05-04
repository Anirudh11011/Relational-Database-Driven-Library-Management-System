from db import transact
from datetime import date


def _do_send_renewal(cursor):
    """
    Finds all active memberships expiring within one month,
    inserts reminders into Remainder, and returns list of (MemberId, Name).
    """
    # 1) Find memberships expiring in next month
    cursor.execute("""
       SELECT c.MemberId, m.Name, c.ExpiryDate
         FROM MembershipCard c
         JOIN Member m ON c.MemberId = m.MemberId
        WHERE c.ExpiryDate BETWEEN TRUNC(SYSDATE) AND TRUNC(ADD_MONTHS(SYSDATE,1))
          AND c.IsActive = 'Y'
    """)
    rows = cursor.fetchall()

    # 2) Insert reminders
    for member_id, name, expiry in rows:
        message = f"Your membership will expire on {expiry.strftime('%Y-%m-%d')}"
        cursor.execute("""
            INSERT INTO Remainder
              (RemainderID, MemberId, RemainderDate, RType, RMessage, CopyID)
            VALUES
              (REMAINDER_SEQ.NEXTVAL,
               :1,
               SYSDATE,
               'UpcomingExpiry',
               :2,
               NULL)
        """, (member_id, message))

    return [(member_id, name) for member_id, name, _ in rows]


def send_renewal_reminders():
    """
    Uses transact to send renewal reminders and print notifications.
    """
    try:
        notified = transact(_do_send_renewal)
    except Exception as e:
        print("✘ Failed to send renewal reminders:", e)
        return

    # 3) Report back
    if notified:
        print("\nRenewal notices sent to:")
        for member_id, name in notified:
            print(f"  {member_id}: {name}")
    else:
        print("No memberships expiring in the next month.")