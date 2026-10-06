# Part 1 Generator: Days 1 to 10
if ($null -eq $global:AllQuestions) { $global:AllQuestions = [System.Collections.Specialized.OrderedDictionary]::new() }

function Add-Q($day, $num, $diff, $q, $o0, $o1, $o2, $o3, $ans, $exp) {
    $dStr = [string]$day
    if (-not $global:AllQuestions.Contains($dStr)) {
        $global:AllQuestions[$dStr] = [System.Collections.ArrayList]@()
    }
    $obj = [PSCustomObject]@{
        id = "d${day}_q${num}"
        diff = $diff
        q = $q
        opts = @($o0, $o1, $o2, $o3)
        ans = [int]$ans
        exp = $exp
    }
    [void]$global:AllQuestions[$dStr].Add($obj)
}

# ==================== DAY 1: Java & OOP Core Foundations ====================
Add-Q 1 1 "Medium" "In Java, what happens when you attempt to override a static method in a subclass?" `
    "Compile-time error occurs" `
    "Method hiding occurs; the method called depends on the reference type" `
    "Runtime exception (IllegalStateException) is thrown" `
    "Standard runtime polymorphism applies" 1 `
    "Static methods belong to the class, not the instance. Declaring an identical static method in a subclass hides the superclass method instead of overriding it."

Add-Q 1 2 "Hard" "Consider: String s1 = 'PlaceEdge'; String s2 = new String('PlaceEdge'); How many objects are created and how does s1 == s2 evaluate?" `
    "1 object created, s1 == s2 is true" `
    "2 objects created, s1 == s2 is false" `
    "1 object created, s1 == s2 is false" `
    "2 objects created, s1 == s2 is true" 1 `
    "'PlaceEdge' literal creates 1 object in the String Constant Pool. 'new String(...)' creates a separate object in the heap. The == operator checks reference equality, so s1 == s2 evaluates to false."

Add-Q 1 3 "Medium" "Which OOP principle is violated if Class B extends Class A, but substituting B for A breaks program correctness?" `
    "Single Responsibility Principle (SRP)" `
    "Open/Closed Principle (OCP)" `
    "Liskov Substitution Principle (LSP)" `
    "Interface Segregation Principle (ISP)" 2 `
    "LSP states that subtypes must be substitutable for their base types without altering program correctness or contracts."

Add-Q 1 4 "Medium" "Why does Java not support multiple inheritance with concrete classes (Diamond Problem)?" `
    "JVM heap memory limitation" `
    "Ambiguity in resolving conflicting method implementations from multiple parents" `
    "Garbage collector cannot track multiple parent hierarchies" `
    "To enforce all classes to be abstract" 1 `
    "If two parent classes provide different implementations of the same method, the compiler cannot determine which method the subclass should inherit."

Add-Q 1 5 "Hard" "In the Java Memory Model (JMM), what guarantee does the 'volatile' keyword provide for a variable?" `
    "Mutual exclusion and atomic compound operations (e.g. count++)" `
    "Visibility across threads and prevention of instruction reordering for reads/writes" `
    "Serialization of the variable to disk" `
    "Automatic synchronization locking on the object monitor" 1 `
    "volatile guarantees visibility: writes to volatile variables are flushed to main memory immediately. It also introduces memory barriers to prevent instruction reordering, but does NOT guarantee atomicity for compound operations."

Add-Q 1 6 "Medium" "What is the primary difference between an abstract class and an interface in modern Java (Java 8+)?" `
    "Interfaces cannot have any method bodies" `
    "Abstract classes can declare state (instance fields), whereas interfaces cannot have instance fields" `
    "A class can inherit multiple abstract classes" `
    "Interfaces support private constructors" 1 `
    "Even though Java 8 introduced default and static methods in interfaces, interfaces still cannot hold instance state (fields are implicitly public static final), while abstract classes can maintain instance variables."

Add-Q 1 7 "Medium" "If class Dog overrides equals() from Object, what MUST it also override to maintain Hash-based collection contracts?" `
    "toString()" `
    "hashCode()" `
    "clone()" `
    "finalize()" 1 `
    "The general contract specifies that if two objects are equal according to equals(), they must produce the identical integer hashCode(). Otherwise, HashSet and HashMap lookups fail."

Add-Q 1 8 "Hard" "What is a memory leak in a managed runtime like the Java Virtual Machine (JVM)?" `
    "Unfreed memory due to missing free() system calls" `
    "Objects that are no longer needed by application logic but are still reachable via live references in the GC root graph" `
    "Corrupted stack pointer in native threads" `
    "Buffer overflow in the young generation eden space" 1 `
    "In managed GC environments, memory leaks occur when references to unused objects are unintentionally retained (e.g., static collections, unclosed listeners), preventing the Garbage Collector from reclaiming them."

Add-Q 1 9 "Medium" "What is the return type behavior when overriding a method in a subclass (Covariant Return Types)?" `
    "The return type must match the superclass method exactly" `
    "The return type can be a subtype of the return type declared in the superclass method" `
    "The return type can be any primitive type" `
    "The return type must be Object" 1 `
    "Java allows covariant return types: an overriding method can declare a return type that is a subclass of the return type declared in the superclass."

Add-Q 1 10 "Medium" "What happens if an uncaught checked exception is thrown inside a Java method?" `
    "It compiles normally and is swallowed at runtime" `
    "The compiler issues a compile-time error unless it is caught or declared in the throws clause" `
    "It converts automatically into a NullPointerException" `
    "It halts the operating system" 1 `
    "Checked exceptions extend Exception (and not RuntimeException) and must either be handled in a try-catch block or explicitly declared using throws in the method signature."

