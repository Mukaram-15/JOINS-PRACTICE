Below are clear explanations and SQL examples for **INNER**, **LEFT**, **RIGHT**, and **FULL OUTER** joins to help you combine data meaningfully.

---

# 🔗 SQL JOIN TYPES

Assume we have two tables:

### **Table: Customers**

| customer_id | name  |
| ----------- | ----- |
| 1           | Alice |
| 2           | Bob   |
| 3           | Carol |

### **Table: Orders**

| order_id | customer_id | amount |
| -------- | ----------- | ------ |
| 101      | 1           | 50     |
| 102      | 1           | 80     |
| 103      | 2           | 40     |
| 104      | 4           | 20     |

---

# 1️⃣ INNER JOIN

Returns only rows with matching values in **both** tables.

```sql
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
INNER JOIN Orders o
    ON c.customer_id = o.customer_id;
```

### Result:

| customer_id | name  | order_id | amount |
| ----------- | ----- | -------- | ------ |
| 1           | Alice | 101      | 50     |
| 1           | Alice | 102      | 80     |
| 2           | Bob   | 103      | 40     |

✔ Only customers who **have orders** appear.

---

# 2️⃣ LEFT JOIN

Returns **all rows from the left table**, and matches from the right when available.
Right-side non-matches show **NULLs**.

```sql
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id;
```

### Result:

| customer_id | name  | order_id | amount |
| ----------- | ----- | -------- | ------ |
| 1           | Alice | 101      | 50     |
| 1           | Alice | 102      | 80     |
| 2           | Bob   | 103      | 40     |
| 3           | Carol | NULL     | NULL   |

✔ Includes **all customers**, even Carol who has no orders.

---

# 3️⃣ RIGHT JOIN

Returns **all rows from the right table**, and matches from the left when available.
Left-side non-matches show **NULLs**.

```sql
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
RIGHT JOIN Orders o
    ON c.customer_id = o.customer_id;
```

### Result:

| customer_id | name  | order_id | amount |
| ----------- | ----- | -------- | ------ |
| 1           | Alice | 101      | 50     |
| 1           | Alice | 102      | 80     |
| 2           | Bob   | 103      | 40     |
| NULL        | NULL  | 104      | 20     |

✔ Includes **all orders**, even order 104 which has no matching customer.

---

# 4️⃣ FULL OUTER JOIN

Returns **all rows from both tables**, matching where possible.
Unmatched rows show NULLs from whichever side is missing.

```sql
SELECT c.customer_id, c.name, o.order_id, o.amount
FROM Customers c
FULL OUTER JOIN Orders o
    ON c.customer_id = o.customer_id;
```

### Result:

| customer_id | name  | order_id | amount |
| ----------- | ----- | -------- | ------ |
| 1           | Alice | 101      | 50     |
| 1           | Alice | 102      | 80     |
| 2           | Bob   | 103      | 40     |
| 3           | Carol | NULL     | NULL   |
| NULL        | NULL  | 104      | 20     |

✔ Includes **all customers** and **all orders**, whether or not they match.

---

# ✅ Summary Table

| JOIN TYPE      | Returns                       |
| -------------- | ----------------------------- |
| **INNER**      | Matches in both tables        |
| **LEFT**       | All left + matches from right |
| **RIGHT**      | All right + matches from left |
| **FULL OUTER** | All rows from both tables     |

---

If you'd like, I can also:
✔ Create diagrams
✔ Provide real business examples
✔ Help write joins for your **actual database structure**

Just let me know!
