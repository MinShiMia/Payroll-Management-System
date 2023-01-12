## Problem Statement
The payroll management system is one indispensable and imperative component for each business. Running payroll is one of the most important responsibilities for business owners. 

There are two main types of payroll management: manual payroll management using spreadsheets and payroll management systems based on relational databases. Many small business owners utilize the traditional excel spreadsheets to manage their payrolls since it is a handy and user-friendly tool. However, as the business grows and more employees join, the payroll management using spreadsheets tends to become messy and time-consuming, especially when the business owners generate paychecks based on multiple sheets, each containing a large amount of information. These shortcomings lead to the popularity of adopting payroll management systems based on relational databases in increased businesses and companies nowadays. 

A relational database payroll management system provides a better way for business owners to manage employee personal information, record employee timecard information, and automatically generate paychecks. However, without a clever design of the table schemas and the relations among multiple tables, the payroll management system still could not meet the requirements of the companies and function efficiently. In that case, the business owner and employees are easily bothered by the messy payroll management system. Thus, providing a good and reasonable payroll management system relational database design is the main purpose of our group project. 

We will utilize MySQL, an open-source and free software, to design the payroll management system. And the payroll system tends to store employee personal information, track employee absence and days/hours worked, and deploy functions to generate income, taxes, and after-tax incomes.

## Business Case
Reliable payroll management systems are important beyond the practical role they play in ensuring efficient and timely paying of employees. Payroll systems are also important to maintain employee morale and trust in the business’ ability to carry out its basic mission and objectives. Businesses that are growing or looking to scale must consider upgrading their payroll management system to keep up with the needs of the growing business and ensure the infrastructure of the organization can support future states of the business. 

Our MySQL Payroll Management System will serve the payroll needs of companies that are at a stage where manual or spreadsheet-based payroll systems can no longer provide the level of accuracy and automation that the business needs. The technical rollout of the system requires our database schema, server space and a user interface that is not part of the scope of this project. Companies will face minimal risk with implementing this database solution assuming previous payroll history and employee information is easily accessible. Finally, the cost of the solution will be a subscription model with an upfront fee to cover the costs of initial implementation.

# Project Goal
To design, develop and implement a relational database payroll management system to automate the payroll calculation, save time and reduce administrative burden, consolidate, and store records more efficiently and improve employee satisfaction.

# Project Scope
What is in the Payroll Management System’s scope? The system needs to be able to designate an employee as salary or hourly, record employee hours multiple times a day, and then sum the hours for a two week pay period. The system must also be able to update each employee's status, address, bank account numbers, record payroll expenses on a biweekly basis, and store the current date. Next, the system needs to calculate the percentage change (delta) and numerical difference between current pay period and previous pay period. Finally, the system needs to keep and maintain an events table to record changes and assign a timestamp to them. So, what is not in the Payroll Management System scope? Considering that this is a database class, and not a software engineering class, it seems reasonable that the Payroll Management System project will not require either a front-end or back-end application to write and read queries from.

# Benefits
The Payroll Management System will provide several benefits to the business. Automating payroll will help the business to done by hand errors or forgotten details. Second, authorized users will be able to make changes to a sole source of truth rather than the changes replicated to other files or forms of record by hand. Third, payroll will then be automatically calculated referencing salary / per hour information from the employee’s payment record, and employees (if hourly) will be able to record the number of hours worked per day / week. Furthermore, a summary of these calculations will be stored at month’s end for financial analysis. Finally, these changes will make it easy for privileged users to adjust each employee’s employment status, promotions, addresses, wage change, etc.

# Target Customers
Our Target Customers are companies ranging from small business to big corporations. Our application is meant to be user friendly so that no company or employee fears the thought of figuring out our Payroll Management System. 

# Entity Relationship (ER) Diagram
![Entity Relationship (ER) Diagram](https://github.com/MinShiMia/PayRollManagementSystem/Payroll_Management_System.png)

# Assumptions/Notes About Data Entities and Relationships
Employee and Payroll tables are the main entities in the payroll management system since this payroll management system is built to calculate employee payroll during specific periods.

In designing the payroll management system, we have the following assumptions:
1)	As for employee positions, we assume employees could change their departments and positions during their career life in the company. Thus, the position ID and department ID are not embedded in the 'Employee' table. Instead, we utilize an interaction table between "Employee" and "Department" called "Employee_Position' to store all the positions the employee has experienced, together with their supervisor's ID, start date, and end date.

2)	As for employee pay per hour, we thought each employee should have an hourly rate stored in the "Employee" table. Even for the employees who are offered monthly or yearly salaries, we convert their salary into an hourly rate. And when there is a change in an employee's pay per unit, we will update it in the employee table.

3)	As for employee PTO, we set a certain number of PTO hours for each employee each year, which might change depending on the Employee’s tenure and position. The employee's total PTO each year is stored in the "PTO" table. And the remaining PTO hours could be calculated by taking the difference between total PTO hours and the total PTO hours used during all payroll periods within that year according to the value of "PTO_Hours" in the "Employee_Hours_Worked" table.

4)	As for employee deductions, we presume that the percentage for different types of deductions will change over time. That is why we have an interaction table inserted between the "Employee" and "Deductions" tables as the interaction table can store all the many types of deductions for each employee.

5)	As for employee bonuses, we set their bonus_amt as a constant number during different payroll periods. 

6)	When it comes to "Payroll" table, we give sample data for "Payroll_ID", "Employee_ID", "Pay_Date", "Start_Date", "End_Date", "Bonus_ID", and "Deduction_ID", but leave the fields "Gross_Pay", "Deductions" and "Net_Pay" empty since these three fields need to be filled by calculation. 

7)	There are two methods to fill in the fields "Gross_Pay," "Deductions," and "Net_Pay" through calculation:
Method 1: Use three stored functions to calculate gross pay, deductions, and net pay, and then use a stored procedure to utilize these three stored functions to update the values for the empty fields.
Method 2: Create three views to store gross pay, deductions, and net pay information. Then update the payroll using the 'inner join' function for the payroll table and the views.

 
# Scenarios covered for the database 
1)	Validate remaining PTO to see if the requested time off is less than or equal to the remaining PTO balance.

2)	Annually reload the PTO_Remaining balance for each employee on the 1st of the year based on the PTO_Yearly allotment for the employee.  The maximum PTO hours allowed for an employee at the start of the year is 120 hours. 

3)	Employee deductions is flexible and dynamic because not every employee is going to pay a state tax, 401k, etc.

4)	The Database should categorize and tally the hours that the Employee has worked for the last two weeks, and then calculate their deductions and net pay.

5)	If an Employee gets a promotion, demotion, or lateral change the database only needs to make one change.

6)	Along with their new position change we can update their hourly rate to reflect their new salary or hourly rate.

7)	Employee bank account information can be changed to deal with a change related to a new account and routing number, account name, or an entirely new bank.

8)	Our Payroll Management System also includes the functionality of allowing our customer to handout bonuses to their employees. We then integrate that number into our calculations.