Add-Q 1 11 "Hard" "Why is the final keyword commonly used when designing immutable classes in Java?" `
    "It forces all methods to be static" `
    "It prevents subclassing so that state immutability cannot be bypassed by overridden methods" `
    "It allocates the class memory on the JVM stack" `
    "It automatically encrypts the fields in memory" 1 `
    "Declaring the class final prevents malicious or accidental subclassing where mutability could be reintroduced via overridden methods."

Add-Q 1 12 "Medium" "In Java, what is the default value of an uninitialized instance boolean and an uninitialized Object reference in a class?" `
    "true and null" `
    "false and null" `
    "false and undefined" `
    "0 and 0" 1 `
    "Java initializes instance primitive boolean fields to false and reference types to null by default."

Add-Q 1 13 "Medium" "Which garbage collection generation in JVM HotSpot stores newly allocated objects?" `
    "Old / Tenured Generation" `
    "Metaspace / PermGen" `
    "Eden Space in the Young Generation" `
    "Code Cache" 2 `
    "Newly instantiated objects are first allocated in the Eden space of the Young Generation. Survived objects move to Survivor spaces before aging into Tenured."

Add-Q 1 14 "Hard" "What is the difference between shallow copy and deep copy in object cloning?" `
    "Shallow copy copies references to nested objects; deep copy clones the nested objects recursively" `
    "Shallow copy is thread-safe; deep copy is not" `
    "Shallow copy allocates on the heap; deep copy allocates on the stack" `
    "Shallow copy uses JSON; deep copy uses XML" 0 `
    "Shallow copy duplicates fields as-is, meaning referenced objects are shared. Deep copy constructs duplicate independent instances of all referenced sub-objects."

Add-Q 1 15 "Medium" "Which statement correctly describes method overloading in Java?" `
    "Same method name and parameters, different return type" `
    "Same method name, different parameter count or types, resolved at compile-time" `
    "Same method name and parameters, resolved at runtime via dynamic dispatch" `
    "Methods defined across completely unrelated classes" 1 `
    "Method overloading occurs within the same class when methods share the same name but differ in parameter lists (type, count, or order). It is resolved statically at compile time."

Add-Q 1 16 "Hard" "In Java try-with-resources statement, what interface must the resource implement to support automatic closure?" `
    "java.io.Serializable" `
    "java.lang.Cloneable" `
    "java.lang.AutoCloseable" `
    "java.lang.Runnable" 2 `
    "Any object that implements java.lang.AutoCloseable (or java.io.Closeable) can be used within try-with-resources and will have its close() invoked automatically."

Add-Q 1 17 "Medium" "Can an interface in Java 8+ contain private methods?" `
    "No, interfaces can only have public methods" `
    "Yes, introduced in Java 9 to share code between default methods within the interface" `
    "Yes, private methods are permitted since Java 1.0" `
    "Only if the interface is marked final" 1 `
    "Java 9 introduced private and private static methods in interfaces to avoid boilerplate duplication across multiple default methods without exposing helper methods publicly."

Add-Q 1 18 "Medium" "What is dynamic method dispatch in Object-Oriented Programming?" `
    "Selecting method overload based on argument count at compilation" `
    "Resolving a call to an overridden method at runtime based on the actual object type rather than the reference type" `
    "Dispatching network packets across multiple threads" `
    "Calling private methods via reflection" 1 `
    "Dynamic method dispatch is the mechanism by which a call to an overridden method is resolved at runtime using the actual object referenced, supporting runtime polymorphism."

Add-Q 1 19 "Hard" "Why should you avoid using Thread.stop() in Java concurrency?" `
    "It creates too many kernel context switches" `
    "It unlocks all locked monitors abruptly, leaving shared data in an inconsistent corrupted state" `
    "It only works on 32-bit JVMs" `
    "It throws an uncatchable CheckedException" 1 `
    "Thread.stop() is inherently unsafe and deprecated because it instantly terminates the thread, releasing all acquired locks and potentially exposing inconsistent shared objects."

Add-Q 1 20 "Medium" "Which modifier prevents a variable from being serialized when an object is written using ObjectOutputStream?" `
    "volatile" `
    "transient" `
    "synchronized" `
    "native" 1 `
    "The transient keyword indicates that a field should be skipped during Java object serialization."

Add-Q 1 21 "Hard" "What is the difference between Comparable and Comparator interfaces in Java?" `
    "Comparable provides natural ordering via compareTo(); Comparator provides custom sorting strategies via compare()" `
    "Comparable is in java.util; Comparator is in java.lang" `
    "Comparable can only sort Strings" `
    "There is no difference; they are aliases" 0 `
    "Comparable (compareTo) is implemented by the class itself to define natural order. Comparator (compare) is implemented separately to allow multiple custom sorting orders."

Add-Q 1 22 "Medium" "What is constructor chaining in Java?" `
    "Creating multiple objects in an array" `
    "The process of calling one constructor from another constructor within the same class (this()) or superclass (super())" `
    "Chaining method calls like builder pattern" `
    "Calling constructors via reflection API" 1 `
    "Constructor chaining happens when a constructor delegates initialization to another constructor using this(...) or calls the parent constructor using super(...)."

Add-Q 1 23 "Hard" "In Java, can you synchronize on a primitive type like 'int x'?" `
    "Yes, using synchronized(x)" `
    "No, synchronized requires an object reference monitor" `
    "Yes, if the variable is marked volatile" `
    "Yes, but only in static methods" 1 `
    "The synchronized keyword locks the intrinsic monitor associated with an Object instance. Primitive types (int, float, etc.) do not have object headers or monitors."

Add-Q 1 24 "Medium" "Which design pattern restricts the instantiation of a class to one single object and provides global access?" `
    "Factory Pattern" `
    "Singleton Pattern" `
    "Observer Pattern" `
    "Adapter Pattern" 1 `
    "The Singleton design pattern ensures that a class has only one instance and provides a global access point to that instance."

