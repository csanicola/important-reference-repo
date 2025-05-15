# Ambulatory Performance Dataset - Data Dictionary

| Variable Name                | Description                                                     | Data Type | Example Values   | Notes                                     |
| ---------------------------- | --------------------------------------------------------------- | --------- | ---------------- | ----------------------------------------- |
| `Practice_ID`                | Unique identifier for each ambulatory practice                  | String    | `AP001`, `AP002` | 12 total practices                        |
| `Quarter`                    | Reporting quarter                                               | String    | `Q1`, `Q2`       | Two records per practice, one per quarter |
| `Visit_Volume`               | Total number of patient visits                                  | Integer   | 4,200            | Represents total visits in the quarter    |
| `Avg_Wait_Time_Min`          | Average patient wait time before being seend (in minutes)       | Float     | 17.5             | Key operational metric                    |
| `Patient_Satisfaction_Score` | Average patient satisfaction score (0-100 scale)                | Float     | 89.2             | Simulated from post-visit surveys         |
| `No_Show_Rate`               | Percentage of scheduled appointments that patients missed       | Float     | 7.8              | National benchmark <10%                   |
| `Followup_Adherence_Rate`    | Percentage of patients who completed recommended follow-ups     | Float     | 81.5             | Higher is better                          |
| `Staff_to_Patient_Ratio`     | Ratio of support staff to unique patients seen                  | Float     | 0.18             | Example: 18 staff per 100 patients        |
| `Provider_Productivity`      | Average number of visits per full-time equivalent (FTE) provide | Float     | 384.6            | Total visits divided by provider FTE      |
| `A1C_Screening_Compliance`   | Percentage of diabetic patients with documented A1C screening   | Float     | 92.3             | Proxy for quality measure compliance      |
| `Total_Providers_FTE`        | Total number of full-time equivalent providers                  | Float     | 10.5             | Needed to calculate productivity          |
| `Total_Staff_FTE`            | Total number of full-time equivalent support staff              | Float     | 19.0             | Used to calculate staff ratio             |
| `Unique_Patients_Seen`       | Total number of unique patients seen during the quarter         | Integer   | 1,600            | Used with staffing metrics                |
