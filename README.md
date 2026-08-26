# HR Analytics Dashboard & SQL Analysis

Comprehensive Human Resources analytics project analyzing employee demographics, distribution, and organizational structure using SQL queries, Power BI dashboards, and CSV data.

---

## 📁 Project Files

| File | Type | Description |
|------|------|-------------|
| `dashboard.pdf` | PDF Report | Static HR analytics dashboard visualizations |
| `dashboard.pbix` | Power BI | Interactive Power BI dashboard for deep analysis |
| `sql_queries.sql` | SQL Script | Complete SQL queries for HR data extraction |
| `Human Resources.csv` | Dataset | Raw HR employee data (CSV format) |
| `README.md` | Documentation | Project documentation and query guide |

---

## 📊 Database Schema

### Table: `hr`

| Column | Type | Description |
|--------|------|-------------|
| id | INT | Employee unique identifier |
| gender | VARCHAR | Employee gender |
| age | INT | Employee age |
| race | VARCHAR | Employee race/ethnicity |
| department | VARCHAR | Department assigned |
| jobtitle | VARCHAR | Job position/title |
| location | VARCHAR | Work location (HQ/Remote) |
| location_city | VARCHAR | City of workplace |
| location_state | VARCHAR | State of workplace |
| hire_date | DATE | Employee hire date |
| termdate | DATE | Employee termination date (if applicable) |

---

## 🔍 SQL Queries & Analysis

### Query 1: Gender Breakdown
**Question:** What is the gender breakdown of employees in company?

```sql
SELECT gender, COUNT(*) AS count
FROM hr 
WHERE age >= 18 
GROUP BY gender;
```

**Output:** Count of employees by gender (18+ years)

**Use Case:** HR diversity metrics, workforce composition analysis

---

### Query 2: Race/Ethnicity Breakdown
**Question:** What is the race/ethnicity breakdown of employees in the company?

```sql
SELECT race, COUNT(*) AS count
FROM hr 
WHERE age >= 18 
GROUP BY race
ORDER BY 2 DESC;
```

**Output:** Diversity metrics sorted by highest count

**Use Case:** Diversity & Inclusion initiatives, Equal opportunity compliance

---

### Query 3: Age Distribution by Gender
**Question:** What is the age distribution of employees in company?

```sql
SELECT 
  CASE
    WHEN age >= 18 AND age <= 24 THEN '18-24'
    WHEN age >= 25 AND age <= 34 THEN '25-34'
    WHEN age >= 35 AND age <= 44 THEN '35-43'
    WHEN age >= 44 AND age <= 54 THEN '44-54'
    WHEN age >= 55 AND age <= 64 THEN '55-64'
    ELSE '65+'
  END AS age_group,
  gender,
  COUNT(*) AS count 
FROM hr
WHERE age >= 18
GROUP BY age_group, gender
ORDER BY age_group, gender;
```

**Output:** Age group distribution segmented by gender

**Use Case:** Workforce age analysis, retirement planning, demographic insights

---

### Query 4: Headquarters vs Remote Locations
**Question:** How many employees work at headquarters versus remote locations?

```sql
SELECT location, COUNT(*) AS count
FROM hr 
WHERE age > 18 
GROUP BY location;
```

**Output:** Employee count by work location type

**Use Case:** Remote work policy analysis, office capacity planning

---

### Query 5: Gender Distribution Across Department & Job Titles
**Question:** How does the gender distribution vary across department and job titles?

```sql
SELECT hr.department, hr.gender, COUNT(*) AS count
FROM hr  
GROUP BY hr.department, hr.gender
ORDER BY department;
```

**Output:** Gender breakdown per department

**Use Case:** Gender equity analysis by department, promotion tracking

---

### Query 6: Job Title Distribution
**Question:** What is the distribution of job title across the company?

```sql
SELECT hr.jobtitle, COUNT(*) AS count 
FROM hr
GROUP BY hr.jobtitle
ORDER BY hr.jobtitle DESC;
```

**Output:** All job positions and their employee counts

**Use Case:** Role-based analysis, hiring trends, career progression

---

### Query 7: Employees Across Locations (City & State)
**Question:** What is the distribution of employees across locations by city and state?

```sql
-- By State
SELECT hr.location_state, COUNT(*) AS count
FROM hr 
WHERE age >= 18 
GROUP BY hr.location_state;

-- By City
SELECT hr.location_city, COUNT(*) AS count
FROM hr 
WHERE age >= 18 
GROUP BY hr.location_city;
```

**Output:** Geographic distribution by state and city

**Use Case:** Regional staffing analysis, office expansion planning

---

### Query 8: Tenure Distribution by Department
**Question:** What is the tenure distribution of each department?