Add-Q 1 25 "Hard" "What is the output of System.out.println(10 + 20 + 'Java' + 30 + 40) in Java?" `
    "1020Java3040" `
    "30Java70" `
    "30Java3040" `
    "Compilation error" 2 `
    "Left-to-right evaluation: 10 + 20 evaluates to 30. Then 30 + 'Java' performs string concatenation giving '30Java'. Subsequent '+' operations concatenate as strings, yielding '30Java3040'."

# ==================== DAY 2: SQL Joins & Data Filtering Mastery ====================
Add-Q 2 1 "Medium" "What is the difference between WHERE and HAVING clauses in an SQL SELECT statement?" `
    "WHERE filters rows after aggregation; HAVING filters rows before aggregation" `
    "WHERE filters individual rows before grouping; HAVING filters aggregated groups after GROUP BY" `
    "WHERE can only be used with numbers; HAVING with strings" `
    "They are interchangeable synonyms in ANSI SQL" 1 `
    "The WHERE clause filters rows prior to any grouping. The HAVING clause applies predicate filters on aggregate results after the GROUP BY phase."

Add-Q 2 2 "Hard" "Consider: SELECT COUNT(*) FROM table_a, table_b. If table_a has 5 rows and table_b has 10 rows, how many rows are returned?" `
    "1 row with value 15" `
    "1 row with value 50" `
    "50 rows with value 1" `
    "1 row with value 10" 1 `
    "A comma-separated FROM clause without join conditions produces a Cartesian Product (Cross Join): 5 * 10 = 50 rows. COUNT(*) counts these rows and returns a single row containing 50."

Add-Q 2 3 "Medium" "How does an SQL LEFT JOIN handle rows from the left table that have no matching records in the right table?" `
    "It discards them completely" `
    "It includes them with NULL values for all columns from the right table" `
    "It throws a Foreign Key constraint violation" `
    "It duplicates the left table rows twice" 1 `
    "In a LEFT OUTER JOIN, all rows from the left table are preserved. If there is no matching record in the right table, right-side columns are filled with NULLs."

Add-Q 2 4 "Hard" "What is the result of evaluating: SELECT NULL = NULL, NULL IS NULL;" `
    "TRUE, TRUE" `
    "FALSE, TRUE" `
    "UNKNOWN (NULL), TRUE" `
    "UNKNOWN (NULL), FALSE" 2 `
    "In SQL three-valued logic, equality comparison with NULL (NULL = NULL) evaluates to UNKNOWN (represented as NULL), never TRUE. The dedicated predicate 'IS NULL' evaluates to TRUE."

Add-Q 2 5 "Medium" "Which SQL operator performs pattern matching using wildcard characters where '%' represents zero or more characters?" `
    "MATCH" `
    "LIKE" `
    "REGEXP_ONLY" `
    "SIMILAR" 1 `
    "The LIKE operator tests string pattern matches. '%' matches any sequence of zero or more characters, and '_' matches exactly one character."

Add-Q 2 6 "Hard" "What is the key performance difference between UNION and UNION ALL?" `
    "UNION ALL eliminates duplicates using an internal sort/hash; UNION preserves all rows" `
    "UNION performs an expensive distinct sorting/deduplication step; UNION ALL simply concatenates result sets" `
    "UNION is faster because it compresses the result set" `
    "UNION only works with indexed columns" 1 `
    "UNION removes duplicate rows across result sets, requiring a costly sorting or hash-table deduplication step. UNION ALL directly concatenates outputs without checking duplicates, making it substantially faster."

Add-Q 2 7 "Medium" "In an SQL query with JOIN, WHERE, GROUP BY, HAVING, and ORDER BY, which clause is executed first logically?" `
    "WHERE" `
    "FROM & JOIN" `
    "GROUP BY" `
    "ORDER BY" 1 `
    "SQL logical query processing starts with FROM and JOINs to construct the working table set, followed by WHERE, GROUP BY, HAVING, SELECT, and finally ORDER BY."

Add-Q 2 8 "Hard" "How does COUNT(column_name) differ from COUNT(*) when a column contains NULL values?" `
    "COUNT(column_name) ignores NULL values, whereas COUNT(*) counts all rows including NULLs" `
    "COUNT(*) ignores NULL values" `
    "Both produce identical results under all circumstances" `
    "COUNT(column_name) throws a runtime exception on encountering NULL" 0 `
    "COUNT(column_name) counts only non-null occurrences of that specific column. COUNT(*) counts the total number of rows in the table or group regardless of nullability."

Add-Q 2 9 "Medium" "Which SQL JOIN returns only the records that have matching keys in BOTH tables?" `
    "LEFT JOIN" `
    "INNER JOIN" `
    "FULL OUTER JOIN" `
    "CROSS JOIN" 1 `
    "INNER JOIN returns rows where the join condition evaluates to TRUE for records present in both joined tables."

Add-Q 2 10 "Hard" "How do you perform an Anti-Join in SQL to find all customers who have never placed an order?" `
    "SELECT c.* FROM Customers c INNER JOIN Orders o ON c.id = o.cust_id WHERE o.id IS NULL" `
    "SELECT c.* FROM Customers c LEFT JOIN Orders o ON c.id = o.cust_id WHERE o.id IS NULL" `
    "SELECT c.* FROM Customers c RIGHT JOIN Orders o ON c.id = o.cust_id" `
    "SELECT c.* FROM Customers c CROSS JOIN Orders o" 1 `
    "A LEFT JOIN paired with a WHERE condition checking that the right table's primary key 'IS NULL' constitutes an anti-join, selecting rows that have no match in the right table."

Add-Q 2 11 "Medium" "What does the SQL COALESCE(val1, val2, val3) function return?" `
    "The maximum value among arguments" `
    "The first non-NULL expression from the argument list" `
    "The concatenation of all non-NULL strings" `
    "A boolean indicating if all values are NULL" 1 `
    "COALESCE evaluates arguments from left to right and returns the first non-NULL value found. If all arguments are NULL, it returns NULL."

Add-Q 2 12 "Hard" "What is a correlated subquery in SQL?" `
    "A subquery that runs once and stores results in a temporary table" `
    "A subquery that references columns from the outer query and executes once for each row evaluated by the outer query" `
    "A subquery executed concurrently in parallel threads" `
    "A subquery containing a UNION clause" 1 `
    "Correlated subqueries depend on the values of the outer query. The database engine must evaluate the subquery row-by-row for each candidate row in the outer query."

Add-Q 2 13 "Medium" "Which SQL clause is used to eliminate duplicate rows from the final result set?" `
    "UNIQUE" `
    "DISTINCT" `
    "NO_DUPLICATES" `
    "GROUP ON" 1 `
    "The SELECT DISTINCT clause filters the result set to include only unique rows across all selected columns."

