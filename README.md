# Identifying Drivers of Missed Medical Appointments 

## 🚀 Executive Summary
This project is a healthcare analytics project analyzing patient appointment behavior to uncover operational, demographic, and scheduling factors associated with higher no-show rates using PostgreSQL and Tableau. 
---

## 📌 Business Problem
Missed appointments (“no-shows”) create significant operational and financial inefficiencies for healthcare providers by reducing revenue, underutilizing clinical resources, and limiting access for other patients. These missed visits are driven by multiple factors such as patient demographics, scheduling lead time, and prior attendance behavior, making it difficult for organizations to proactively address the issue without data-driven insight. The core business problem is identifying the key drivers of patient no-shows so healthcare administrators can predict high-risk appointments, implement targeted interventions, and ultimately improve appointment attendance rates and overall clinic efficiency.

---

## 🎯 Objectives
Key objectives:

- Quantify Overall No-Show Rate: Establish a baseline understanding of appointment completion vs. no-show behavior to measure the scale of the problem.

- Evaluate Scheduling Influence: Analyze how factors like appointment lead time, day of the week, and time of day impact the likelihood of a patient not showing up.

- Identify High-Risk Patient Segments: Segment patients based on behavioral patterns (e.g., repeat no-shows, new vs. returning patients, age segments) to highlight groups most associated with missed appointments.

---

## 🧠 Approach
This project follows the **Google Data Analytics framework**:

**Ask → Prepare → Process → Analyze → Share → Act**

---

## 📊 Dataset
This analysis uses a healthcare appointment dataset containing approximately six months of scheduling activity and one month of clinical appointment outcomes. The dataset includes patient demographic information such as age, gender, and neighborhood location, along with clinical and operational variables including co-morbidities, appointment scheduling date, appointment date, SMS reminder status, and final appointment attendance outcome (show vs. no-show).

To maintain data quality and analytical accuracy, patient records with ages below 0 or above 102 were excluded from age-based analysis, as these values were determined to be likely data entry errors.


---

## 🧹 Data Cleaning & Preparation
Data cleaning and transformation were performed using Google Sheets and PostgreSQL to improve data quality and ensure accurate analysis. Key preparation steps included:

- Spell Checking & Formatting: Reviewed and corrected minor spelling inconsistencies and formatting issues using Google Sheets.

- Data Validation: Used PostgreSQL aggregation functions (MIN() and MAX()) to identify invalid age values within the dataset.

- Outlier Handling: Detected patient ages of -1 and 115, which were treated as likely data entry errors. These records were excluded from age-bracket analysis to maintain analytical accuracy.

- Data Transformation: Created calculated fields and categorical groupings in PostgreSQL, including age brackets and appointment lead-time ranges, to support trend analysis and dashboard visualization.


---

## 📊 Key Insights (Quick View)
Overall No-Show Rate: 19.5%

High-Risk Age Bracket: Ages 18 - 29 (24.6% No-Show Rate)

SMS Reminders: 56.2% of No-Show appointments did not receive SMS reminders

Schedule Lead Time "Danger Zone": No show rates significantly increase after at 15+ schedule lead time. The majority of "one time offenders"(80%) no show between 90 and 180 day lead time.
---

## 📊 Interactive Dashboard
[View on Tableau Public](https://public.tableau.com/app/profile/greg.washam/viz/NoShowAnalysis_17785967473760/Dashboard1)

## 📸 Dashboard Preview
![Dashboard Preview](images/Patient%20No-Show%20Analysis(1).png)

## 🔍 Detailed Insights

# High-Risk No-Show Age Bracket
<p align="center">
  <img src="images/No-Show By age.png" alt="No-Show Age Risk Bar Chart" width="800">
</p>

The analysis identified the 18–29 age bracket as the primary driver of missed appointments across all patient groups. While the clinic’s overall no-show rate was 19.5%, patients between the ages of 18 and 29 demonstrated a significantly higher no-show rate of 24.6%. This finding suggests that younger adult patients may face greater scheduling conflicts, inconsistent routines, or lower engagement with appointment adherence, making them a high-risk segment for targeted reminder systems and attendance intervention strategies.

# The "Reminder Gap": Impact of SMS on scheduling compliance
<p align="center">
  <img src="images/sms received.png" alt="SMS Received Amongst No-Shows" width="800">
  <img src="images/SMS.png" alt="SMS Received by Lead Time" width="800">
</p>

A critical insight emerged from the SMS reminder analysis: only 25.6% of patients received SMS reminders, while 56.2% of patients who missed their appointments did not receive a reminder. This suggests that SMS reminders may play an important role in reducing no-show rates. Additionally, a consistent behavioral pattern was observed across both groups—patients who received reminders and those who did not—as no-show rates generally increased as appointment lead time increased. Interestingly, this trend reversed after approximately 60 days, where no-show rates began to decline slightly. These findings suggest that both reminder systems and scheduling lead time influence patient attendance behavior.

# Specialty Benchmarking: Cardiology vs. General Care
<p align="center">
  <img src="visualizations/Efficiency vs Risk.png" alt="Efficiency vs Risk Scatter plot" width="800">
</p>


By benchmarking clinical specialties, the data reveals that Cardiology consistently maintains readmission rates below the hospital average, even when treating high-risk patients. This high performance suggests that the specialized discharge and follow-up protocols used in Cardiology could potentially be modeled and scaled to other departments to lower the overall hospital-wide readmission rate.

---

## 💡 Recommendations

To reduce the 15% risk identified in the "Treatment Gap," the hospital should implement a mandatory medication review for all diabetic patients prior to discharge, specifically targeting those whose prescriptions remained unchanged during their stay.

---

## 📈 Business Impact
### Financial Impact: Penalties & Cost Savings

Hospital readmissions are expensive. Under the Hospital Readmission Reduction Program (HRRP), the government (CMS)  penalizes hospitals by reducing their overall payments if their readmission rates are too high.

    

### Clinical Excellence: Closing the "Treatment Gap"

Finding that diabetic patients with no medication changes have a 15% readmission risk is a major red flag for the clinical team. This suggests that the current "standard of care" for some patients is too passive.


### Resource Optimization & Strategy

Hospitals have limited beds and staff. Every "preventable" readmission takes away a bed from a new patient who needs it.

   ---

## 🔑 Why This Matter

1. Identifying a 13.1% readmission risk points to where the hospital is losing money through federal penaltis.
2. Treating a patient a second time for the same issue often costs more than the initial stay, as the patient’s condition may have worsened.
3. Implementing a policy to require a medication review for all diabetic patients could directly save lives and prevent the physical and emotional stress of a patient having to return to the ER just days after being discharged.
4. Operational efficiency can be improved. The hospital can study what Cardiology is doing differently and apply those discharge protocols to the higher-risk Diabetes units. 
---

### Analyst Note: This analysis provides a roadmap for reducing federal penalties and improving patient health outcomes by targeting high-risk diabetic medication protocols.

---

## 🛠 Tools Used
- SQL  
- Tableau  
- Data Analysis  

---


## ⚠️ Challenges
- Large dataset: Utilized PostgreSQL to efficiently handle 100,000+ entries
- Missing specialist data: Categorized the missing data as "other" or "Unknown" to avoid skewing the specialty benchmarking

---

## 📂 Project Structure
- SQL queries for analysis  
- Tableau dashboard for visualization  