```sql
SELECT department, AVG(DATEDIFF(termdate, hire_date)/365) AS avg_tenure
FROM hr 
WHERE termdate <= CURDATE() AND age >= 18
GROUP BY department;
```

**Output:** Average employee tenure (in years) per department

**Use Case:** Retention analysis, employee satisfaction by department, turnover insights

---

## 📈 How to Use This Project

### 1. **View Dashboard Visuals**
   - Open `dashboard.pdf` for static report view
   - View charts, KPIs, and key metrics at a glance

### 2. **Interactive Analysis**
   - Open `dashboard.pbix` in Power BI Desktop
   - Create custom filters and drill-downs
   - Analyze specific departments or time periods

### 3. **Run SQL Queries**
   - Execute `sql_queries.sql` in your SQL database
   - Modify queries for deeper analysis
   - Export results for reporting

### 4. **Access Raw Data**
   - Import `Human Resources.csv` into your database
   - Use for data validation
   - Create custom reports

---

## 🛠️ Setup Instructions

### **Option 1: SQL Database Setup**
```bash
# 1. Import CSV into database
CREATE DATABASE hr_analytics;
USE hr_analytics;
LOAD DATA INFILE 'Human Resources.csv' 
INTO TABLE hr 
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# 2. Run SQL queries
mysql -u username -p hr_analytics < sql_queries.sql
```

### **Option 2: Power BI Setup**
1. Open `dashboard.pbix` in Power BI Desktop
2. Update data source to point to your CSV/Database
3. Refresh data
4. Explore interactive dashboard

### **Option 3: Quick Analysis**
1. Open `Human Resources.csv` in Excel/Sheets
2. Reference SQL queries for manual pivot tables
3. Compare with `dashboard.pdf` for insights

---

## 📊 Key Metrics Covered

| Metric | Query # | Purpose |
|--------|---------|---------|
| Gender Diversity | 1 | Workforce gender composition |
| Racial/Ethnic Diversity | 2 | DEI compliance & metrics |
| Age Demographics | 3 | Generational workforce breakdown |
| Work Location | 4 | Remote vs office distribution |
| Department Distribution | 5, 6 | Organizational structure |
| Geographic Distribution | 7 | Regional workforce spread |
| Employee Tenure | 8 | Retention & experience levels |

---

## 💡 Business Insights

### Diversity & Inclusion
- Use Query 1 & 2 to monitor diversity metrics
- Track progress toward D&I goals

### Workforce Planning
- Query 3 helps with succession planning
- Query 8 identifies retention risks

### Organizational Health
- Query 4 informs remote work policies
- Query 5 & 6 support career development initiatives

### Regional Strategy
- Query 7 guides expansion decisions
- Optimize staffing by location

---

## 🔧 Requirements

### For SQL Analysis
- MySQL / PostgreSQL / SQL Server
- SQL Client (MySQL Workbench, DBeaver, etc.)

### For Power BI Dashboard
- Power BI Desktop (Free)
- Download: https://powerbi.microsoft.com/

### For CSV Analysis
- Excel / Google Sheets
- Or any SQL database

---

## 📝 Data Quality Notes

- Age filter: `WHERE age >= 18` (excludes invalid records)
- Termdate: NULL for active employees
- All queries handle edge cases
- Date calculations in years (tenure)

---

## 🎯 Use Cases

✅ **HR Manager:** Monitor workforce demographics  
✅ **Director:** Track department performance  
✅ **Executive:** Strategic workforce planning  
✅ **D&I Officer:** Monitor diversity metrics  
✅ **Business Analyst:** Extract insights for reports  

---

## 📋 Query Performance Tips

```sql
-- Add indexes for faster queries
CREATE INDEX idx_age ON hr(age);
CREATE INDEX idx_department ON hr(department);
CREATE INDEX idx_gender ON hr(gender);
CREATE INDEX idx_location ON hr(location);
```

---

## 📞 Support

For questions about:
- **SQL Queries:** Refer to sql_queries.sql with inline comments
- **Dashboard:** Open dashboard.pbix in Power BI Desktop
- **Data:** Check Human Resources.csv for raw data

---

## 👨‍💻 Project Author

**Aaryan** | Data Analysis  
Data Analytics | SQL | Power BI | HR Analytics

---

## 📌 Quick Reference

| Action | File | Tool |
|--------|------|------|
| View visuals | dashboard.pdf | PDF Reader |
| Interactive analysis | dashboard.pbix | Power BI |
| Run queries | sql_queries.sql | SQL Client |
| Get raw data | Human Resources.csv | Database/Excel |

---

**Ready to explore HR insights? Start with the dashboard.pdf for overview, then dive into dashboard.pbix for detailed analysis!** 📊