Add-Q 2 14 "Hard" "What is the difference between EXISTS and IN when querying with a subquery containing NULLs?" `
    "IN returns FALSE for NULL; EXISTS returns TRUE" `
    "If the subquery returns a NULL, NOT IN may evaluate to UNKNOWN and return zero rows, while NOT EXISTS handles NULL values safely" `
    "EXISTS cannot accept correlated columns" `
    "IN is always converted to an inner join by the query optimizer" 1 `
    "A classic SQL trap: If any row in the subquery returns NULL, 'NOT IN (subquery)' evaluates to UNKNOWN for all rows, returning empty results. 'NOT EXISTS' checks boolean presence and is immune to NULL traps."

Add-Q 2 15 "Medium" "What does the SQL statement 'SELECT department_id, AVG(salary) FROM employees GROUP BY department_id;' compute?" `
    "Overall average salary across all departments" `
    "Average salary calculated separately for each unique department" `
    "The highest salary in each department" `
    "The sum of salaries divided by total company count" 1 `
    "GROUP BY partitions the rows into distinct groups based on department_id, and AVG(salary) calculates the arithmetic mean for each group."

Add-Q 2 16 "Hard" "What is a self-join in SQL, and when is it typically required?" `
    "Joining a table with a system catalog table" `
    "Joining a table to itself, useful for hierarchical structures like employee-manager relationships" `
    "A join that triggers an automatic foreign key constraint check" `
    "A join executed inside a stored procedure" 1 `
    "A self-join occurs when a table is joined with itself using aliasing, commonly used to represent graph or hierarchical tree relations, such as matching employee.manager_id to employee.id."

Add-Q 2 17 "Medium" "Which aggregate function ignores NULL values when calculating results?" `
    "COUNT(*)" `
    "SUM(column_name)" `
    "Neither SUM nor COUNT ignores NULLs" `
    "Only AVG ignores NULLs" 1 `
    "All standard aggregate functions except COUNT(*) (such as SUM, AVG, MIN, MAX, COUNT(col)) ignore NULL values during computation."

Add-Q 2 18 "Hard" "In MySQL, how can you simulate a FULL OUTER JOIN since it is not natively supported?" `
    "Combine a LEFT JOIN and a RIGHT JOIN using UNION" `
    "Use a CROSS JOIN with WHERE left.id = right.id" `
    "Use an INNER JOIN with CASE statements" `
    "FULL OUTER JOIN cannot be simulated" 0 `
    "MySQL simulates a FULL OUTER JOIN by taking the UNION of a LEFT JOIN query and a RIGHT JOIN query, combining matches and non-matching rows from both sides."

Add-Q 2 19 "Medium" "What is the purpose of the SQL LIMIT and OFFSET clauses in pagination?" `
    "LIMIT specifies how many rows to skip; OFFSET specifies total rows to return" `
    "LIMIT specifies maximum rows to return; OFFSET specifies how many rows to skip before returning rows" `
    "They define table memory limits in the buffer pool" `
    "They limit CPU cycles per query" 1 `
    "LIMIT specifies the maximum number of records to return, while OFFSET specifies the number of rows to skip before beginning to return rows."

Add-Q 2 20 "Hard" "Why does pagination using 'OFFSET 100000 LIMIT 10' suffer from severe performance degradation?" `
    "Database memory cache overflows" `
    "The engine must still read and discard 100,000 rows from disk/index before returning the 10 rows" `
    "OFFSET disables primary key indexing completely" `
    "TCP packet buffers drop excess rows" 1 `
    "High OFFSET values require the query engine to scan and evaluate all preceding 100,000 rows before discarding them. Keyset/cursor-based pagination (WHERE id > last_seen_id LIMIT 10) resolves this."

Add-Q 2 21 "Medium" "Which SQL operator allows testing whether a value matches any value in a list or subquery?" `
    "BETWEEN" `
    "IN" `
    "EXISTS" `
    "CONTAINS" 1 `
    "The IN operator allows you to determine if a given value matches any value within a comma-separated list or a single-column subquery."

Add-Q 2 22 "Hard" "What is the difference between ON and WHERE clauses when filtering in a LEFT OUTER JOIN?" `
    "There is no difference" `
    "Conditions in ON determine join matching before outer join row preservation; conditions in WHERE filter the combined result set after join preservation" `
    "ON filters left rows; WHERE filters right rows" `
    "ON is mandatory; WHERE is deprecated" 1 `
    "In a LEFT JOIN, predicates placed in the ON clause determine which right-side rows match, still preserving all left rows. Predicates placed in the WHERE clause filter after the join, potentially removing non-matching left rows."

Add-Q 2 23 "Medium" "Which SQL keyword is used to sort the result set in descending order?" `
    "ASC" `
    "DESC" `
    "DOWN" `
    "REVERSE" 1 `
    "The DESC keyword specified in the ORDER BY clause sorts records in descending order (highest to lowest)."

Add-Q 2 24 "Hard" "What does the query 'SELECT department_id FROM employees GROUP BY department_id HAVING COUNT(*) > 5;' return?" `
    "All employees who belong to departments with more than 5 members" `
    "Only department IDs that have more than 5 employees" `
    "The count of employees for the first 5 departments" `
    "A syntax error because COUNT(*) cannot be used in HAVING" 1 `
    "The query groups employees by department, computes the count for each group, and the HAVING clause filters to return only those department IDs having more than 5 rows."

Add-Q 2 25 "Medium" "What is the standard result of 'SELECT 5 + NULL' in SQL?" `
    "5" `
    "0" `
    "NULL" `
    "Error: Incompatible types" 2 `
    "Any standard arithmetic operation involving a NULL operand in SQL yields NULL, because NULL represents an unknown value."

