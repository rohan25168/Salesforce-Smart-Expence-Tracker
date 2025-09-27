🚀 Salesforce Smart Expense Tracker
A Salesforce-based Expense Management Application that allows employees to upload receipts, enter expense details, and analyze spending trends. This project is built using Salesforce Lightning Web Components (LWC), Apex, and custom objects, with a focus on automation, reporting, and data security.

📌 Problem Statement
Managing expenses manually using spreadsheets or emails is time-consuming, error-prone, and lacks transparency. Employees face delays in reimbursements, and finance teams struggle with auditing and consolidating reports.
There is a need for a centralized Salesforce solution that simplifies expense tracking, improves accuracy, and provides insightful dashboards.

🎯 Objectives
1.Streamline expense entry and storage in Salesforce.
2.Provide a platform for employees to upload receipts with details
3.Enable finance teams to review and approve expenses efficiently.
4.Generate meaningful reports and dashboards for financial insights.
5.Ensure security with role-based access and data sharing rules.

🔑 Key Features
1.Expense Entry & Attachments
  a) Upload receipts (Notes & Attachments / Files).
  b) Enter vendor, amount, date, category, and notes.
2.Validation & Approval
  a) Validation rules to prevent incorrect data (e.g., negative amount).
  b) Approval process for high-value expenses.
3.Lightning Web Components (LWCs)
  a) receiptUploader → Upload receipts with preview.
  b) expenseForm → Enter and review expense details.
  c) expenseDashboard → View reports and charts.
4.Reports & Dashboards
  a) Monthly spend analysis.
  b) Top 5 vendors.
  c) Category-wise breakdown.
5.Security & Access Control
  a) OWD (Private) for Expense__c.
  b) Sharing rules for managers & finance teams.
  c) Field-level security for sensitive data.

🏗️ Project Phases
1.Problem Understanding & Industry Analysis – Defined requirements, stakeholders, and process mapping.
2.Org Setup & Configuration – Roles, profiles, permission sets, and sandbox setup.
3.Data Modeling – Custom objects Expense__c and Expense_Report__c with relationships.
4.Process Automation – Validation rules, approval process, and flows.
5.Apex Development – Classes, triggers, batch jobs, and test coverage.
6.LWC Development – Upload, entry form, and dashboard components.
7.Attachments Handling – Store receipts securely using Notes & Attachments.
8.Data Management & Deployment – Data Import Wizard, Data Loader, Change Sets, VS Code, and SFDX.
9.Reporting & Security Review – Dashboards, OWD, sharing rules, field-level security.

🛠️ Tech Stack
1.Salesforce – Custom Objects, Flows, Reports, Dashboards
2.LWC (Lightning Web Components) – UI development
3.Apex – Business logic & validations
4.Data Loader & Import Wizard – Data management
5.VS Code + SFDX CLI – Development & deployment
