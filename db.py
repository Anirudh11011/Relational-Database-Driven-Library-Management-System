# db.py
import cx_Oracle

# only these two lines:
ORACLE_USER = "XXXXXX"
ORACLE_PASS = "XXXXXX"

def get_conn():
    """
    If your environment is already set up (TNS alias, ORACLE_SID, etc.),
    cx_Oracle.connect(user, password) will use the default connect string.
    """
    return cx_Oracle.connect(ORACLE_USER, ORACLE_PASS)

def transact(fn, *args, **kwargs):
    """
    Wraps fn(cursor, *args, **kwargs) in a transaction.
    """
    conn   = get_conn()
    cursor = conn.cursor()
    try:
        result = fn(cursor, *args, **kwargs)
        conn.commit()
        return result
    except:
        conn.rollback()
        raise
    finally:
        cursor.close()
        conn.close()