# ==================== DAY 3: DBMS Keys & Normalization ====================
Add-Q 3 1 "Medium" "What is the fundamental difference between a Primary Key and a Unique Key in relational databases?" `
    "A table can have multiple Primary Keys, but only one Unique Key" `
    "A Primary Key cannot accept NULL values, whereas a Unique Key typically permits one or more NULL values depending on the RDBMS" `
    "Unique keys are not indexed" `
    "Primary keys can only be integer data types" 1 `
    "A Primary Key uniquely identifies rows and strictly prohibits NULL values. A table can have multiple Unique Keys, and Unique constraints permit NULL values."

Add-Q 3 2 "Hard" "What condition must hold for a relation R to be in Boyce-Codd Normal Form (BCNF)?" `
    "Every non-prime attribute is fully functionally dependent on the primary key" `
    "For every non-trivial functional dependency X -> Y, X must be a superkey" `
    "There are no transitive dependencies of non-prime attributes on candidate keys" `
    "All attributes must be numeric" 1 `
    "BCNF is a stricter version of 3NF. It requires that for every non-trivial functional dependency X -> Y, the determinant X must be a superkey of the relation."

Add-Q 3 3 "Medium" "Which Normal Form eliminates partial functional dependencies (where a non-prime attribute depends on only part of a composite candidate key)?" `
    "First Normal Form (1NF)" `
    "Second Normal Form (2NF)" `
    "Third Normal Form (3NF)" `
    "Fourth Normal Form (4NF)" 1 `
    "2NF requires the relation to be in 1NF and guarantees that no non-prime attribute is partially dependent on any candidate key."

Add-Q 3 4 "Hard" "What is the difference between 3NF and BCNF when a table has multiple overlapping candidate keys?" `
    "3NF allows X -> Y if Y is a prime attribute (part of a candidate key), even if X is not a superkey; BCNF strictly forbids this" `
    "3NF requires foreign keys; BCNF does not" `
    "BCNF permits transitive dependencies" `
    "3NF is always lossless; BCNF is always lossy" 0 `
    "In 3NF, a dependency X -> Y is valid if X is a superkey OR Y is a prime attribute. BCNF removes the second lenient condition, requiring X to be a superkey without exception."

Add-Q 3 5 "Medium" "What does the 'A' in ACID properties stand for, and what does it guarantee?" `
    "Availability; the database server is always accessible" `
    "Atomicity; all operations within a transaction complete successfully, or none of them take effect (All or Nothing)" `
    "Authentication; user identity is verified before queries" `
    "Auditability; every query is logged to disk" 1 `
    "Atomicity ensures that all changes within a transaction are treated as a single atomic unit of work: if any statement fails, the entire transaction is rolled back."

Add-Q 3 6 "Hard" "In database transaction management, what is a 'Dirty Read' anomaly?" `
    "Reading data from a corrupted disk sector" `
    "A transaction reads uncommitted data modified by another concurrent transaction that may later roll back" `
    "A transaction reads different values for the same row upon repeated reads" `
    "A transaction re-reads a table and finds new rows inserted by another committed transaction" 1 `
    "A dirty read occurs when Transaction A reads modifications made by Transaction B before Transaction B commits. If Transaction B rolls back, Transaction A operated on invalid data."

Add-Q 3 7 "Medium" "Which transaction isolation level prevents Dirty Reads but still permits Non-Repeatable Reads?" `
    "Read Uncommitted" `
    "Read Committed" `
    "Repeatable Read" `
    "Serializable" 1 `
    "Read Committed guarantees that transactions only read data that has been committed, eliminating dirty reads. However, subsequent reads of the same row may show different values if another transaction commits updates."

Add-Q 3 8 "Hard" "What is the purpose of the Write-Ahead Logging (WAL) protocol in DBMS recovery?" `
    "Log entries are written to non-volatile disk BEFORE corresponding dirty data pages in memory are written to disk" `
    "Data pages are written to disk before transactions begin" `
    "Log entries are written only when the system shuts down" `
    "WAL compresses SQL queries to save network bandwidth" 0 `
    "WAL mandates that log records describing a change must be flushed to non-volatile storage before the actual dirty database pages are written. This ensures Atomicity and Durability during crashes."

Add-Q 3 9 "Medium" "What is a Foreign Key constraint?" `
    "A key used for encrypting external network traffic" `
    "A column or set of columns in one table that references the primary key or unique key of another table to maintain referential integrity" `
    "A key that automatically increments on insertion" `
    "A secondary index stored on remote database servers" 1 `
    "A Foreign Key establishes a relationship between two tables, ensuring that values in the child table correspond to valid existing records in the parent table."

Add-Q 3 10 "Hard" "What does ON DELETE CASCADE specify for a Foreign Key relationship?" `
    "Deleting a child row automatically deletes the parent row" `
    "Deleting a parent row automatically deletes all matching child rows in the referenced table" `
    "Prevents parent deletion if child rows exist" `
    "Sets foreign key values in child rows to NULL" 1 `
    "ON DELETE CASCADE ensures that when a record in the parent table is deleted, all dependent rows referencing that parent record in the child table are deleted automatically."

Add-Q 3 11 "Medium" "A relation is in First Normal Form (1NF) if and only if:" `
    "It has no foreign keys" `
    "All column values are atomic (indivisible) and there are no repeating groups" `
    "Every column is part of the primary key" `
    "It contains at least 3 tables" 1 `
    "1NF requires that each column contains only atomic (single indivisible) values and that there are no repeating groups or arrays stored in a single attribute."

Add-Q 3 12 "Hard" "What is the definition of a Candidate Key in relational schema design?" `
    "Any column with an index" `
    "A minimal superkey; a set of attributes that uniquely identifies tuples such that no proper subset can do so" `
    "The key chosen by the database administrator to be the primary key" `
    "A key containing only foreign references" 1 `
    "A Candidate Key is a minimal superkey. It possesses two properties: Uniqueness (identifies any tuple uniquely) and Irreducibility (no attribute can be removed without losing uniqueness)."

