# CSI-Assignment8: Date Dimension Table Generator

## 📌 Description

This repository is a part of **Celebal Summer Internship - Week 8** assignment. It contains SQL scripts and outputs for generating a **Date Dimension Table** using a stored procedure. The goal is to automate the creation and population of a Date Dimension table, which is an essential part of Data Warehousing and Business Intelligence systems.

The solution includes:
- Dynamic generation of date records for an entire year.
- Extraction of date attributes like Day, Month, Year, Quarter, Weekday, etc.
- Indicators for weekends and leap years.

> 💡 This is implemented in **SQL Server** using a stored procedure with dynamic logic.

---

## 📁 Folder Structure

| Folder/File | Description |
|-------------|-------------|
| `Queries/` | Contains SQL scripts for table and procedure creation |
| `Outputs/` | Contains output result after executing the stored procedure |
| `README.md` | Description and structure of the repository |

---

## 📂 Contents

### ✅ Queries Folder

| File Name | Purpose |
|-----------|---------|
| `01_DateDimension_Table_Creation.sql` | Script to create the `DateDimension` table |
| `02_PopulateDateDimension_Procedure_Creation_Execution_Verification.sql` | Stored procedure to populate data from a sample input date (entire year) |

### 📤 Outputs Folder

| File Name | Purpose |
|-----------|---------|
| `01_DateDimension_Table_Data.sql` | Output of `SELECT * FROM DateDimension` after procedure execution |

---

## 🛠️ How to Use

1. Open Microsoft SQL Server.
2. Execute `01_DateDimension_Table_Creation.sql` to create the table.
3. Execute `02_PopulateDateDimension_Procedure_Creation_Execution_Verification.sql` to populate the table.
4. Verify results using:
```sql
SELECT * FROM DateDimension;
```

---

## 📞 Contact
For any queries or discussions, feel free to reach out via [LinkedIn](https://www.linkedin.com/in/aniruddha-sarkar-90a34334b/).
