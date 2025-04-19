-- DATABASE WAS ALREADY CREATED SO WE CREATED TABLE Hospital
CREATE TABLE Hospital(
	Hospital_Name VARCHAR(200),
	Location VARCHAR(100),	
	Department VARCHAR(100),	
	Doctors_Count INT,
	Patients_Count INT,	
	Admission_Date DATE,
	Discharge_Date DATE,
	Medical_Expenses NUMERIC(10,2)
);


-- DATA IS IMPORTED INTO THE TABLE MANUALLY USING THE TOOLBAR
SELECT * FROM Hospital;


-- 1. Write an SQL query to find the total number of patients across all hospitals.
SELECT hospital_name, SUM(patients_count) AS Total_Patients FROM Hospital
GROUP BY hospital_name
ORDER BY Total_Patients ASC;


-- 2. Retrieve the average count of doctors available in each hospital. 
SELECT hospital_name, AVG(doctors_count) AS Average_Doctor_Count FROM Hospital
GROUP BY hospital_name
ORDER BY Average_Doctor_Count ASC;


-- 3. Find the top 3 hospital departments that have the highest number of patients. 
SELECT department, SUM(patients_count) as Total_Patients FROM Hospital
GROUP BY department
ORDER BY Total_Patients DESC
LIMIT 3;


-- 4. Identify the hospital that recorded the highest medical expenses. 
SELECT hospital_name, SUM(medical_expenses) as Total_Expense FROM Hospital
GROUP BY hospital_name
ORDER BY Total_Expense DESC
LIMIT 1;


-- 5. Calculate the average medical expenses per day for each hospital. 
SELECT Hospital_Name, AVG(Medical_Expenses / GREATEST(Discharge_Date - Admission_Date, 1)) AS Avg_Expense_Per_Day
FROM Hospital
GROUP BY Hospital_Name;


-- 6. Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT *, (Discharge_Date - Admission_Date) AS Stay_Duration
FROM Hospital
ORDER BY Stay_Duration DESC
LIMIT 1;


-- 7. Count the total number of patients treated in each city.
SELECT location, SUM(patients_count) as Total_Patients From Hospital
GROUP BY location
ORDER BY Total_Patients ASC;


-- 8. Calculate the average number of days patients spend in each department. 
SELECT department, AVG(Discharge_Date - Admission_Date) as Average_Days From Hospital
GROUP BY department
ORDER BY Average_Days ASC;


-- 9. Find the department with the least number of patients. 
SELECT department, SUM(patients_count) as Total_Patients From Hospital
GROUP BY department
ORDER BY Total_Patients ASC
LIMIT 1;


-- 10. Group the data by month and calculate the total medical expenses for each month. 
SELECT TO_CHAR(Admission_Date, 'YYYY-MM') AS Month, SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Hospital
GROUP BY TO_CHAR(Admission_Date, 'YYYY-MM')
ORDER BY Month;