Add-Q 3 13 "Medium" "What does the 'I' in ACID properties stand for?" `
    "Integrity" `
    "Isolation" `
    "Indexing" `
    "Idempotency" 1 `
    "Isolation ensures that concurrent execution of transactions results in a system state equivalent to serial execution, shielding transactions from interference."

Add-Q 3 14 "Hard" "In Strict Two-Phase Locking (Strict 2PL), when are exclusive (X) locks released?" `
    "Immediately after the write operation finishes" `
    "At the end of the transaction after commit or abort" `
    "During the shrinking phase before commit" `
    "When another transaction requests a shared lock" 1 `
    "Strict 2PL requires that all exclusive locks held by a transaction be retained until the transaction finishes (commit or rollback), preventing cascading rollbacks."

Add-Q 3 15 "Medium" "What is a Surrogate Key?" `
    "A natural business key like Social Security Number" `
    "An artificial primary key (like an auto-incrementing integer or UUID) with no intrinsic domain meaning" `
    "A key derived from concatenating all table columns" `
    "A secondary index used for full-text search" 1 `
    "A surrogate key is an artificially created identifier with no business meaning (e.g. auto-increment ID or UUID) used purely for row identification."

Add-Q 3 16 "Hard" "What is a Phantom Read anomaly?" `
    "A transaction reads updated values of an existing row" `
    "A transaction executes a range query twice and finds new rows that were inserted and committed by another transaction in between" `
    "Reading data that was never written to disk" `
    "A transaction reading from an uncommitted snapshot" 1 `
    "Phantom reads occur when a transaction queries a range of rows (e.g. WHERE salary > 50000), and another transaction inserts a new qualifying row and commits, causing the first transaction to see phantom rows upon re-query."

Add-Q 3 17 "Medium" "What is a transitive dependency in normalization theory?" `
    "When attribute A determines B, and B determines C, so A indirectly determines C where B is non-prime" `
    "When two primary keys reference each other" `
    "When a table references itself via a foreign key" `
    "When a query joins more than three tables" 0 `
    "A transitive dependency occurs when non-key attribute X determines non-key attribute Y, and Y determines non-key attribute Z. Third Normal Form (3NF) eliminates this."

Add-Q 3 18 "Hard" "What is Armstrong's Axiom of Augmentation?" `
    "If X -> Y, then XZ -> YZ for any attribute set Z" `
    "If X -> Y and Y -> Z, then X -> Z" `
    "If Y is a subset of X, then X -> Y" `
    "If X -> Y, then Y -> X" 0 `
    "The Augmentation rule states that if functional dependency X -> Y holds, then adding attributes Z to both sides yields valid dependency XZ -> YZ."

Add-Q 3 19 "Medium" "What is the difference between a dense index and a sparse index?" `
    "Dense index has an entry for every search key in the file; sparse index has entries only for some search keys (e.g. block headers)" `
    "Dense index is stored on SSD; sparse index on HDD" `
    "Dense index uses strings; sparse index uses integers" `
    "Dense index requires no memory" 0 `
    "A dense index maintains an index record for every single search key value in the table. A sparse index maintains records for only a subset of search keys (usually one per data block)."

Add-Q 3 20 "Hard" "What ensures the 'Durability' property in ACID guarantees even during sudden power failure?" `
    "RAM battery backup" `
    "Redo logging and flushing committed transactions to non-volatile disk/SSD" `
    "Executing queries asynchronously" `
    "Compressing table indexes" 1 `
    "Durability guarantees that once a transaction commits, its updates survive system crashes. This is achieved via write-ahead logging (WAL) where redo logs are synchronously flushed (fsync) to disk."

Add-Q 3 21 "Medium" "What is a composite primary key?" `
    "A primary key composed of two or more columns that together uniquely identify a record" `
    "A primary key that references an external database" `
    "A primary key that encrypts data" `
    "A primary key defined across two different database engines" 0 `
    "A composite primary key consists of multiple columns whose combined values uniquely identify each row in a table."

Add-Q 3 22 "Hard" "What is the Precedence Graph (Serialization Graph) used for in DBMS concurrency control?" `
    "Measuring query execution latency" `
    "Testing whether a concurrent transaction schedule is Conflict Serializable (acyclic graph indicates serializable)" `
    "Balancing B+ tree nodes" `
    "Determining foreign key dependencies between tables" 1 `
    "A precedence graph models transaction read/write conflicts. If the directed graph contains no cycles, the execution schedule is proven to be conflict serializable."

Add-Q 3 23 "Medium" "Which SQL command is used to revoke changes made during an uncommitted transaction?" `
    "COMMIT" `
    "ROLLBACK" `
    "SAVEPOINT" `
    "TRUNCATE" 1 `
    "The ROLLBACK statement aborts the current transaction and restores data to the state prior to transaction initiation."

Add-Q 3 24 "Hard" "What is a Lossless-Join Decomposition in relational database normalization?" `
    "A decomposition where no tables have foreign keys" `
    "A decomposition where joining the decomposed relations yields exactly the original relation without losing or introducing spurious tuples" `
    "A decomposition that avoids NULL values" `
    "A decomposition where all tables fit in RAM" 1 `
    "Lossless join decomposition guarantees that when decomposed relations are reconstructed via natural join, the result is identical to the original relation with no spurious rows introduced."

Add-Q 3 25 "Medium" "What is the highest isolation level defined by ANSI SQL?" `
    "Read Committed" `
    "Repeatable Read" `
    "Serializable" `
    "Snapshot Isolation" 2 `
    "Serializable is the strictest isolation level. It prevents dirty reads, non-repeatable reads, and phantom reads by enforcing execution equivalent to serial execution."

# ==================== DAY 4: Operating Systems Process & Threads ====================
Add-Q 4 1 "Medium" "What is the primary architectural difference between a Process and a Thread?" `
    "Threads have independent memory address spaces; processes share address spaces" `
    "A process has its own private address space and resources; threads within a process share code, data, and open files while maintaining their own stack and registers" `
    "Processes cannot run concurrently; threads can" `
    "Threads are scheduled only by user-space code" 1 `
    "A process is an executing program with dedicated virtual memory and system resources. Threads are lightweight units of execution within a process that share memory, files, and heap."

