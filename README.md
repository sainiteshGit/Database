# DatabaseUser Requirements
A.Process Modeling Requirements
·PGCC has many departments with many programs in it. The departments conta information about ( Department Name, programs offered, Faculty ID’s of department, Chairman ID of department)· Each Department has at most one chairman who’s also a faculty and must have a chairman.
Each program is uniquely identified by its name, it has information (Program Name, all courses offered in that program, students admitted in to program).
Each course in uniquely identified by its Course ID, it has information ( CID, title, students registered for course). Courses are categorized into Credit Based and Non-Credit based courses.
Faculty can be uniquely identified by their FacultyId, contains ( SSN, Name,contactNo).  A faculty can also dean a particular department.
Students can be uniquely identified by their Student ID, contains information, (Student ID, Name, program of admission). A student can take admission into at most one program.
Student pays a nominal fee, of some amount, whose details are stored as Payment_Details. Payment_Details can be uniquely identified by Payment_ID with information (Payment ID, Actual amount for no. of courses, payment amount of student, date & time).
Payments are monitored from time to time by an Administrator with information ( Admin ID, Name).
Each Department can have many programs offered in it, but must have at least one program offered in it. Similarly, each department have multiple faculty members in it.  
Faculty, can teach any no. of courses in a semester, but must teach at least one course per semester.  Faculty must be part of a department, and can be part of at most 3 departments. He/she may chair at most one department and may not chair any departments.       
A course must be either credit based or a non-credit based course but can’t be both at the same time. A course can contain any no. of students in it, but must contain at least one student.
 An international student must register in at least 3 courses in a given semester, a student who’s a citizen / permanent resident must register in at least 1 course per semester.