Add-Q 4 2 "Hard" "What are the four Coffman conditions required for a Deadlock to occur?" `
    "Mutual Exclusion, Hold and Wait, No Preemption, Circular Wait" `
    "Paging, Segmentation, Swapping, Thrashing" `
    "Race Condition, Starvation, Aging, Context Switching" `
    "Atomicity, Consistency, Isolation, Durability" 0 `
    "Deadlock can occur if and only if all four Coffman conditions hold simultaneously: Mutual Exclusion, Hold and Wait, No Preemption, and Circular Wait."

Add-Q 4 3 "Medium" "What occurs during an operating system Context Switch?" `
    "Compiling source code to machine assembly" `
    "Saving the CPU state (registers, PC) of the currently running process and loading the saved state of the next scheduled process" `
    "Switching network interfaces from Wi-Fi to Ethernet" `
    "Allocating new virtual memory pages to disk" 1 `
    "A context switch pauses the currently running process, saves its hardware registers and program counter into its PCB, and restores the state of the scheduled process."

Add-Q 4 4 "Hard" "In Linux/Unix, what is a Zombie Process and how is it cleaned up?" `
    "A process running without CPU scheduling" `
    "A terminated child process whose exit status has not yet been read by its parent via the wait() system call" `
    "A process whose parent has died and been adopted by init" `
    "A malicious daemon consuming 100% CPU" 1 `
    "When a child finishes execution, it becomes a zombie until its parent calls wait() to read its termination status, releasing its entry in the process table."

Add-Q 4 5 "Medium" "What is an Orphan Process in Unix/Linux, and what happens to it?" `
    "A process that crashes immediately on startup" `
    "A child process whose parent process terminated before it; it is adopted by the init / systemd process (PID 1)" `
    "A process with no threads" `
    "A process that cannot access the filesystem" 1 `
    "An orphan process is a running child process whose parent has terminated. The operating system re-parents the orphan to init (PID 1), which reaps its exit status when it terminates."

Add-Q 4 6 "Hard" "What is the 'Convoy Effect' observed in CPU scheduling algorithms?" `
    "When short processes wait behind a long CPU-bound process in First-Come, First-Served (FCFS) scheduling" `
    "When threads deadlock on circular mutex acquisitions" `
    "When cache memory thrashes due to high context switching" `
    "When multiple processes simultaneously request network I/O" 0 `
    "In FCFS scheduling, when a long CPU-burst process monopolizes the CPU, all subsequent shorter I/O-bound processes are stuck waiting, lowering overall CPU and device utilization."

Add-Q 4 7 "Medium" "Which CPU scheduling algorithm gives the minimum average waiting time for a given set of processes?" `
    "First-Come, First-Served (FCFS)" `
    "Shortest Job First (SJF) / Shortest Remaining Time First (SRTF)" `
    "Round Robin (RR)" `
    "Priority Scheduling without aging" 1 `
    "SJF (provably optimal for non-preemptive) and SRTF (preemptive) provide the lowest theoretical average waiting time by scheduling shorter bursts first."

Add-Q 4 8 "Hard" "What is the critical section problem, and which three requirements must any valid solution satisfy?" `
    "Mutual Exclusion, Progress, Bounded Waiting" `
    "Throughput, Latency, Turnaround Time" `
    "Atomicity, Consistency, Durability" `
    "Starvation, Deadlock, Aging" 0 `
    "A synchronization mechanism solving the critical section problem must guarantee: Mutual Exclusion (only one process at a time), Progress (no deadlock on entry), and Bounded Waiting (no starvation)."

Add-Q 4 9 "Medium" "What is the primary difference between a Counting Semaphore and a Binary Semaphore?" `
    "Binary semaphore holds values 0 or 1; counting semaphore can hold any non-negative integer representing available resource units" `
    "Counting semaphores are implemented in hardware only" `
    "Binary semaphores allow multiple threads to access resources simultaneously" `
    "Counting semaphores cannot deadlock" 0 `
    "A binary semaphore's value is restricted to 0 and 1 (acting like a mutex lock). A counting semaphore tracks an arbitrary integer count of identical available resource units."

Add-Q 4 10 "Hard" "What is a Spinlock, and in which scenario is it preferred over a sleeping mutex lock?" `
    "A lock that spins disk drives" `
    "A lock where a waiting thread busy-waits in a loop; preferred in multiprocessor systems when expected lock hold time is shorter than context-switch overhead" `
    "A lock used exclusively in user-space Node.js applications" `
    "A lock that automatically resolves circular wait conditions" 1 `
    "A spinlock performs busy waiting (polling). On multicore systems, if the critical section is extremely short, spinning avoids the expensive CPU cost of sleeping and context switching."

Add-Q 4 11 "Medium" "What does the fork() system call return to the parent process upon successful creation of a child?" `
    "0" `
    "The Process ID (PID) of the newly created child process" `
    "-1" `
    "The parent's own PID" 1 `
    "fork() returns 0 to the newly created child process and returns the positive child PID to the parent process (or -1 on failure)."

Add-Q 4 12 "Hard" "How does the Banker's Algorithm ensure deadlock avoidance in operating systems?" `
    "It terminates the lowest priority process when deadlock occurs" `
    "It simulates allocation of requested resources and only grants them if the resulting system state remains in a 'Safe State'" `
    "It prevents processes from acquiring more than one resource" `
    "It periodically pre-empts CPU bursts" 1 `
    "Dijkstra's Banker's Algorithm checks resource requests against maximum claims. A request is granted only if there exists a safe execution sequence where all processes can finish without deadlock."

Add-Q 4 13 "Medium" "What problem arises in Round Robin scheduling if the time quantum is chosen to be excessively small?" `
    "Starvation of long processes" `
    "Excessive context switching overhead dominates CPU execution time" `
    "Turnaround time becomes zero" `
    "Processes convert to kernel threads" 1 `
    "If the time quantum is too small, the system spends a disproportionate amount of CPU time performing context switches instead of executing useful process instructions."

Add-Q 4 14 "Hard" "What technique is used in Priority Scheduling to prevent indefinite starvation of low-priority processes?" `
    "Compaction" `
    "Aging (gradually increasing the priority of processes that wait for a long time)" `
    "Swapping to swap partition" `
    "Spinlocking" 1 `
    "Aging is a technique where the scheduler gradually increases the priority of waiting processes over time, ensuring even low-priority jobs eventually get executed."

Add-Q 4 15 "Medium" "What data structure does the operating system use to store all metadata about an individual process?" `
    "Process Control Block (PCB)" `
    "File Allocation Table (FAT)" `
    "Page Directory Table (PDT)" `
    "Interrupt Vector Table (IVT)" 0 `
    "The PCB (Process Control Block) contains process state, PID, program counter, CPU registers, CPU scheduling info, memory limits, and list of open files."

Add-Q 4 16 "Hard" "What is the difference between Preemptive and Non-Preemptive CPU scheduling?" `
    "Preemptive allows the OS to interrupt a running process before its CPU burst finishes; non-preemptive lets the process hold the CPU until it terminates or yields" `
    "Non-preemptive scheduling causes zero waiting time" `
    "Preemptive scheduling is only used for batch systems" `
    "Non-preemptive scheduling eliminates context switching completely" 0 `
    "Preemptive scheduling permits the operating system kernel to forcibly interrupt a running process (e.g. on timer interrupt or higher priority arrival). Non-preemptive waits until the process voluntarily yields or halts."

Add-Q 4 17 "Medium" "In the Producer-Consumer problem, what synchronization primitive is typically used to prevent buffer overflow and underflow?" `
    "Two counting semaphores (empty and full) and a mutex for buffer access" `
    "A single global boolean flag" `
    "A software timer interrupt" `
    "Priority aging queues" 0 `
    "Classic solution uses an 'empty' semaphore initialized to buffer size, a 'full' semaphore initialized to 0, and a binary mutex protecting mutual exclusion during buffer modification."

Add-Q 4 18 "Hard" "What is Peterson's Algorithm in operating system theory?" `
    "A disk scheduling algorithm for SSDs" `
    "A classic software-based mutual exclusion algorithm for two concurrent processes using a flag array and a turn variable" `
    "A page replacement algorithm" `
    "A network packet routing protocol" 1 `
    "Peterson's algorithm is a software solution for two processes that satisfies mutual exclusion, progress, and bounded waiting using shared boolean flags and a shared turn variable."

Add-Q 4 19 "Medium" "Which inter-process communication (IPC) mechanism provides the fastest data exchange between processes on the same machine?" `
    "Network Sockets" `
    "Pipes" `
    "Shared Memory" `
    "Message Queues" 2 `
    "Shared memory is the fastest IPC mechanism because processes map the same physical RAM pages into their virtual address spaces, avoiding costly data copying across user/kernel boundaries."

Add-Q 4 20 "Hard" "What is the difference between User-Level Threads (ULT) and Kernel-Level Threads (KLT)?" `
    "ULT management is performed in user space without kernel awareness, but a blocking system call blocks the entire process; KLTs are managed directly by the OS kernel" `
    "ULTs can utilize multiple CPU cores concurrently; KLTs cannot" `
    "ULTs require more context switch overhead than KLTs" `
    "KLTs cannot execute user code" 0 `
    "User threads are scheduled by a user runtime library. Because the OS kernel only sees the parent process, if one user thread blocks on I/O, the entire process is put to sleep."

Add-Q 4 21 "Medium" "What is Turnaround Time in CPU scheduling evaluation?" `
    "Time taken to switch context between two processes" `
    "Total time elapsed from process submission to process completion" `
    "Time spent waiting in the ready queue" `
    "Time until the first output response is produced" 1 `
    "Turnaround Time is the interval between the submission of a process and its completion (Turnaround Time = Completion Time - Arrival Time)."

Add-Q 4 22 "Hard" "Why is the Test-and-Set instruction executed atomically by CPU hardware?" `
    "To prevent interrupt handling during network packets" `
    "To ensure reading and writing a lock variable happens in a single indivisible clock cycle, preventing race conditions" `
    "To speed up disk I/O operations" `
    "To allocate virtual memory frames" 1 `
    "Atomic hardware instructions like Test-and-Set and Compare-and-Swap execute indivisibly, enabling correct implementation of low-level mutual exclusion locks in multicore CPUs."

Add-Q 4 23 "Medium" "What process state transition occurs when a running process requests disk I/O?" `
    "Running -> Ready" `
    "Running -> Waiting / Blocked" `
    "Waiting -> Running" `
    "Running -> Terminated" 1 `
    "When a process issues a blocking I/O request, it cannot continue executing on the CPU until the I/O finishes; the OS moves it to the Waiting (Blocked) state."

Add-Q 4 24 "Hard" "In the Readers-Writers synchronization problem, what issue arises if readers are given absolute priority over writers?" `
    "Deadlock on reading" `
    "Writer starvation (writers may wait indefinitely if readers arrive continuously)" `
    "Buffer overflow in the reader queue" `
    "Corrupted read output" 1 `
    "In the first readers-writers problem (reader preference), as long as at least one reader is actively holding the shared read lock, new arriving readers can enter, causing writer starvation."

Add-Q 4 25 "Medium" "What is the difference between a Program and a Process?" `
    "A program is active in memory; a process is passive on disk" `
    "A program is passive code stored on disk; a process is an active program in execution loaded in memory" `
    "Programs are compiled; processes are interpreted" `
    "There is no difference" 1 `
    "A program is a passive entity (executable binary stored on disk), whereas a process is an active entity loaded into RAM with a program counter, registers, and execution stack."

Write-Output "Part 1 Loaded successfully."
