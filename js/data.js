/* ============================================================
   DATA LAYER · SUBJECT SYLLABUS & REPO DATA
   Extracted from 75 placement-cell interview PDFs.
   ============================================================ */
const GFG = 'https://www.geeksforgeeks.org/';
const SUBJECTS = [
  {
    id: 'java', name: 'Java', icon: '☕', topics: [
      { id: 'jv1', n: 'JVM, JRE & JDK', g: GFG + 'differences-jdk-jre-jvm/', c: ['MiQ Digital', 'Fidelity'] },
      { id: 'jv2', n: 'Data Types & Variables', g: GFG + 'data-types-in-java/', c: ['TCS'] },
      { id: 'jv3', n: 'String Immutability & String Pool', g: GFG + 'string-immutable-final-java/', c: ['MiQ Digital'] },
      { id: 'jv4', n: '== vs .equals()', g: GFG + 'difference-equals-method-java/', c: ['MiQ Digital'] },
      { id: 'jv5', n: 'Static Keyword & Static Variables', g: GFG + 'static-keyword-java/', c: ['TCS', 'Epicor', 'Sap Labs'] },
      { id: 'jv6', n: 'super & this Keywords', g: GFG + 'super-keyword/', c: ['Epicor'] },
      { id: 'jv7', n: 'Collections Framework', g: GFG + 'collections-in-java-2/', c: ['A.P. Moller Maersk'] },
      { id: 'jv8', n: 'HashMap vs Array vs ArrayList', g: GFG + 'internal-working-of-hashmap-java/', c: ['A.P. Moller Maersk', 'Lowe\'s India'] },
      { id: 'jv9', n: 'Exception Handling (try/catch/finally, throws)', g: GFG + 'exceptions-in-java/', c: ['Siemens', 'London Stock Exchange', 'Dish Network', 'Akamai', 'Epicor'] },
      { id: 'jv10', n: 'Checked vs Unchecked Exceptions', g: GFG + 'checked-vs-unchecked-exceptions-in-java/', c: ['Siemens'] },
      { id: 'jv11', n: 'Interfaces & Abstract Classes in Java', g: GFG + 'difference-between-abstract-class-and-interface-in-java/', c: ['TCS', 'MiQ Digital', 'Kasmo Digital', 'Fidelity', 'Schneider Electric'] },
      { id: 'jv12', n: 'Why Multiple Inheritance is not in Java (Diamond Problem)', g: GFG + 'java-and-multiple-inheritance/', c: ['A.P. Moller Maersk', 'RedBus', 'Fidelity', 'TCS'] },
      { id: 'jv13', n: 'Multithreading & Thread Safety in Java', g: GFG + 'multithreading-in-java/', c: ['Akamai', 'Commscope', 'Fidelity', 'Applied Materials'] },
      { id: 'jv14', n: 'Garbage Collection & Memory Management', g: GFG + 'garbage-collection-java/', c: ['Akamai'] },
      { id: 'jv15', n: 'Why Java is not a Pure OOP Language', g: GFG + 'why-java-is-not-a-purely-object-oriented-language/', c: ['TE Connectivity'] },
    ]
  },
  {
    id: 'oop', name: 'OOP', icon: '🧩', topics: [
      { id: 'op1', n: 'Classes & Objects', g: GFG + 'classes-objects-java/', c: ['LG Soft', 'Epicor', 'TCS', 'Sap Labs', 'Akamai'] },
      { id: 'op2', n: 'Four Pillars of OOP', g: GFG + 'introduction-of-object-oriented-programming/', c: ['Amadeus', 'Aptiv', 'Big Basket', 'Commscope', 'Dish Network', 'HPE', 'Lam Research', 'LG Soft', 'Onetrust', 'Thoughtworks', 'Cognizant', 'Haladoc', 'Kasmo Digital', 'Miq Digital', 'Samsung', 'Fidelity', 'RedBus'] },
      { id: 'op3', n: 'Encapsulation (with data security)', g: GFG + 'encapsulation-in-java/', c: ['Commscope', 'Light And Wonder', 'Epicor', 'TE Connectivity', 'Incture'] },
      { id: 'op4', n: 'Abstraction vs Encapsulation', g: GFG + 'difference-between-abstraction-and-encapsulation-in-java-with-examples/', c: ['Lam Research', 'MiQ Digital', 'Commscope', 'Spense'] },
      { id: 'op5', n: 'Inheritance & its Types', g: GFG + 'inheritance-in-java/', c: ['Cognizant', 'TCS', 'Target', 'Big Basket', 'Thoughtworks', 'WD', 'Oracle', 'A.P. Moller Maersk', 'Haladoc'] },
      { id: 'op6', n: 'Polymorphism (Compile-time vs Runtime)', g: GFG + 'polymorphism-in-java/', c: ['Applied Materials', 'HPE', 'Oracle', 'Anora', 'Samsung', 'Kasmo Digital', 'LG Soft', 'Sap Labs'] },
      { id: 'op7', n: 'Method Overloading vs Overriding', g: GFG + 'difference-between-method-overloading-and-method-overriding-in-java/', c: ['Amadeus', 'Big Basket', 'Dish Network', 'HPE', 'Emerson', 'LG Soft', 'Lam Research', 'Siemens', 'Infosys', 'TCS', 'Akamai'] },
      { id: 'op8', n: 'Constructors & Destructors (+ types, copy constructor)', g: GFG + 'constructors-c/', c: ['Applied Materials', 'Aptiv', 'HPE', 'Thoughtworks', 'LG Soft', 'Akamai', 'Commscope'] },
      { id: 'op9', n: 'Virtual Functions & Pure Virtual Functions', g: GFG + 'virtual-function-cpp/', c: ['Amadeus', 'Aptiv', 'HPE', 'Siemens', 'Target', 'Tejas Networks', 'Thoughtworks', 'Light And Wonder', 'LG Soft'] },
      { id: 'op10', n: 'Abstract Class vs Interface', g: GFG + 'difference-between-abstract-class-and-interface-in-java/', c: ['London Stock Exchange', 'MiQ Digital', 'Kasmo Digital', 'Lam Research', 'Epicor'] },
      { id: 'op11', n: 'Diamond Problem in Inheritance', g: GFG + 'diamond-problem-in-cpp/', c: ['RedBus', 'Fidelity', 'Big Basket'] },
      { id: 'op12', n: 'Friend & Virtual Functions in C++', g: GFG + 'friend-class-function-cpp/', c: ['Amadeus', 'Tejas Networks'] },
      { id: 'op13', n: 'Shallow Copy vs Deep Copy', g: GFG + 'shallow-copy-and-deep-copy-in-c/', c: ['Aptiv', 'Thoughtworks', 'Onetrust', 'L7 Informatics'] },
      { id: 'op14', n: 'Access Modifiers / Specifiers', g: GFG + 'access-modifiers-java/', c: ['Applied Materials', 'HPE', 'LG Soft', 'Epicor', 'WD'] },
      { id: 'op15', n: 'Structures vs Unions vs Classes', g: GFG + 'difference-between-structure-and-union-c/', c: ['Aptiv', 'LG Soft', 'Onetrust', 'TCS'] },
      { id: 'op16', n: 'Getters, Setters & Object Lifecycle', g: GFG + 'getter-and-setter-in-java/', c: ['Epicor', 'Incture'] },
    ]
  },
  {
    id: 'dbms', name: 'DBMS', icon: '🗄️', topics: [
      { id: 'db1', n: 'DBMS vs RDBMS & File Systems', g: GFG + 'difference-between-rdbms-and-dbms/', c: ['Dish Network', 'Kasmo Digital', 'TCS', 'Fidelity', 'A.P. Moller Maersk'] },
      { id: 'db2', n: 'ER Diagrams & Schema Design', g: GFG + 'introduction-of-er-model/', c: ['Haladoc', 'HashedIn by Deloitte', 'Lowe\'s India', 'RedBus', 'Akamai', 'Lam Research', 'Alstom', 'Spense', 'MiQ Digital'] },
      { id: 'db3', n: 'Keys: Primary, Foreign, Unique, Composite', g: GFG + 'types-of-keys-in-relational-model-candidate-super-primary-alternate-and-foreign/', c: ['Dish Network', 'TCS', 'WD', 'UKG', 'Oit Dahramyan', 'MiQ Digital', 'Epicor', 'A.P. Moller Maersk', 'Afford Medical', 'Fidelity', 'Haladoc'] },
      { id: 'db4', n: 'Normalization (1NF → BCNF → 5NF)', g: GFG + 'normal-forms-in-dbms/', c: ['Amadeus', 'Big Basket', 'Dish Network', 'Havells', 'HPE', 'Sap Labs', 'UKG', 'Kasmo Digital', 'MiQ Digital', 'RedBus', 'Cognizant', 'Fidelity', 'Akamai'] },
      { id: 'db5', n: 'ACID Properties & Transactions', g: GFG + 'acid-properties-in-dbms/', c: ['Cognizant', 'Haladoc', 'Havells', 'MiQ Digital', 'TransUnion', 'TE Connectivity', 'Sap Labs', 'Fidelity', 'A.P. Moller Maersk', 'Afford Medical', 'Target'] },
      { id: 'db6', n: 'Indexing & its Types (Bitmap vs B-Tree)', g: GFG + 'indexing-in-databases-set-1/', c: ['Big Basket', 'Haladoc', 'Lam Research', 'TCS', 'Oit Dahramyan', 'Fidelity', 'Afford Medical', 'Oracle'] },
      { id: 'db7', n: 'Locks, Concurrency & Isolation Levels', g: GFG + 'lock-based-concurrency-control-protocol-in-dbms/', c: ['Big Basket', 'Havells', 'MiQ Digital', 'RedBus', 'Fidelity'] },
      { id: 'db8', n: 'Deadlock in DBMS', g: GFG + 'deadlock-in-dbms/', c: ['Thoughtworks', 'Haladoc', 'MiQ Digital'] },
      { id: 'db9', n: 'SQL vs NoSQL (MySQL vs MongoDB)', g: GFG + 'difference-between-sql-and-nosql/', c: ['Big Basket', 'Commscope', 'HPE', 'Incture', 'Light And Wonder', 'London Stock Exchange', 'Lowe\'s India', 'RedBus', 'Target', 'MiQ Digital', 'A.P. Moller Maersk', 'Lam Research', 'Schneider Electric', 'Fidelity', 'TE Connectivity'] },
      { id: 'db10', n: 'MongoDB Internals (ObjectId, documents, indexing)', g: GFG + 'mongodb-an-introduction/', c: ['RedBus', 'Onetrust', 'Commscope', 'A.P. Moller Maersk', 'Azentio'] },
      { id: 'db11', n: 'Stored Procedures, Functions & Triggers', g: GFG + 'what-is-stored-procedures-in-sql/', c: ['Oracle', 'Havells', 'UKG', 'WD', 'Kasmo Digital', 'Sap Labs', 'Lowe\'s India'] },
      { id: 'db12', n: 'Views in SQL', g: GFG + 'sql-views/', c: ['Oracle', 'UKG', 'TE Connectivity', 'Fidelity'] },
      { id: 'db13', n: 'DDL, DML, DCL, TCL, DQL', g: GFG + 'sql-ddl-dql-dml-dcl-tcl-commands/', c: ['Oracle', 'Sap Labs', 'Epicor'] },
      { id: 'db14', n: 'Three-Schema Architecture & Data Independence', g: GFG + 'three-schema-architecture-of-dbms/', c: ['HashedIn by Deloitte', 'Havells', 'WD'] },
      { id: 'db15', n: 'Partitioning & Sharding', g: GFG + 'database-sharding-a-system-design-concept/', c: ['Big Basket', 'Afford Medical'] },
    ]
  },
  {
    id: 'sql', name: 'SQL', icon: '🧮', topics: [
      { id: 'sq1', n: 'SELECT, INSERT, UPDATE, DELETE basics', g: GFG + 'sql-tutorial/', c: ['Cognizant', 'A.P. Moller Maersk', 'WD', 'Oracle'] },
      { id: 'sq2', n: 'Joins (INNER, LEFT, RIGHT, FULL, SELF, CROSS)', g: GFG + 'sql-join-set-1-inner-left-right-and-full-joins/', c: ['Big Basket', 'Dish Network', 'Haladoc', 'Havells', 'Kasmo Digital', 'Lam Research', 'Lowe\'s India', 'MathCo', 'MiQ Digital', 'Oracle', 'RedBus', 'Sap Labs', 'TE Connectivity', 'Thoughtworks', 'UKG', 'WD', 'Fidelity', 'Akamai', 'A.P. Moller Maersk', 'Spense', 'Oit Dahramyan', 'Epicor', 'Cognizant', 'Onetrust', 'TCS'] },
      { id: 'sq3', n: 'Second / Nth Highest Salary patterns', g: GFG + 'find-the-second-largest-value-in-sql/', c: ['Dish Network', 'HashedIn by Deloitte', 'Oracle', 'UKG', 'Kasmo Digital', 'MiQ Digital', 'Epicor', 'A.P. Moller Maersk', 'Schneider Electric'] },
      { id: 'sq4', n: 'GROUP BY & Aggregate Functions', g: GFG + 'aggregate-functions-in-sql/', c: ['Big Basket', 'Dish Network', 'Thoughtworks', 'WD', 'Kasmo Digital', 'RedBus', 'Incture', 'Spense', 'Epicor', 'TE Connectivity', 'Onetrust'] },
      { id: 'sq5', n: 'WHERE vs HAVING', g: GFG + 'difference-between-where-and-having-clause-in-sql/', c: ['Lam Research', 'Sap Labs', 'Thoughtworks', 'Oracle', 'Epicor'] },
      { id: 'sq6', n: 'Subqueries & Nested Queries', g: GFG + 'sql-subquery/', c: ['Sap Labs', 'TCS', 'TE Connectivity', 'Spense'] },
      { id: 'sq7', n: 'Window Functions (RANK, DENSE_RANK, ROW_NUMBER)', g: GFG + 'window-functions-in-sql/', c: ['WD', 'Kasmo Digital', 'Dish Network', 'Schneider Electric'] },
      { id: 'sq8', n: 'DELETE vs TRUNCATE vs DROP', g: GFG + 'difference-between-delete-drop-and-truncate/', c: ['Lam Research', 'Oracle', 'Sap Labs', 'Kasmo Digital'] },
      { id: 'sq9', n: 'UNION vs UNION ALL', g: GFG + 'union-and-union-all-in-sql/', c: ['Sap Labs', 'Kasmo Digital', 'TE Connectivity'] },
      { id: 'sq10', n: 'Constraints (NOT NULL, CHECK, DEFAULT…)', g: GFG + 'sql-constraints/', c: ['Dish Network', 'WD', 'Oracle'] },
      { id: 'sq11', n: 'Finding & Deleting Duplicate Records', g: GFG + 'sql-query-to-delete-duplicate-rows/', c: ['Dish Network', 'HashedIn by Deloitte', 'RedBus', 'Onetrust', 'Lam Research', 'Target'] },
      { id: 'sq12', n: 'Wildcards & LIKE Operator', g: GFG + 'sql-wildcard-operators/', c: ['TE Connectivity', 'Kasmo Digital'] },
      { id: 'sq13', n: 'Transactions, COMMIT & ROLLBACK', g: GFG + 'sql-transactions/', c: ['Oracle', 'UKG', 'Target', 'Schneider Electric'] },
      { id: 'sq14', n: 'Query Optimization for Large Datasets', g: GFG + 'sql-query-optimization/', c: ['Fidelity', 'Incture', 'Afford Medical'] },
    ]
  },
  {
    id: 'os', name: 'Operating Systems', icon: '⚙️', topics: [
      { id: 'os1', n: 'What is an OS · Types & Functions', g: GFG + 'operating-systems/', c: ['HPE', 'Onetrust', 'Samsung', 'Cohesity'] },
      { id: 'os2', n: 'Process vs Thread', g: GFG + 'difference-between-process-and-thread/', c: ['Applied Materials', 'Aptiv', 'Cohesity', 'Haladoc', 'Havells', 'HPE', 'Siemens', 'Target', 'Sap Labs', 'TransUnion', 'Akamai', 'LG Soft', 'Samsung', 'Cisco'] },
      { id: 'os3', n: 'Process States & Life Cycle', g: GFG + 'states-of-a-process-in-operating-systems/', c: ['Sap Labs', 'TransUnion'] },
      { id: 'os4', n: 'CPU Scheduling Algorithms (FCFS, RR, Priority)', g: GFG + 'cpu-scheduling-in-operating-systems/', c: ['Applied Materials', 'Aptiv', 'Dish Network', 'Havells', 'HPE', 'LG Soft'] },
      { id: 'os5', n: 'Interprocess Communication (IPC)', g: GFG + 'inter-process-communication-ipc/', c: ['HPE', 'Light And Wonder', 'TransUnion'] },
      { id: 'os6', n: 'Multithreading vs Multiprocessing vs Multitasking', g: GFG + 'difference-between-multitasking-multithreading-and-multiprocessing/', c: ['Big Basket', 'Commscope', 'HPE', 'Samsung', 'Fidelity'] },
      { id: 'os7', n: 'Mutex vs Semaphore vs Spinlock', g: GFG + 'mutex-vs-semaphore/', c: ['Amadeus', 'Applied Materials', 'Commscope', 'HPE', 'Samsung', 'TransUnion', 'LG Soft'] },
      { id: 'os8', n: 'Producer-Consumer & Classic Sync Problems', g: GFG + 'producer-consumer-problem-in-c/', c: ['Applied Materials', 'Commscope'] },
      { id: 'os9', n: 'Race Conditions & Thread Synchronization', g: GFG + 'race-condition-vulnerability/', c: ['Target', 'LG Soft', 'Fidelity', 'HPE', 'Applied Materials'] },
      { id: 'os10', n: 'Deadlock: Conditions, Prevention & Banker\'s Algorithm', g: GFG + 'introduction-of-deadlock-in-operating-system/', c: ['Big Basket', 'Commscope', 'Haladoc', 'HPE', 'Infosys', 'MiQ Digital', 'Target', 'TCS', 'Thoughtworks', 'TransUnion', 'Havells'] },
      { id: 'os11', n: 'Paging & Segmentation', g: GFG + 'paging-in-operating-system/', c: ['Amadeus', 'Applied Materials', 'Big Basket', 'Cohesity', 'HashedIn by Deloitte', 'HPE', 'Samsung', 'Tejas Networks', 'TransUnion', 'LG Soft'] },
      { id: 'os12', n: 'Virtual Memory & Demand Paging', g: GFG + 'virtual-memory-in-operating-system/', c: ['Amadeus', 'Applied Materials', 'Big Basket', 'Haladoc', 'HPE', 'Samsung'] },
      { id: 'os13', n: 'Thrashing & Working Set', g: GFG + 'techniques-to-handle-thrashing/', c: ['Big Basket', 'HashedIn by Deloitte', 'HPE', 'Fidelity'] },
      { id: 'os14', n: 'Page Replacement — LRU & Friends', g: GFG + 'page-replacement-algorithms-in-operating-systems/', c: ['Amadeus', 'Akamai'] },
      { id: 'os15', n: 'Memory Allocation: malloc, calloc, new, pointers', g: GFG + 'difference-between-malloc-and-calloc-with-examples/', c: ['Amadeus', 'Aptiv', 'Sap Labs', 'Samsung', 'Dish Network', 'LG Soft', 'Tejas Networks'] },
      { id: 'os16', n: 'Memory Leaks, Dangling Pointers & Smart Pointers', g: GFG + 'what-is-memory-leak-how-can-we-avoid/', c: ['Light And Wonder', 'Tejas Networks', 'Onetrust'] },
      { id: 'os17', n: 'Kernel, System Calls, User vs Kernel Mode', g: GFG + 'kernel-in-operating-system/', c: ['WD', 'Samsung', 'LG Soft', 'Light And Wonder'] },
      { id: 'os18', n: 'fork(), Zombie & Orphan Processes', g: GFG + 'fork-system-call/', c: ['Amagi', 'TransUnion', 'Dish Network'] },
    ]
  },
  {
    id: 'cn', name: 'Computer Networks', icon: '🌐', topics: [
      { id: 'cn1', n: 'OSI Model — All 7 Layers', g: GFG + 'open-systems-interconnection-model-osi/', c: ['Amadeus', 'Aptiv', 'Cisco', 'Cohesity', 'Dish Network', 'HPE', 'Lam Research', 'Thoughtworks', 'TransUnion', 'WD', 'Akamai', 'Fidelity'] },
      { id: 'cn2', n: 'TCP/IP Model vs OSI', g: GFG + 'tcp-ip-model/', c: ['HPE', 'Akamai', 'Amadeus'] },
      { id: 'cn3', n: 'TCP vs UDP', g: GFG + 'differences-between-tcp-and-udp/', c: ['Aptiv', 'HPE', 'WD', 'Fidelity'] },
      { id: 'cn4', n: 'Three-Way Handshake & Piggybacking', g: GFG + 'tcp-3-way-handshake-process/', c: ['Fidelity', 'MiQ Digital'] },
      { id: 'cn5', n: 'HTTP vs HTTPS', g: GFG + 'difference-between-http-and-https/', c: ['Big Basket', 'Lam Research', 'Lowe\'s India', 'Amadeus', 'Schneider Electric', 'Fidelity'] },
      { id: 'cn6', n: 'DNS — How it Works', g: GFG + 'domain-name-system-dns-in-application-layer/', c: ['Cohesity', 'Thoughtworks', 'Fidelity', 'HPE'] },
      { id: 'cn7', n: 'DHCP', g: GFG + 'dynamic-host-configuration-protocol-dhcp/', c: ['Cohesity', 'Thoughtworks', 'HPE'] },
      { id: 'cn8', n: 'IP Addressing & Classes (A/B/C)', g: GFG + 'introduction-of-classful-ip-addressing/', c: ['Commscope', 'Cohesity'] },
      { id: 'cn9', n: 'IPv4 vs IPv6', g: GFG + 'differences-between-ipv4-and-ipv6/', c: ['Cisco', 'HPE', 'Openmynz'] },
      { id: 'cn10', n: 'Subnet Mask & Default Gateway', g: GFG + 'introduction-to-subnetting/', c: ['Cohesity'] },
      { id: 'cn11', n: 'Router vs Switch vs Bridge vs Gateway', g: GFG + 'difference-between-router-and-switch/', c: ['HPE', 'Lam Research'] },
      { id: 'cn12', n: 'ARP & MAC Addresses', g: GFG + 'how-address-resolution-protocol-arp-works/', c: ['Aptiv', 'Cohesity', 'Lam Research'] },
      { id: 'cn13', n: 'Application Protocols: FTP, SMTP, DHCP, RIP + Ports', g: GFG + 'application-layer-protocols-in-tcp-ip/', c: ['HPE', 'Lowe\'s India'] },
      { id: 'cn14', n: 'What Happens When You Type a URL', g: GFG + 'what-happens-when-we-type-a-url/', c: ['HPE', 'Akamai', 'Cohesity'] },
      { id: 'cn15', n: 'Firewalls, VPN & IP Spoofing', g: GFG + 'introduction-of-firewall-in-computer-network/', c: ['Lam Research', 'HPE', 'Schneider Electric', 'Moss Adams'] },
      { id: 'cn16', n: 'Network Topologies', g: GFG + 'types-of-network-topology/', c: ['Aptiv'] },
    ]
  },
  {
    id: 'sd', name: 'System Design', icon: '🏗️', topics: [
      { id: 'sd1', n: 'Client-Server Architecture', g: GFG + 'client-server-model/', c: ['MiQ Digital', 'Akamai', 'Onetrust'] },
      { id: 'sd2', n: 'REST APIs & HTTP Methods (GET/POST/PUT/PATCH)', g: GFG + 'rest-api-introduction/', c: ['Commscope', 'Havells', 'HPE', 'Oracle', 'TE Connectivity', 'RedBus', 'A.P. Moller Maersk', 'Akamai', 'Lowe\'s India', 'Alstom', 'Fidelity', 'Schneider Electric'] },
      { id: 'sd3', n: 'Authentication: JWT, Sessions & Cookies', g: GFG + 'json-web-token-jwt/', c: ['Dish Network', 'Havells', 'HPE', 'Target', 'TE Connectivity', 'Light And Wonder', 'RedBus', 'A.P. Moller Maersk', 'Sap Labs', 'Schneider Electric', 'Lowe\'s India'] },
      { id: 'sd4', n: 'Scalability, Load Balancing & Concurrency Handling', g: GFG + 'what-is-scalability/', c: ['IBM', 'Fidelity', 'A.P. Moller Maersk', 'RedBus', 'Schneider Electric', 'MiQ Digital', 'Incture'] },
      { id: 'sd5', n: 'Caching (incl. cloud caching)', g: GFG + 'caching-system-design-concept-for-beginners/', c: ['Fidelity', 'Afford Medical', 'HashedIn by Deloitte'] },
      { id: 'sd6', n: 'SOLID Principles & Design Patterns', g: GFG + 'solid-principle-in-programming-understand-with-real-life-examples/', c: ['MiQ Digital', 'Aptiv', 'Big Basket', 'Incture'] },
      { id: 'sd7', n: 'Monolith vs Microservices', g: GFG + 'monolithic-vs-microservices-architecture/', c: ['Big Basket', 'Havells'] },
      { id: 'sd8', n: 'CAP Theorem', g: GFG + 'the-cap-theorem-in-dbms/', c: ['Schneider Electric'] },
      { id: 'sd9', n: 'Message Queues & Async Systems (Kafka, Redis)', g: GFG + 'message-queues-system-design/', c: ['A.P. Moller Maersk'] },
      { id: 'sd10', n: 'Docker & Kubernetes Basics', g: GFG + 'introduction-to-docker/', c: ['Onetrust', 'Oracle', 'TE Connectivity', 'A.P. Moller Maersk', 'Schneider Electric'] },
      { id: 'sd11', n: 'WebSockets & Real-time Communication', g: GFG + 'what-is-web-socket-and-how-it-is-different-from-the-http/', c: ['Akamai', 'Lowe\'s India', 'Schneider Electric'] },
      { id: 'sd12', n: 'HLD Practice: Uber / WhatsApp / E-commerce / Lift', g: GFG + 'system-design-tutorial/', c: ['Spense', 'TransUnion', 'HashedIn by Deloitte', 'Amagi', 'Big Basket', 'Aptiv', 'Akamai'] },
    ]
  },
  {
    id: 'apt', name: 'Aptitude', icon: '🧠', topics: [
      { id: 'ap1', n: 'Number Series & Patterns', g: GFG + 'aptitude-number-series/', c: ['Onetrust', 'Commscope', 'Fidelity', 'Sap Labs'] },
      { id: 'ap2', n: 'Time & Work', g: GFG + 'time-and-work-aptitude-questions/', c: [] },
      { id: 'ap3', n: 'Probability', g: GFG + 'aptitude-probability/', c: ['Amagi', 'TE Connectivity'] },
      { id: 'ap4', n: 'Permutations & Combinations', g: GFG + 'permutations-and-combinations-aptitude-questions/', c: ['RedBus'] },
      { id: 'ap5', n: 'Percentages, Profit & Loss', g: GFG + 'profit-and-loss-aptitude-question-and-answers/', c: [] },
      { id: 'ap6', n: 'Time, Speed & Distance', g: GFG + 'speed-time-and-distance-aptitude-questions/', c: [] },
      { id: 'ap7', n: 'Clock & Calendar Problems', g: GFG + 'clock-aptitude-questions-and-answers/', c: ['UKG', 'RedBus'] },
      { id: 'ap8', n: 'Classic Puzzles: ropes/candles, bulbs & switches, eggs, coins, water jugs, bridge crossing', g: GFG + 'puzzles/', c: ['Akamai', 'Epicor', 'Amadeus', 'Big Basket', 'HPE', 'RedBus', 'Samsung', 'Sap Labs', 'Siemens', 'Fidelity', 'A.P. Moller Maersk', 'MathCo', 'Applied Materials', 'Lam Research', 'London Stock Exchange'] },
      { id: 'ap9', n: 'Guesstimates (taxis in a city, water usage…)', g: GFG + 'guesstimate-questions/', c: ['MathCo', 'Spense'] },
      { id: 'ap10', n: 'Logical Reasoning & Blood Relations', g: GFG + 'logical-reasoning/', c: ['Fidelity', 'Moss Adams', 'Epicor'] },
    ]
  },
  {
    id: 'hr', name: 'HR Interview', icon: '🤝', topics: [
      { id: 'hr1', n: 'Tell Me About Yourself (60–90s pitch)', g: GFG + 'tell-me-about-yourself/', c: ['Every company — asked in 60+ interviews'] },
      { id: 'hr2', n: 'Strengths & Weaknesses (with fix-it story)', g: GFG + 'what-are-your-strengths-and-weaknesses/', c: ['Cognizant', 'HPE', 'Infosys', 'Kasmo Digital', 'Thoughtworks', 'Epicor', 'Akamai', 'Lam Research', 'Schneider Electric', 'Dish Network'] },
      { id: 'hr3', n: 'Why This Company? (research each target)', g: GFG + 'why-do-you-want-to-work-for-our-company/', c: ['Amadeus', 'Cohesity', 'HPE', 'Lumos', 'Sap Labs', 'TransUnion', 'UKG', 'Epicor', 'Schneider Electric', 'TE Connectivity', 'Lam Research'] },
      { id: 'hr4', n: 'Where Do You See Yourself in 5 Years?', g: GFG + 'where-do-you-see-yourself-in-5-years/', c: ['Alstom', 'Amadeus', 'Cognizant', 'Cohesity', 'HPE', 'Infosys', 'Kasmo Digital', 'Lam Research', 'MiQ Digital', 'TE Connectivity', 'Thoughtworks', 'A.P. Moller Maersk', 'Emerson', 'Schneider Electric'] },
      { id: 'hr5', n: 'Teamwork & Conflict Stories (STAR method)', g: GFG + 'star-method-to-answer-behavioral-interview-questions/', c: ['Aptiv', 'HPE', 'Incture', 'Kasmo Digital', 'Sap Labs', 'Thoughtworks', 'UKG', 'A.P. Moller Maersk', 'Epicor', 'Schneider Electric', 'Lowe\'s India'] },
      { id: 'hr6', n: 'Biggest Failure / Challenge & What You Learned', g: GFG + 'tell-me-about-a-time-you-failed/', c: ['Haladoc', 'Lowe\'s India', 'Kasmo Digital', 'Lam Research', 'Amadeus', 'Epicor', 'IBM', 'Target'] },
      { id: 'hr7', n: 'Family Background & Personal Questions', g: GFG + 'hr-interview-questions-and-answers/', c: ['Dish Network', 'Epicor', 'Kasmo Digital', 'Lam Research', 'Oit Dahramyan', 'TE Connectivity', 'WD', 'Alstom', 'Fidelity', 'Ingersoll'] },
      { id: 'hr8', n: 'Relocation, WFH/WFO & Role Flexibility', g: GFG + 'are-you-willing-to-relocate/', c: ['Ingersoll', 'Oracle', 'Schneider Electric', 'UKG', 'MiQ Digital', 'Alstom', 'Epicor', 'Lam Research', 'A.P. Moller Maersk'] },
      { id: 'hr9', n: 'Hobbies & Extracurriculars (with depth)', g: GFG + 'hobbies-and-interests-to-put-on-a-resume/', c: ['Commscope', 'Dish Network', 'Kasmo Digital', 'Oit Dahramyan', 'Tejas Networks', 'Akamai', 'Fidelity', 'Schneider Electric', 'LG Soft'] },
      { id: 'hr10', n: 'Handling Stress, Pressure & Negative Feedback', g: GFG + 'how-do-you-handle-stress-and-pressure/', c: ['Cognizant', 'HPE', 'Kasmo Digital', 'MiQ Digital', 'Moss Adams', 'UKG', 'Lam Research', 'Lowe\'s India'] },
      { id: 'hr11', n: 'Why Should We Hire You?', g: GFG + 'why-should-we-hire-you/', c: ['Haladoc', 'HPE', 'Lumos', 'UKG', 'Akamai', 'Schneider Electric', 'Lam Research'] },
      { id: 'hr12', n: 'Higher Studies / Masters Plans', g: GFG + 'hr-interview-questions-and-answers/', c: ['Epicor', 'Ingersoll', 'MiQ Digital', 'TE Connectivity', 'WD', 'Alstom', 'Lam Research', 'Fidelity', 'Emerson'] },
      { id: 'hr13', n: 'Questions to Ask the Interviewer', g: GFG + 'questions-to-ask-at-the-end-of-an-interview/', c: ['HPE', 'Haladoc', 'Lam Research', 'Epicor', 'A.P. Moller Maersk'] },
    ]
  },
  {
    id: 'res', name: 'Resume', icon: '📄', topics: [
      { id: 'rs1', n: 'One-Page ATS-Friendly Structure', g: GFG + 'resume-writing-tips/', c: [] },
      { id: 'rs2', n: 'Know EVERY Keyword on Your Resume', g: GFG + 'how-to-make-a-resume/', c: ['Akamai', 'Lam Research', 'Oracle', 'Oit Dahramyan', 'Alstom', 'Emerson'] },
      { id: 'rs3', n: 'Projects Section with Quantified Impact', g: GFG + 'how-to-add-projects-to-resume/', c: ['Amazon', 'Dish Network'] },
      { id: 'rs4', n: 'Internship Experience Storytelling', g: GFG + 'how-to-describe-internship-experience-on-resume/', c: ['HPE', 'Cohesity', 'Kasmo Digital', 'TransUnion', 'Target', 'Schneider Electric', 'A.P. Moller Maersk', 'Amadeus'] },
      { id: 'rs5', n: 'Walk Me Through Your Resume (mock runs)', g: GFG + 'walk-me-through-your-resume/', c: ['TE Connectivity', 'Epicor', 'Emerson'] },
      { id: 'rs6', n: 'Skills Section — only what you can defend', g: GFG + 'skills-to-put-on-resume/', c: ['Oit Dahramyan', 'Lam Research'] },
    ]
  },
  {
    id: 'proj', name: 'Projects', icon: '💡', topics: [
      { id: 'pj1', n: '2-Minute Project Pitch (problem → solution → impact)', g: GFG + 'how-to-explain-project-in-interview/', c: ['Asked in 65+ of the analyzed interviews'] },
      { id: 'pj2', n: 'Architecture & Working-Flow Diagram', g: GFG + 'software-architecture-design-tutorial/', c: ['Aptiv', 'Big Basket', 'Schneider Electric', 'Lam Research', 'Alstom', 'MiQ Digital', 'Akamai', 'Kasmo Digital'] },
      { id: 'pj3', n: 'Tech-Stack Justification (why MongoDB? why React?)', g: GFG + 'how-to-choose-a-technology-stack-for-web-application-development/', c: ['Fidelity', 'Target', 'Azentio', 'Schneider Electric', 'Lowe\'s India', 'MiQ Digital', 'Light And Wonder', 'Epicor', 'HPE', 'A.P. Moller Maersk'] },
      { id: 'pj4', n: 'Challenges Faced & How You Solved Them', g: GFG + 'common-interview-questions-and-answers/', c: ['Amadeus', 'Aptiv', 'Havells', 'HPE', 'Kasmo Digital', 'L7 Informatics', 'London Stock Exchange', 'Sap Labs', 'Akamai', 'Fidelity', 'LG Soft', 'Epicor'] },
      { id: 'pj5', n: 'Auth Flow of Your Project (JWT end-to-end)', g: GFG + 'jwt-authentication-with-node-js/', c: ['Target', 'HPE', 'Sap Labs', 'Schneider Electric', 'RedBus'] },
      { id: 'pj6', n: 'Database Schema & ER Diagram of Your Project', g: GFG + 'how-to-design-a-database/', c: ['Haladoc', 'Lowe\'s India', 'Akamai', 'Lam Research', 'Amadeus', 'UKG', 'WD'] },
      { id: 'pj7', n: 'Deployment, Hosting & CI/CD Story', g: GFG + 'what-is-ci-cd/', c: ['Schneider Electric', 'Dish Network', 'MiQ Digital', 'Oracle'] },
      { id: 'pj8', n: 'Scaling & Future Enhancements Answer', g: GFG + 'how-to-scale-a-web-application/', c: ['Fidelity', 'Incture', 'Kasmo Digital', 'A.P. Moller Maersk', 'HPE', 'Lam Research', 'Amagi'] },
      { id: 'pj9', n: 'Crucial Code — be ready to write project snippets', g: GFG + 'how-to-explain-project-in-interview/', c: ['RedBus', 'Havells', 'Onetrust', 'Commscope'] },
    ]
  }
];

const LC = 'https://leetcode.com/problems/';
function P(s, n, d, gfg, c) { return { s, n, d, lc: LC + s + '/', gfg: gfg ? GFG + gfg : null, c: c || [] } }
const DSA = [
  {
    id: 'arrays', name: 'Arrays', icon: '📊', g: GFG + 'array-data-structure-guide/', problems: [
      P('two-sum', 'Two Sum', 'E', 'check-if-pair-with-given-sum-exists-in-array/', ['Infosys', 'RedBus', 'MiQ Digital', 'Big Basket', 'Haladoc']),
      P('contains-duplicate', 'Contains Duplicate', 'E', 'find-duplicates-in-on-time-and-constant-extra-space/', ['Epicor', 'Dish Network']),
      P('best-time-to-buy-and-sell-stock', 'Best Time to Buy and Sell Stock', 'E', 'best-time-to-buy-and-sell-stock/', []),
      P('maximum-subarray', 'Maximum Subarray (Kadane\'s)', 'M', 'largest-sum-contiguous-subarray/', ['RedBus', 'Big Basket', 'Fidelity']),
      P('product-of-array-except-self', 'Product of Array Except Self', 'M', 'a-product-array-puzzle/', []),
      P('merge-intervals', 'Merge Intervals', 'M', 'merging-intervals/', []),
      P('rotate-array', 'Rotate Array by K Steps', 'M', 'array-rotation/', ['RedBus', 'Samsung', 'Tejas Networks', 'Openmynz']),
      P('sort-colors', 'Sort Colors (0s,1s,2s — Dutch Flag)', 'M', 'sort-an-array-of-0s-1s-and-2s/', ['Big Basket', 'RedBus', 'TransUnion', 'Emerson']),
      P('majority-element', 'Majority Element', 'E', 'majority-element/', ['Haladoc', 'Samsung']),
      P('missing-number', 'Missing Number', 'E', 'find-the-missing-number/', ['MiQ Digital', 'RedBus', 'A.P. Moller Maersk', 'HashedIn by Deloitte']),
      P('3sum', '3Sum', 'M', 'find-a-triplet-that-sum-to-a-given-value/', ['Big Basket', 'Fidelity', 'Emerson']),
      P('spiral-matrix', 'Spiral Matrix', 'M', 'print-a-given-matrix-in-spiral-form/', ['RedBus']),
      P('rotate-image', 'Rotate Image (Matrix 90°)', 'M', 'inplace-rotate-square-matrix-by-90-degrees/', ['Tejas Networks', 'Onetrust']),
      P('subarray-sum-equals-k', 'Subarray Sum Equals K', 'M', 'number-subarrays-sum-exactly-equal-k/', ['Haladoc', 'Fidelity', 'Zeta']),
      P('maximum-product-subarray', 'Maximum Product Subarray', 'M', 'maximum-product-subarray/', ['Big Basket', 'National Instruments']),
      P('trapping-rain-water', 'Trapping Rain Water', 'H', 'trapping-rain-water/', ['Emerson']),
      P('kth-largest-element-in-an-array', 'Kth Largest Element in an Array', 'M', 'k-largestor-smallest-elements-in-an-array/', ['Akamai', 'Samsung']),
      P('monotonic-array', 'Monotonic Array', 'E', 'check-if-an-array-is-increasing-or-decreasing/', ['RedBus']),
      P('move-zeroes', 'Move Zeroes (shift to end)', 'E', 'move-zeroes-end-array/', ['Haladoc']),
      P('second-largest-digits-in-a-string', 'Find Second Largest Element (classic)', 'E', 'find-second-largest-element-array/', ['Amadeus', 'Aptiv', 'Siemens', 'Spense', 'TransUnion', 'LG Soft'])
    ]
  },
  {
    id: 'strings', name: 'Strings', icon: '🔤', g: GFG + 'string-data-structure/', problems: [
      P('valid-anagram', 'Valid Anagram', 'E', 'check-whether-two-strings-are-anagram-of-each-other/', ['Infosys', 'Fidelity']),
      P('group-anagrams', 'Group Anagrams', 'M', 'given-a-sequence-of-words-print-all-anagrams-together/', ['TransUnion', 'LG Soft', 'Lowe\'s India']),
      P('valid-palindrome', 'Valid Palindrome', 'E', 'c-program-check-given-string-palindrome/', ['Amadeus', 'HPE', 'Siemens', 'UKG', 'Kasmo Digital', 'Oracle', 'A.P. Moller Maersk', 'LG Soft', 'Spense']),
      P('reverse-string', 'Reverse String', 'E', 'reverse-a-string/', ['Amadeus', 'Cohesity', 'Dish Network', 'Emerson', 'Epicor', 'HPE', 'Big Basket', 'Spense', 'Kasmo Digital']),
      P('reverse-words-in-a-string', 'Reverse Words in a String', 'M', 'reverse-words-in-a-given-string/', ['Dish Network', 'RedBus', 'Spense', 'HPE']),
      P('longest-palindromic-substring', 'Longest Palindromic Substring', 'M', 'longest-palindrome-substring-set-1/', ['HPE', 'Spense']),
      P('longest-substring-without-repeating-characters', 'Longest Substring Without Repeating Characters', 'M', 'length-of-the-longest-substring-without-repeating-characters/', ['Akamai']),
      P('longest-common-prefix', 'Longest Common Prefix', 'E', 'longest-common-prefix-using-sorting/', ['HPE', 'Haladoc']),
      P('string-to-integer-atoi', 'String to Integer (atoi / stoi)', 'M', 'write-your-own-atoi/', ['Light And Wonder', 'Amagi']),
      P('first-unique-character-in-a-string', 'Frequency / Duplicate Characters in String', 'E', 'print-all-the-duplicates-in-the-input-string/', ['Big Basket', 'Light And Wonder', 'Schneider Electric', 'RedBus', 'Lam Research', 'Kasmo Digital', 'MathCo']),
      P('minimum-remove-to-make-valid-parentheses', 'Remove Outermost / Fix Parentheses', 'M', 'remove-outermost-parenthesis-of-a-valid-parenthesis-sequence/', ['Big Basket', 'HPE']),
      P('find-the-index-of-the-first-occurrence-in-a-string', 'Substring Search (KMP / Horspool)', 'E', 'kmp-algorithm-for-pattern-searching/', ['Epicor', 'Incture', 'RedBus']),
      P('rotate-string', 'Check if String is Rotated', 'E', 'check-string-can-obtained-rotating-another-string-2-places/', ['Openmynz'])
    ]
  },
  {
    id: 'linkedlist', name: 'Linked List', icon: '🔗', g: GFG + 'linked-list-data-structure/', problems: [
      P('reverse-linked-list', 'Reverse Linked List', 'E', 'reverse-a-linked-list/', ['HashedIn by Deloitte', 'Zeta', 'Onetrust', 'Fidelity', 'A.P. Moller Maersk', 'Light And Wonder', 'Haladoc', 'Emerson', 'Epicor']),
      P('linked-list-cycle', 'Detect Cycle in Linked List', 'E', 'detect-loop-in-a-linked-list/', ['Big Basket', 'HashedIn by Deloitte', 'TransUnion', 'Azentio', 'MiQ Digital', 'Fidelity', 'Openmynz']),
      P('linked-list-cycle-ii', 'Linked List Cycle II (find loop start)', 'M', 'find-first-node-of-loop-in-a-linked-list/', ['Infosys', 'Big Basket']),
      P('merge-two-sorted-lists', 'Merge Two Sorted Lists', 'E', 'merge-two-sorted-linked-lists/', ['HashedIn by Deloitte']),
      P('remove-nth-node-from-end-of-list', 'Remove Nth Node From End', 'M', 'delete-nth-node-from-the-end-of-the-given-linked-list/', ['RedBus', 'Big Basket', 'MiQ Digital']),
      P('middle-of-the-linked-list', 'Middle of Linked List (+ delete middle)', 'E', 'write-a-c-function-to-print-the-middle-of-the-linked-list/', ['Commscope', 'Amadeus', 'RedBus']),
      P('palindrome-linked-list', 'Palindrome Linked List', 'E', 'function-to-check-if-a-singly-linked-list-is-palindrome/', ['Zeta']),
      P('intersection-of-two-linked-lists', 'Intersection of Two Linked Lists', 'E', 'write-a-function-to-get-the-intersection-point-of-two-linked-lists/', ['Aptiv']),
      P('rotate-list', 'Rotate Linked List', 'M', 'rotate-a-linked-list/', ['Openmynz']),
      P('design-linked-list', 'Doubly & Circular Linked List — all operations', 'M', 'doubly-linked-list/', ['Epicor', 'A.P. Moller Maersk', 'RedBus', 'HPE', 'Anora', 'Cisco', 'Dish Network', 'Schneider Electric']),
      P('sort-list', 'Sort a Linked List (Merge Sort)', 'M', 'merge-sort-for-linked-list/', ['Big Basket']),
      P('lru-cache', 'LRU Cache', 'M', 'lru-cache-implementation/', ['Amadeus', 'Akamai'])
    ]
  },
  {
    id: 'stack', name: 'Stack', icon: '🥞', g: GFG + 'stack-data-structure/', problems: [
      P('valid-parentheses', 'Valid Parentheses', 'E', 'check-for-balanced-parentheses-in-an-expression/', ['HPE', 'Fidelity', 'LG Soft', 'London Stock Exchange', 'Oit Dahramyan', 'Haladoc', 'RedBus']),
      P('min-stack', 'Min Stack (getMin in O(1))', 'M', 'design-a-stack-that-supports-getmin-in-o1-time-and-o1-extra-space/', ['Oit Dahramyan']),
      P('implement-stack-using-queues', 'Implement Stack using Queues', 'E', 'implement-stack-using-queue/', ['Epicor', 'Lam Research', 'Haladoc']),
      P('implement-queue-using-stacks', 'Implement Queue using Stacks', 'E', 'queue-using-stacks/', ['Epicor', 'Kasmo Digital']),
      P('evaluate-reverse-polish-notation', 'Evaluate Reverse Polish Notation', 'M', 'stack-set-4-evaluation-postfix-expression/', []),
      P('daily-temperatures', 'Daily Temperatures (Next Greater pattern)', 'M', 'next-greater-element/', []),
      P('backspace-string-compare', 'Reverse String / Number using Stack', 'E', 'stack-set-3-reverse-string-using-stack/', ['Amadeus', 'Target', 'Light And Wonder']),
      P('largest-rectangle-in-histogram', 'Largest Rectangle in Histogram', 'H', 'largest-rectangle-under-histogram/', [])
    ]
  },
  {
    id: 'queue', name: 'Queue', icon: '🚶', g: GFG + 'queue-data-structure/', problems: [
      P('design-circular-queue', 'Design Circular Queue', 'M', 'introduction-to-circular-queue/', ['HPE']),
      P('sliding-window-maximum', 'Sliding Window Maximum', 'H', 'sliding-window-maximum-maximum-of-all-subarrays-of-size-k/', ['Zeta']),
      P('number-of-recent-calls', 'Number of Recent Calls', 'E', 'queue-data-structure/', []),
      P('implement-queue-using-stacks', 'Queue via Stacks (revision)', 'E', 'queue-using-stacks/', ['Epicor', 'Kasmo Digital']),
      P('rotting-oranges', 'Rotting Oranges (BFS queue)', 'M', 'minimum-time-required-so-that-all-oranges-become-rotten/', [])
    ]
  },
  {
    id: 'binarysearch', name: 'Binary Search', icon: '🎯', g: GFG + 'binary-search/', problems: [
      P('binary-search', 'Binary Search', 'E', 'binary-search/', ['Anora', 'Dish Network', 'Thoughtworks', 'A.P. Moller Maersk', 'Samsung', 'Target', 'Lam Research', 'Epicor']),
      P('search-in-rotated-sorted-array', 'Search in Rotated Sorted Array', 'M', 'search-an-element-in-a-sorted-and-pivoted-array/', ['National Instruments', 'LG Soft', 'Thoughtworks', 'Samsung']),
      P('find-first-and-last-position-of-element-in-sorted-array', 'First and Last Position of Element', 'M', 'find-first-and-last-positions-of-an-element-in-a-sorted-array/', ['National Instruments', 'LG Soft', 'Samsung']),
      P('sqrtx', 'Sqrt(x) — up to 3 decimals', 'E', 'square-root-of-an-integer/', ['Amagi', 'Spense', 'National Instruments']),
      P('find-peak-element', 'Find Peak Element', 'M', 'find-a-peak-in-a-given-array/', ['National Instruments', 'LG Soft']),
      P('search-a-2d-matrix', 'Search a 2D Matrix', 'M', 'search-in-row-wise-and-column-wise-sorted-matrix/', ['National Instruments', 'LG Soft']),
      P('find-minimum-in-rotated-sorted-array', 'Find Minimum in Rotated Sorted Array', 'M', 'find-minimum-element-in-a-sorted-and-rotated-array/', ['National Instruments']),
      P('koko-eating-bananas', 'Koko Eating Bananas', 'M', 'koko-eating-bananas/', ['A.P. Moller Maersk']),
      P('kth-smallest-element-in-a-sorted-matrix', 'Kth Smallest in Sorted Matrix', 'M', 'kth-smallest-element-in-a-row-wise-and-column-wise-sorted-2d-array-set-1/', ['National Instruments']),
      P('capacity-to-ship-packages-within-d-days', 'Capacity to Ship Packages in D Days', 'M', 'capacity-to-ship-packages-within-d-days/', ['National Instruments']),
      P('median-of-two-sorted-arrays', 'Median of Two Sorted Arrays', 'H', 'median-of-two-sorted-arrays/', ['National Instruments', 'Azentio']),
      P('aggressive-cows', 'Aggressive Cows (GFG)', 'M', 'assign-stalls-to-k-cows-to-maximize-the-minimum-distance-between-them/', ['National Instruments']),
      P('count-of-an-element-in-a-sorted-array', 'Count Occurrences in Sorted Array', 'E', 'count-number-of-occurrences-or-frequency-in-a-sorted-array/', ['Samsung', 'Haladoc', 'RedBus'])
    ]
  },
  {
    id: 'recursion', name: 'Recursion', icon: '🌀', g: GFG + 'recursion-algorithms/', problems: [
      P('fibonacci-number', 'Fibonacci Number', 'E', 'program-for-nth-fibonacci-number/', ['Onetrust', 'HPE', 'LG Soft', 'Oracle']),
      P('factorial-trailing-zeroes', 'Factorial using Recursion', 'E', 'program-for-factorial-of-a-number/', ['Dish Network', 'Kasmo Digital']),
      P('reverse-string', 'Reverse String via Recursion', 'E', 'reverse-a-string-using-recursion/', ['Dish Network', 'Big Basket', 'Zeta']),
      P('powx-n', 'Pow(x, n)', 'M', 'write-a-c-program-to-calculate-powxn/', []),
      P('subsets', 'Subsets (Power Set)', 'M', 'power-set/', ['HashedIn by Deloitte']),
      P('range-sum-of-bst', 'Sum in a Range (recursive)', 'E', 'sum-array-elements-using-recursion/', ['Amagi']),
      P('climbing-stairs', 'Climbing Stairs (recursion → memo)', 'E', 'count-ways-reach-nth-stair/', [])
    ]
  },
  {
    id: 'backtracking', name: 'Backtracking', icon: '🧭', g: GFG + 'backtracking-algorithms/', problems: [
      P('permutations', 'Permutations', 'M', 'write-a-c-program-to-print-all-permutations-of-a-given-string/', ['RedBus']),
      P('combination-sum', 'Combination Sum', 'M', 'combinational-sum/', []),
      P('word-search', 'Word Search (crossword grid)', 'M', 'check-if-a-word-exists-in-a-grid-or-not/', ['RedBus']),
      P('generate-parentheses', 'Generate Parentheses', 'M', 'print-all-combinations-of-balanced-parentheses/', []),
      P('n-queens', 'N-Queens', 'H', 'n-queen-problem-backtracking-3/', []),
      P('letter-combinations-of-a-phone-number', 'Letter Combinations of Phone Number', 'M', 'find-possible-words-phone-digits/', ['RedBus']),
      P('sudoku-solver', 'Sudoku Solver', 'H', 'sudoku-backtracking-7/', []),
      P('rat-in-a-maze', 'Rat in a Maze (GFG)', 'M', 'rat-in-a-maze/', [])
    ]
  },
  {
    id: 'trees', name: 'Trees', icon: '🌳', g: GFG + 'binary-tree-data-structure/', problems: [
      P('binary-tree-inorder-traversal', 'Tree Traversals (In/Pre/Post-order)', 'E', 'tree-traversals-inorder-preorder-and-postorder/', ['Havells', 'Oracle', 'Amadeus']),
      P('maximum-depth-of-binary-tree', 'Maximum Depth of Binary Tree', 'E', 'find-the-maximum-depth-or-height-of-a-tree/', ['Havells']),
      P('invert-binary-tree', 'Invert Binary Tree', 'E', 'write-an-efficient-c-function-to-convert-a-tree-into-its-mirror-tree/', []),
      P('binary-tree-level-order-traversal', 'Level Order Traversal (BFS)', 'M', 'level-order-tree-traversal/', ['Havells']),
      P('binary-tree-zigzag-level-order-traversal', 'Zigzag Level Order Traversal', 'M', 'zigzag-tree-traversal/', ['Akamai']),
      P('diameter-of-binary-tree', 'Diameter of Binary Tree', 'E', 'diameter-of-a-binary-tree/', []),
      P('same-tree', 'Same Tree / Duplicate Subtrees', 'E', 'check-if-two-trees-are-identical/', ['Fidelity']),
      P('binary-tree-right-side-view', 'Binary Tree Right Side View', 'M', 'print-right-view-binary-tree-2/', ['London Stock Exchange']),
      P('lowest-common-ancestor-of-a-binary-tree', 'Lowest Common Ancestor', 'M', 'lowest-common-ancestor-binary-tree-set-1/', []),
      P('flatten-binary-tree-to-linked-list', 'Flatten Binary Tree to Linked List', 'M', 'flatten-a-binary-tree-into-linked-list/', ['Akamai']),
      P('balanced-binary-tree', 'Balanced Binary Tree (+ AVL idea)', 'E', 'how-to-determine-if-a-binary-tree-is-balanced/', ['Commscope', 'LG Soft', 'Lowe\'s India']),
      P('binary-tree-maximum-path-sum', 'Binary Tree Maximum Path Sum', 'H', 'find-maximum-path-sum-in-a-binary-tree/', [])
    ]
  },
  {
    id: 'bst', name: 'BST', icon: '🎄', g: GFG + 'binary-search-tree-data-structure/', problems: [
      P('validate-binary-search-tree', 'Validate BST (identify a BST)', 'M', 'a-program-to-check-if-a-binary-tree-is-bst-or-not/', ['RedBus', 'HPE']),
      P('search-in-a-binary-search-tree', 'Search in a BST', 'E', 'binary-search-tree-set-1-search-and-insertion/', ['Lowe\'s India', 'Dish Network', 'Amadeus']),
      P('insert-into-a-binary-search-tree', 'Insert into a BST', 'M', 'binary-search-tree-set-1-search-and-insertion/', ['Dish Network']),
      P('kth-smallest-element-in-a-bst', 'Kth Smallest Element in BST', 'M', 'find-k-th-smallest-element-in-bst-order-statistics/', []),
      P('lowest-common-ancestor-of-a-binary-search-tree', 'LCA of a BST', 'M', 'lowest-common-ancestor-in-a-binary-search-tree/', []),
      P('convert-sorted-array-to-binary-search-tree', 'Sorted Array to BST (why sorted array is bad!)', 'E', 'sorted-array-to-balanced-bst/', ['Lowe\'s India']),
      P('delete-node-in-a-bst', 'Delete Node in a BST', 'M', 'binary-search-tree-set-2-delete/', []),
      P('two-sum-iv-input-is-a-bst', 'Find Key in BST / Two Sum in BST', 'E', 'find-a-pair-with-given-sum-in-bst/', ['Lowe\'s India'])
    ]
  },
  {
    id: 'heap', name: 'Heap', icon: '⛰️', g: GFG + 'heap-data-structure/', problems: [
      P('kth-largest-element-in-a-stream', 'Kth Largest in a Stream', 'E', 'kth-largest-element-in-a-stream/', ['Akamai']),
      P('last-stone-weight', 'Last Stone Weight', 'E', 'heap-data-structure/', []),
      P('top-k-frequent-elements', 'Top K Frequent Elements', 'M', 'find-k-numbers-occurrences-given-array/', ['LG Soft']),
      P('k-closest-points-to-origin', 'K Closest Points to Origin', 'M', 'find-k-closest-points-to-the-origin/', []),
      P('find-median-from-data-stream', 'Find Median from Data Stream', 'H', 'median-of-stream-of-integers-running-integers/', ['Spense']),
      P('merge-k-sorted-lists', 'Merge K Sorted Lists', 'H', 'merge-k-sorted-linked-lists/', []),
      P('task-scheduler', 'Task Scheduler', 'M', 'task-scheduler/', [])
    ]
  },
  {
    id: 'trie', name: 'Trie', icon: '🌲', g: GFG + 'trie-insert-and-search/', problems: [
      P('implement-trie-prefix-tree', 'Implement Trie (Prefix Tree)', 'M', 'trie-insert-and-search/', []),
      P('design-add-and-search-words-data-structure', 'Design Add & Search Words', 'M', 'trie-insert-and-search/', []),
      P('longest-common-prefix', 'Longest Common Prefix (Trie way)', 'E', 'longest-common-prefix-using-trie/', ['HPE']),
      P('word-search-ii', 'Word Search II', 'H', 'word-search-in-a-2d-grid-of-characters/', ['RedBus']),
      P('replace-words', 'Replace Words', 'M', 'trie-insert-and-search/', [])
    ]
  },
  {
    id: 'graph', name: 'Graph', icon: '🕸️', g: GFG + 'graph-data-structure-and-algorithms/', problems: [
      P('number-of-islands', 'Number of Islands (largest 1s region)', 'M', 'find-the-number-of-islands/', ['RedBus']),
      P('clone-graph', 'Clone Graph', 'M', 'clone-an-undirected-graph/', []),
      P('course-schedule', 'Course Schedule (cycle detection)', 'M', 'detect-cycle-in-a-graph/', []),
      P('rotting-oranges', 'Rotting Oranges (multi-source BFS)', 'M', 'minimum-time-required-so-that-all-oranges-become-rotten/', []),
      P('number-of-provinces', 'Number of Provinces (DFS/Union-Find)', 'M', 'connected-components-in-an-undirected-graph/', []),
      P('network-delay-time', 'Dijkstra — Shortest Path', 'M', 'dijkstras-shortest-path-algorithm-greedy-algo-7/', ['Fidelity']),
      P('pacific-atlantic-water-flow', 'Pacific Atlantic Water Flow', 'M', 'water-flow-problem/', []),
      P('bfs-of-graph', 'BFS & DFS of Graph (GFG)', 'E', 'breadth-first-search-or-bfs-for-a-graph/', ['Havells', 'Lowe\'s India', 'Azentio']),
      P('word-ladder', 'Word Ladder', 'H', 'word-ladder-length-of-shortest-chain-to-reach-a-target-word/', [])
    ]
  },
  {
    id: 'greedy', name: 'Greedy', icon: '🪙', g: GFG + 'greedy-algorithms/', problems: [
      P('non-overlapping-intervals', 'Non-overlapping Intervals (Activity Selection)', 'M', 'activity-selection-problem-greedy-algo-1/', ['Aptiv']),
      P('meeting-rooms-ii', 'Meeting Rooms II / Min Platforms', 'M', 'minimum-number-platforms-required-railwaybus-station/', ['Amagi', 'Big Basket']),
      P('jump-game', 'Jump Game', 'M', 'minimum-number-of-jumps-to-reach-end-of-a-given-array/', []),
      P('gas-station', 'Gas Station', 'M', 'find-a-tour-that-visits-all-stations/', []),
      P('assign-cookies', 'Assign Cookies', 'E', 'greedy-algorithms/', []),
      P('fractional-knapsack', 'Fractional Knapsack (GFG)', 'M', 'fractional-knapsack-problem/', ['Oit Dahramyan']),
      P('best-time-to-buy-and-sell-stock-ii', 'Buy & Sell Stock II', 'M', 'stock-buy-sell/', [])
    ]
  },
  {
    id: 'dp', name: 'Dynamic Programming', icon: '🧮', g: GFG + 'dynamic-programming/', problems: [
      P('climbing-stairs', 'Climbing Stairs', 'E', 'count-ways-reach-nth-stair/', []),
      P('house-robber', 'House Robber', 'M', 'find-maximum-possible-stolen-value-houses/', ['Infosys', 'RedBus', 'Emerson', 'National Instruments']),
      P('coin-change', 'Coin Change', 'M', 'coin-change-dp-7/', ['Infosys', 'National Instruments']),
      P('longest-common-subsequence', 'Longest Common Subsequence', 'M', 'longest-common-subsequence-dp-4/', ['HashedIn by Deloitte', 'National Instruments', 'A.P. Moller Maersk']),
      P('longest-increasing-subsequence', 'Longest Increasing Subsequence', 'M', 'longest-increasing-subsequence-dp-3/', ['National Instruments', 'Emerson']),
      P('partition-equal-subset-sum', 'Partition Equal Subset Sum', 'M', 'partition-problem-dp-18/', ['National Instruments']),
      P('0-1-knapsack', '0/1 Knapsack (GFG)', 'M', '0-1-knapsack-problem-dp-10/', ['HashedIn by Deloitte', 'Oit Dahramyan', 'National Instruments']),
      P('edit-distance', 'Edit Distance', 'M', 'edit-distance-dp-5/', ['National Instruments']),
      P('word-break', 'Word Break', 'M', 'word-break-problem-dp-32/', []),
      P('unique-paths', 'Unique Paths / Min Cost Path in Grid', 'M', 'min-cost-path-dp-6/', ['HashedIn by Deloitte']),
      P('maximum-product-subarray', 'Maximum Product Subarray (DP view)', 'M', 'maximum-product-subarray/', ['National Instruments', 'Big Basket']),
      P('palindrome-partitioning-ii', 'Palindrome Partitioning II (min cuts)', 'H', 'palindrome-partitioning-dp-17/', ['Onetrust']),
      P('burst-balloons', 'Burst Balloons', 'H', 'burst-balloon-to-maximize-coins/', ['National Instruments']),
      P('paint-fence', 'Paint Fence (ways with constraints)', 'M', 'painting-fence-algorithm/', ['Zeta']),
      P('subset-sum-problem', 'Subset Sum Problem (GFG)', 'M', 'subset-sum-problem-dp-25/', ['National Instruments'])
    ]
  },
  {
    id: 'bit', name: 'Bit Manipulation', icon: '💾', g: GFG + 'bits-manipulation-important-tactics/', problems: [
      P('single-number', 'Single Number', 'E', 'find-the-element-that-appears-once/', []),
      P('number-of-1-bits', 'Number of 1 Bits (count set bits)', 'E', 'count-set-bits-in-an-integer/', ['HPE']),
      P('reverse-bits', 'Reverse Bits', 'E', 'reverse-bits-of-a-given-integer/', ['LG Soft']),
      P('counting-bits', 'Counting Bits', 'E', 'count-total-set-bits-in-all-numbers-from-1-to-n/', []),
      P('missing-number', 'Missing Number (XOR way)', 'E', 'find-the-missing-number/', ['MiQ Digital']),
      P('power-of-two', 'Power of Two', 'E', 'program-to-find-whether-a-given-number-is-power-of-2/', []),
      P('swap-two-numbers', 'Swap Without Third Variable (XOR)', 'E', 'swap-two-numbers-without-using-temporary-variable/', ['Cognizant', 'Light And Wonder', 'Onetrust', 'Oracle', 'TCS', 'Schneider Electric', 'Haladoc']),
      P('multiply-without-operator', 'Multiply Using Bitwise Shifts (GFG)', 'M', 'multiplication-two-numbers-shift-operator/', ['Dish Network', 'Samsung'])
    ]
  },
  {
    id: 'sorting', name: 'Sorting & Searching', icon: '🔀', g: GFG + 'sorting-algorithms/', problems: [
      P('sort-an-array', 'Merge Sort (implement & explain)', 'M', 'merge-sort/', ['Amadeus', 'Emerson', 'Haladoc', 'LG Soft', 'MiQ Digital', 'RedBus', 'A.P. Moller Maersk']),
      P('quick-sort', 'Quick Sort (GFG)', 'M', 'quick-sort-algorithm/', ['Havells', 'Lam Research', 'RedBus']),
      P('bubble-sort', 'Bubble Sort + Optimized Early Exit (GFG)', 'E', 'bubble-sort-algorithm/', ['Commscope', 'MathCo', 'LG Soft', 'Openmynz', 'TCS']),
      P('insertion-sort', 'Insertion Sort (all complexities)', 'E', 'insertion-sort-algorithm/', ['Havells', 'Light And Wonder', 'Sap Labs', 'TCS']),
      P('selection-sort', 'Selection Sort (min & max of array)', 'E', 'selection-sort-algorithm-2/', ['Infosys', 'A.P. Moller Maersk', 'Light And Wonder']),
      P('radix-sort', 'Radix Sort (GFG)', 'M', 'radix-sort/', ['UKG']),
      P('time-complexities', 'Time Complexity of ALL Sorts (theory)', 'E', 'time-complexities-of-all-sorting-algorithms/', ['Infosys', 'A.P. Moller Maersk', 'Commscope', 'Anora', 'Havells', 'Akamai'])
    ]
  }
];

const BLIND75 = [
  ['Array', [['Two Sum', 'E', 'two-sum'], ['Best Time to Buy & Sell Stock', 'E', 'best-time-to-buy-and-sell-stock'], ['Contains Duplicate', 'E', 'contains-duplicate'], ['Product of Array Except Self', 'M', 'product-of-array-except-self'], ['Maximum Subarray', 'M', 'maximum-subarray'], ['Maximum Product Subarray', 'M', 'maximum-product-subarray'], ['Find Minimum in Rotated Sorted Array', 'M', 'find-minimum-in-rotated-sorted-array'], ['Search in Rotated Sorted Array', 'M', 'search-in-rotated-sorted-array'], ['3Sum', 'M', '3sum'], ['Container With Most Water', 'M', 'container-with-most-water']]],
  ['Binary', [['Sum of Two Integers', 'M', 'sum-of-two-integers'], ['Number of 1 Bits', 'E', 'number-of-1-bits'], ['Counting Bits', 'E', 'counting-bits'], ['Missing Number', 'E', 'missing-number'], ['Reverse Bits', 'E', 'reverse-bits']]],
  ['Dynamic Programming', [['Climbing Stairs', 'E', 'climbing-stairs'], ['Coin Change', 'M', 'coin-change'], ['Longest Increasing Subsequence', 'M', 'longest-increasing-subsequence'], ['Longest Common Subsequence', 'M', 'longest-common-subsequence'], ['Word Break', 'M', 'word-break'], ['Combination Sum IV', 'M', 'combination-sum-iv'], ['House Robber', 'M', 'house-robber'], ['House Robber II', 'M', 'house-robber-ii'], ['Decode Ways', 'M', 'decode-ways'], ['Unique Paths', 'M', 'unique-paths'], ['Jump Game', 'M', 'jump-game']]],
  ['Graph', [['Clone Graph', 'M', 'clone-graph'], ['Course Schedule', 'M', 'course-schedule'], ['Pacific Atlantic Water Flow', 'M', 'pacific-atlantic-water-flow'], ['Number of Islands', 'M', 'number-of-islands'], ['Longest Consecutive Sequence', 'M', 'longest-consecutive-sequence'], ['Alien Dictionary', 'H', 'alien-dictionary'], ['Graph Valid Tree', 'M', 'graph-valid-tree'], ['Number of Connected Components', 'M', 'number-of-connected-components-in-an-undirected-graph']]],
  ['Interval', [['Insert Interval', 'M', 'insert-interval'], ['Merge Intervals', 'M', 'merge-intervals'], ['Non-overlapping Intervals', 'M', 'non-overlapping-intervals'], ['Meeting Rooms', 'E', 'meeting-rooms'], ['Meeting Rooms II', 'M', 'meeting-rooms-ii']]],
  ['Linked List', [['Reverse Linked List', 'E', 'reverse-linked-list'], ['Linked List Cycle', 'E', 'linked-list-cycle'], ['Merge Two Sorted Lists', 'E', 'merge-two-sorted-lists'], ['Merge K Sorted Lists', 'H', 'merge-k-sorted-lists'], ['Remove Nth Node From End', 'M', 'remove-nth-node-from-end-of-list'], ['Reorder List', 'M', 'reorder-list']]],
  ['Matrix', [['Set Matrix Zeroes', 'M', 'set-matrix-zeroes'], ['Spiral Matrix', 'M', 'spiral-matrix'], ['Rotate Image', 'M', 'rotate-image'], ['Word Search', 'M', 'word-search']]],
  ['String', [['Longest Substring Without Repeating', 'M', 'longest-substring-without-repeating-characters'], ['Longest Repeating Character Replacement', 'M', 'longest-repeating-character-replacement'], ['Minimum Window Substring', 'H', 'minimum-window-substring'], ['Valid Anagram', 'E', 'valid-anagram'], ['Group Anagrams', 'M', 'group-anagrams'], ['Valid Parentheses', 'E', 'valid-parentheses'], ['Valid Palindrome', 'E', 'valid-palindrome'], ['Longest Palindromic Substring', 'M', 'longest-palindromic-substring'], ['Palindromic Substrings', 'M', 'palindromic-substrings'], ['Encode and Decode Strings', 'M', 'encode-and-decode-strings']]],
  ['Tree', [['Maximum Depth of Binary Tree', 'E', 'maximum-depth-of-binary-tree'], ['Same Tree', 'E', 'same-tree'], ['Invert Binary Tree', 'E', 'invert-binary-tree'], ['Binary Tree Maximum Path Sum', 'H', 'binary-tree-maximum-path-sum'], ['Level Order Traversal', 'M', 'binary-tree-level-order-traversal'], ['Serialize & Deserialize Binary Tree', 'H', 'serialize-and-deserialize-binary-tree'], ['Subtree of Another Tree', 'E', 'subtree-of-another-tree'], ['Construct Tree from Preorder & Inorder', 'M', 'construct-binary-tree-from-preorder-and-inorder-traversal'], ['Validate BST', 'M', 'validate-binary-search-tree'], ['Kth Smallest in BST', 'M', 'kth-smallest-element-in-a-bst'], ['LCA of BST', 'M', 'lowest-common-ancestor-of-a-binary-search-tree'], ['Implement Trie', 'M', 'implement-trie-prefix-tree'], ['Design Add & Search Words', 'M', 'design-add-and-search-words-data-structure'], ['Word Search II', 'H', 'word-search-ii']]],
  ['Heap', [['Merge K Sorted Lists', 'H', 'merge-k-sorted-lists'], ['Top K Frequent Elements', 'M', 'top-k-frequent-elements'], ['Find Median from Data Stream', 'H', 'find-median-from-data-stream']]]
];
const NEETCODE_EXTRA = [
  ['Arrays & Hashing', [['Valid Sudoku', 'M', 'valid-sudoku'], ['Two Sum II', 'M', 'two-sum-ii-input-array-is-sorted'], ['Trapping Rain Water', 'H', 'trapping-rain-water'], ['Best Time to Buy & Sell Stock II', 'M', 'best-time-to-buy-and-sell-stock-ii'], ['Majority Element', 'E', 'majority-element'], ['Sort Colors', 'M', 'sort-colors'], ['Subarray Sum Equals K', 'M', 'subarray-sum-equals-k']]],
  ['Stack', [['Min Stack', 'M', 'min-stack'], ['Evaluate Reverse Polish Notation', 'M', 'evaluate-reverse-polish-notation'], ['Generate Parentheses', 'M', 'generate-parentheses'], ['Daily Temperatures', 'M', 'daily-temperatures'], ['Car Fleet', 'M', 'car-fleet'], ['Largest Rectangle in Histogram', 'H', 'largest-rectangle-in-histogram']]],
  ['Binary Search', [['Binary Search', 'E', 'binary-search'], ['Search a 2D Matrix', 'M', 'search-a-2d-matrix'], ['Koko Eating Bananas', 'M', 'koko-eating-bananas'], ['Median of Two Sorted Arrays', 'H', 'median-of-two-sorted-arrays'], ['Time Based Key-Value Store', 'M', 'time-based-key-value-store'], ['Find Peak Element', 'M', 'find-peak-element']]],
  ['Sliding Window', [['Best Time to Buy & Sell Stock', 'E', 'best-time-to-buy-and-sell-stock'], ['Permutation in String', 'M', 'permutation-in-string'], ['Sliding Window Maximum', 'H', 'sliding-window-maximum']]],
  ['Linked List', [['Copy List with Random Pointer', 'M', 'copy-list-with-random-pointer'], ['Add Two Numbers', 'M', 'add-two-numbers'], ['Find the Duplicate Number', 'M', 'find-the-duplicate-number'], ['LRU Cache', 'M', 'lru-cache'], ['Reverse Nodes in K-Group', 'H', 'reverse-nodes-in-k-group'], ['Palindrome Linked List', 'E', 'palindrome-linked-list'], ['Middle of the Linked List', 'E', 'middle-of-the-linked-list']]],
  ['Trees', [['Diameter of Binary Tree', 'E', 'diameter-of-binary-tree'], ['Balanced Binary Tree', 'E', 'balanced-binary-tree'], ['Right Side View', 'M', 'binary-tree-right-side-view'], ['Count Good Nodes', 'M', 'count-good-nodes-in-binary-tree'], ['LCA of Binary Tree', 'M', 'lowest-common-ancestor-of-a-binary-tree'], ['Zigzag Level Order', 'M', 'binary-tree-zigzag-level-order-traversal']]],
  ['Heap / Priority Queue', [['Kth Largest in a Stream', 'E', 'kth-largest-element-in-a-stream'], ['Last Stone Weight', 'E', 'last-stone-weight'], ['K Closest Points to Origin', 'M', 'k-closest-points-to-origin'], ['Kth Largest Element in Array', 'M', 'kth-largest-element-in-an-array'], ['Task Scheduler', 'M', 'task-scheduler'], ['Design Twitter', 'M', 'design-twitter']]],
  ['Backtracking', [['Subsets', 'M', 'subsets'], ['Combination Sum', 'M', 'combination-sum'], ['Permutations', 'M', 'permutations'], ['Subsets II', 'M', 'subsets-ii'], ['Combination Sum II', 'M', 'combination-sum-ii'], ['Palindrome Partitioning', 'M', 'palindrome-partitioning'], ['Letter Combinations of Phone Number', 'M', 'letter-combinations-of-a-phone-number'], ['N-Queens', 'H', 'n-queens']]],
  ['Graphs', [['Rotting Oranges', 'M', 'rotting-oranges'], ['Surrounded Regions', 'M', 'surrounded-regions'], ['Course Schedule II', 'M', 'course-schedule-ii'], ['Redundant Connection', 'M', 'redundant-connection'], ['Word Ladder', 'H', 'word-ladder'], ['Network Delay Time', 'M', 'network-delay-time'], ['Cheapest Flights Within K Stops', 'M', 'cheapest-flights-within-k-stops'], ['Min Cost to Connect All Points', 'M', 'min-cost-to-connect-all-points']]],
  ['1-D DP', [['Min Cost Climbing Stairs', 'E', 'min-cost-climbing-stairs'], ['Palindromic Substrings', 'M', 'palindromic-substrings'], ['Maximum Product Subarray', 'M', 'maximum-product-subarray'], ['Partition Equal Subset Sum', 'M', 'partition-equal-subset-sum']]],
  ['2-D DP', [['Longest Common Subsequence', 'M', 'longest-common-subsequence'], ['Best Time Buy/Sell with Cooldown', 'M', 'best-time-to-buy-and-sell-stock-with-cooldown'], ['Coin Change II', 'M', 'coin-change-ii'], ['Target Sum', 'M', 'target-sum'], ['Interleaving String', 'M', 'interleaving-string'], ['Edit Distance', 'M', 'edit-distance'], ['Distinct Subsequences', 'H', 'distinct-subsequences'], ['Burst Balloons', 'H', 'burst-balloons'], ['Regular Expression Matching', 'H', 'regular-expression-matching']]],
  ['Greedy', [['Gas Station', 'M', 'gas-station'], ['Hand of Straights', 'M', 'hand-of-straights'], ['Merge Triplets to Form Target', 'M', 'merge-triplets-to-form-target-triplet'], ['Partition Labels', 'M', 'partition-labels'], ['Valid Parenthesis String', 'M', 'valid-parenthesis-string'], ['Jump Game II', 'M', 'jump-game-ii']]],
  ['Math & Geometry', [['Happy Number', 'E', 'happy-number'], ['Plus One', 'E', 'plus-one'], ['Pow(x,n)', 'M', 'powx-n'], ['Multiply Strings', 'M', 'multiply-strings'], ['Detect Squares', 'M', 'detect-squares']]],
  ['Bit Manipulation', [['Single Number', 'E', 'single-number'], ['Reverse Integer', 'M', 'reverse-integer']]]
];
const STRIVER = [
  ['Step 1 · Basics & Sorting', [['Count Digits / Palindrome Number', 'E', 'palindrome-number'], ['GCD & Armstrong Numbers', 'E', 'armstrong-numbers'], ['Selection / Bubble / Insertion Sort', 'E', 'insertion-sort'], ['Merge Sort', 'M', 'sort-an-array'], ['Quick Sort', 'M', 'quick-sort']]],
  ['Step 2 · Arrays', [['Second Largest Element', 'E', 'second-largest-digits-in-a-string'], ['Rotate Array by K', 'M', 'rotate-array'], ['Move Zeroes', 'E', 'move-zeroes'], ['Missing Number', 'E', 'missing-number'], ['Two Sum', 'E', 'two-sum'], ['Sort 0s 1s 2s', 'M', 'sort-colors'], ['Majority Element', 'E', 'majority-element'], ['Kadane\'s Maximum Subarray', 'M', 'maximum-subarray'], ['Best Time to Buy & Sell Stock', 'E', 'best-time-to-buy-and-sell-stock'], ['Next Permutation', 'M', 'next-permutation'], ['Set Matrix Zeroes', 'M', 'set-matrix-zeroes'], ['Rotate Image', 'M', 'rotate-image'], ['Spiral Matrix', 'M', 'spiral-matrix'], ['3Sum', 'M', '3sum'], ['4Sum', 'M', '4sum'], ['Merge Intervals', 'M', 'merge-intervals'], ['Maximum Product Subarray', 'M', 'maximum-product-subarray'], ['Count Subarray Sum = K', 'M', 'subarray-sum-equals-k']]],
  ['Step 3 · Binary Search', [['Binary Search', 'E', 'binary-search'], ['First & Last Occurrence', 'M', 'find-first-and-last-position-of-element-in-sorted-array'], ['Search in Rotated Sorted Array', 'M', 'search-in-rotated-sorted-array'], ['Find Minimum in Rotated Array', 'M', 'find-minimum-in-rotated-sorted-array'], ['Single Element in Sorted Array', 'M', 'single-element-in-a-sorted-array'], ['Find Peak Element', 'M', 'find-peak-element'], ['Sqrt(x)', 'E', 'sqrtx'], ['Koko Eating Bananas', 'M', 'koko-eating-bananas'], ['Aggressive Cows', 'M', 'aggressive-cows'], ['Capacity to Ship Packages', 'M', 'capacity-to-ship-packages-within-d-days'], ['Median of Two Sorted Arrays', 'H', 'median-of-two-sorted-arrays'], ['Search a 2D Matrix', 'M', 'search-a-2d-matrix']]],
  ['Step 4 · Strings', [['Remove Outermost Parentheses', 'E', 'minimum-remove-to-make-valid-parentheses'], ['Reverse Words in a String', 'M', 'reverse-words-in-a-string'], ['Longest Common Prefix', 'E', 'longest-common-prefix'], ['Valid Anagram', 'E', 'valid-anagram'], ['String to Integer (atoi)', 'M', 'string-to-integer-atoi'], ['Longest Palindromic Substring', 'M', 'longest-palindromic-substring'], ['Group Anagrams', 'M', 'group-anagrams'], ['KMP Pattern Search', 'H', 'find-the-index-of-the-first-occurrence-in-a-string']]],
  ['Step 5 · Linked List', [['Reverse Linked List', 'E', 'reverse-linked-list'], ['Middle of Linked List', 'E', 'middle-of-the-linked-list'], ['Detect Cycle', 'E', 'linked-list-cycle'], ['Start of Cycle', 'M', 'linked-list-cycle-ii'], ['Palindrome Linked List', 'E', 'palindrome-linked-list'], ['Merge Two Sorted Lists', 'E', 'merge-two-sorted-lists'], ['Remove Nth From End', 'M', 'remove-nth-node-from-end-of-list'], ['Add Two Numbers', 'M', 'add-two-numbers'], ['Intersection of Two Lists', 'E', 'intersection-of-two-linked-lists'], ['Sort a Linked List', 'M', 'sort-list'], ['Rotate a Linked List', 'M', 'rotate-list'], ['Reverse Nodes in K-Group', 'H', 'reverse-nodes-in-k-group']]],
  ['Step 6 · Recursion & Backtracking', [['Pow(x,n)', 'M', 'powx-n'], ['Generate Parentheses', 'M', 'generate-parentheses'], ['Subsets', 'M', 'subsets'], ['Combination Sum', 'M', 'combination-sum'], ['Palindrome Partitioning', 'M', 'palindrome-partitioning'], ['Permutations', 'M', 'permutations'], ['N-Queens', 'H', 'n-queens'], ['Word Search', 'M', 'word-search'], ['Sudoku Solver', 'H', 'sudoku-solver'], ['Rat in a Maze', 'M', 'rat-in-a-maze']]],
  ['Step 7 · Stack & Queue', [['Valid Parentheses', 'E', 'valid-parentheses'], ['Min Stack', 'M', 'min-stack'], ['Stack using Queues', 'E', 'implement-stack-using-queues'], ['Queue using Stacks', 'E', 'implement-queue-using-stacks'], ['Next Greater Element', 'M', 'daily-temperatures'], ['Largest Rectangle in Histogram', 'H', 'largest-rectangle-in-histogram'], ['Sliding Window Maximum', 'H', 'sliding-window-maximum'], ['LRU Cache', 'M', 'lru-cache']]],
  ['Step 8 · Sliding Window / Two Pointer', [['Longest Substring w/o Repeat', 'M', 'longest-substring-without-repeating-characters'], ['Max Consecutive Ones III', 'M', 'max-consecutive-ones-iii'], ['Longest Repeating Char Replacement', 'M', 'longest-repeating-character-replacement'], ['Minimum Window Substring', 'H', 'minimum-window-substring'], ['Container With Most Water', 'M', 'container-with-most-water'], ['Trapping Rain Water', 'H', 'trapping-rain-water']]],
  ['Step 9 · Heaps', [['Kth Largest Element', 'M', 'kth-largest-element-in-an-array'], ['Top K Frequent Elements', 'M', 'top-k-frequent-elements'], ['Task Scheduler', 'M', 'task-scheduler'], ['Merge K Sorted Lists', 'H', 'merge-k-sorted-lists'], ['Median from Data Stream', 'H', 'find-median-from-data-stream']]],
  ['Step 10 · Binary Trees', [['Traversals (In/Pre/Post)', 'E', 'binary-tree-inorder-traversal'], ['Maximum Depth', 'E', 'maximum-depth-of-binary-tree'], ['Balanced Binary Tree', 'E', 'balanced-binary-tree'], ['Diameter of Binary Tree', 'E', 'diameter-of-binary-tree'], ['Maximum Path Sum', 'H', 'binary-tree-maximum-path-sum'], ['Same Tree', 'E', 'same-tree'], ['Zigzag Traversal', 'M', 'binary-tree-zigzag-level-order-traversal'], ['Right Side View', 'M', 'binary-tree-right-side-view'], ['LCA of Binary Tree', 'M', 'lowest-common-ancestor-of-a-binary-tree'], ['Construct from Preorder & Inorder', 'M', 'construct-binary-tree-from-preorder-and-inorder-traversal'], ['Serialize & Deserialize', 'H', 'serialize-and-deserialize-binary-tree'], ['Flatten to Linked List', 'M', 'flatten-binary-tree-to-linked-list']]],
  ['Step 11 · BST', [['Search in BST', 'E', 'search-in-a-binary-search-tree'], ['Insert into BST', 'M', 'insert-into-a-binary-search-tree'], ['Delete Node in BST', 'M', 'delete-node-in-a-bst'], ['Kth Smallest in BST', 'M', 'kth-smallest-element-in-a-bst'], ['Validate BST', 'M', 'validate-binary-search-tree'], ['LCA of BST', 'M', 'lowest-common-ancestor-of-a-binary-search-tree'], ['Two Sum in BST', 'E', 'two-sum-iv-input-is-a-bst']]],
  ['Step 12 · Graphs', [['BFS & DFS', 'E', 'bfs-of-graph'], ['Number of Provinces', 'M', 'number-of-provinces'], ['Number of Islands', 'M', 'number-of-islands'], ['Rotting Oranges', 'M', 'rotting-oranges'], ['Cycle Detection (Course Schedule)', 'M', 'course-schedule'], ['Topological Sort (Course Schedule II)', 'M', 'course-schedule-ii'], ['Dijkstra (Network Delay)', 'M', 'network-delay-time'], ['Cheapest Flights K Stops', 'M', 'cheapest-flights-within-k-stops'], ['Word Ladder', 'H', 'word-ladder'], ['MST (Connect All Points)', 'M', 'min-cost-to-connect-all-points']]],
  ['Step 13 · Dynamic Programming', [['Climbing Stairs', 'E', 'climbing-stairs'], ['House Robber', 'M', 'house-robber'], ['House Robber II', 'M', 'house-robber-ii'], ['Unique Paths', 'M', 'unique-paths'], ['Min Path Sum', 'M', 'minimum-path-sum'], ['Subset Sum', 'M', 'subset-sum-problem'], ['Partition Equal Subset Sum', 'M', 'partition-equal-subset-sum'], ['0/1 Knapsack', 'M', '0-1-knapsack'], ['Coin Change', 'M', 'coin-change'], ['Coin Change II', 'M', 'coin-change-ii'], ['Longest Common Subsequence', 'M', 'longest-common-subsequence'], ['Edit Distance', 'M', 'edit-distance'], ['Longest Increasing Subsequence', 'M', 'longest-increasing-subsequence'], ['Buy/Sell Stock with Cooldown', 'M', 'best-time-to-buy-and-sell-stock-with-cooldown'], ['Word Break', 'M', 'word-break'], ['Palindrome Partitioning II', 'H', 'palindrome-partitioning-ii'], ['Burst Balloons', 'H', 'burst-balloons']]],
  ['Step 14 · Tries & Bit Manipulation', [['Implement Trie', 'M', 'implement-trie-prefix-tree'], ['Word Search II', 'H', 'word-search-ii'], ['Single Number', 'E', 'single-number'], ['Number of 1 Bits', 'E', 'number-of-1-bits'], ['Reverse Bits', 'E', 'reverse-bits'], ['Counting Bits', 'E', 'counting-bits'], ['Power of Two', 'E', 'power-of-two']]]
];

const SHEETS = {
  blind75: { name: 'Blind 75', icon: '🎯', desc: 'The classic 75 must-solve interview problems.', groups: BLIND75 },
  neet150: { name: 'NeetCode 150', icon: '⚡', desc: 'Blind 75 plus 75 more — the complete roadmap.', groups: [...BLIND75.map(g => ['★ ' + g[0], g[1]]), ...NEETCODE_EXTRA] },
  striver: { name: 'Striver A2Z (Core)', icon: '🏔️', desc: 'The essential problems from Striver\'s A2Z sheet, step by step.', groups: STRIVER }
};

const COMPANIES = [
  {
    n: 'Fidelity Investments', yr: [2026], q: {
      DSA: ['Remove duplicates (3 approaches)', 'Valid parentheses & balanced-parentheses check', '3Sum', 'Reverse a linked list & detect cycle', 'Kadane\'s maximum subarray + max subarray of size K', 'Check duplicate subtrees in a binary tree', 'Dijkstra\'s shortest distance algorithm', 'String anagram detection'],
      DBMS: ['What is normalization? Types?', 'ACID properties', 'Indexing', 'Foreign keys — can they be NULL?', 'How to optimize DB queries for large datasets', 'SQL vs MySQL'],
      SQL: ['Joins (INNER / OUTER / FULL OUTER) with queries', 'Views in SQL'],
      OS: ['Race condition', 'Thrashing', 'Multithreading vs multiprocessing', 'Critical region handling'],
      CN: ['DNS & HTTP working', 'TCP 3-way handshake and piggybacking'],
      Java: ['Java Virtual Machine', 'Diamond problem in Java', 'Interface in Java', 'Threading in Java'],
      OOP: ['Explain all 4 pillars with real-life examples'],
      SD: ['What is caching in the cloud?', 'How are API keys secured?', 'How is concurrency handled in HashMaps?', 'How would you scale your project for Amazon-level load?'],
      Projects: ['Why MongoDB, why not SQL?', 'Complete architecture of your project', 'React components, props, virtual DOM, prop drilling', 'Closures & async JS'],
      HR: ['Introduce yourself; deep dive into hobbies', 'Why this college? What differentiates you?', 'If given all technology, which community problem would you solve first?'],
      Aptitude: ['Series patterns (subtraction/multiplication)', 'Measure 9 minutes with 7 & 4-minute hourglasses', 'Make the array zero by subtracting equal amounts']
    }
  },
  {
    n: 'Akamai Technologies', yr: [2026], q: {
      DSA: ['LRU Cache (hard)', 'Tree → Linked List; Zigzag traversal', 'Mountain problem; Kth largest element (optimal)', 'Shortest substring containing all unique letters', 'All algorithms with their time complexities'],
      OOP: ['Area of shapes using classes & objects', 'Swap values of two objects', 'Thread-safety program in Java', 'Predict output (pointers)'],
      SQL: ['DBMS joins + SQL queries', 'ER diagram: your project + college database'],
      OS: ['Process vs threads', 'Garbage collection & memory management in Java vs C++ vs C'],
      CN: ['TCP/IP & OSI models traced through a web URL', 'Client-server & email architecture'],
      SD: ['High-level system design of your project', 'Spring Boot architecture & dependency injection', 'API design rules; WebSockets', 'Relational vs non-relational DBMS with normal forms'],
      Projects: ['Why MongoDB?', 'Frontend↔backend connection & API flow', 'Explanation of every keyword on your resume'],
      Aptitude: ['2 asymmetric ropes, measure 45 min', 'Birthday-card budget puzzle', 'Bridge crossing with 4 people & a torch', 'Age puzzle: when was your age double your brother\'s'],
      HR: ['Why should we hire you?', 'How did you upskill during college?', 'Achievements in the last 6 months']
    }
  },
  {
    n: 'Emerson', yr: [2026], q: {
      DSA: ['Merge sort explanation', 'Primes 1–100 with & without recursion', 'Longest Increasing Subsequence', 'Trapping Rain Water', '3Sum with test cases + complexity', 'Reverse a singly linked list', 'Sort 0s & 1s in increasing order', '2 DP questions (3-D DP, House Robber)', 'Sorting people by age in C++ (then with a different DS)'],
      OOP: ['Overloading vs overriding'],
      Projects: ['Explain ML & drone (hardware) projects', 'Why this tech stack?'],
      HR: ['Why Emerson / what does Emerson do?', 'Interests apart from engineering', 'Where do you see yourself in 5 years?', 'Strengths & weaknesses']
    }
  },
  {
    n: 'Commscope', yr: [2025, 2026], q: {
      DSA: ['Delete middle node of a singly linked list (+ edge cases)', 'Bubble sort: best/worst/average + early-exit optimization', 'Least frequent character in a string (brute → optimal)', 'Time complexity of searching a binary tree (balanced?)', 'Missing number in a sequence via pattern + pseudocode'],
      OOP: ['Four pillars with code', 'Encapsulation vs abstraction', 'Constructors with examples', 'Double pointers in C/C++'],
      OS: ['Multithreading vs multiprocessing', 'Mutex vs semaphore vs spinlock', 'Deadlocks & prevention', 'Producer-consumer using mutex & semaphores', 'Static vs dynamic memory allocation', 'Call by value vs call by reference'],
      CN: ['IP address classes A/B/C — hosts & networks per class'],
      DBMS: ['SQL vs NoSQL; when MongoDB over MySQL', 'ACID & why MongoDB is not fully ACID', 'Indexing in SQL vs MongoDB'],
      SD: ['React architecture & Virtual DOM', 'REST APIs: GET/POST/PUT/PATCH/DELETE', 'Auth in REST APIs; testing with Postman', 'Cloud computing basics'],
      Projects: ['Why React over Angular/Vue?', 'How do you manage API calls, loading states & errors?'],
      HR: ['Something about yourself not in the resume', 'How do you handle failure?', 'Future plans if not hired for this role']
    }
  },
  {
    n: 'Schneider Electric', yr: [2025, 2026], q: {
      DSA: ['Print repeated characters in a string (+frequency)', 'Swap two numbers without a third variable', 'Linked-list basics'],
      SQL: ['Day of 2nd-highest sale using ROW_NUMBER', 'Create table & extract columns under a specific date', 'FULL OUTER JOIN for two tables'],
      DBMS: ['SQL vs NoSQL; different DBs in different environments', 'Use of transactions'],
      OS: ['Sessions, cookies, stateless vs stateful servers'],
      CN: ['Reverse proxy', 'HTTP vs HTTPS', 'Firewall & data masking'],
      SD: ['Spring Boot & Spring Core basics', 'Circuit breaker & fallback methods', 'AWS services; what is an S3 bucket?', 'CAP theorem & trade-offs', 'Scaling Docker containers, Kubernetes, CI/CD'],
      Projects: ['REST APIs in your project — errors & scalability', 'Draw the high-level architecture', 'Deployment: how & where?', 'Auth methods used'],
      HR: ['Why Schneider? Do you know its products & tools?', 'Are you okay with relocation?', 'Where do you see yourself in 5/10 years?', 'Conflict-handling scenarios as group leader']
    }
  },
  {
    n: 'LG Soft', yr: [2026], q: {
      DSA: ['Wildcard Matching; Group Anagrams', 'Search in Rotated Sorted Array; Peak element', 'First & last occurrence; Reverse the bits', 'Count of smaller elements except self (hard)', 'Top K frequent elements', '3rd largest number in an unsorted array', 'AVL tree implementation in C/C++', 'Bubble sort; Merge sort with code', 'Valid Parentheses; strong-password check', 'Shortest Subarray with Sum ≥ K; Search a 2D Matrix'],
      OOP: ['All 4 pillars with code', 'Function overloading/overriding & operator overloading in your project', 'Copy constructor (Student class)', 'Virtual functions; int* ptr vs int *ptr', 'Structures vs unions; encapsulation in C++', 'Access specifiers in C++'],
      OS: ['What is a thread? Create one explicitly & run a task', 'Race condition; mutex', 'Thread vs process; kernel & scheduling', 'Paging & segmentation', 'malloc — allocate a 2D array', 'Static variables & constant pointers'],
      Projects: ['Explain your MERN project & your role'],
      HR: ['Future domains that may dominate (AI, automation)', 'Which domain do you want to work in?', 'Hobbies & how you interact with surroundings']
    }
  },
  {
    n: 'A.P. Moller Maersk', yr: [2026], q: {
      DSA: ['Reverse linked list & reverse array', 'All sorting techniques + complexities; selection sort dry run', 'Binary search — code, dry run, when used', 'Koko Eating Bananas; Missing number', 'String palindrome; min & max of array', 'Doubly linked list: all operations + reversal', 'Longest Common Subsequence', 'HashMap vs Array vs ArrayList'],
      SD: ['.NET basics; API concepts & HTTP', 'Node.js architecture — event loop, sync vs async', 'Single vs multi-threaded servers; server-side optimization', 'Why Redis, Kafka, RabbitMQ, Docker, Kubernetes?', 'JWT & authentication basics'],
      Projects: ['HTML page: name+password, redirect to google.com on click', 'React: map(), state changes, rendering; var/let/const; async-await & Promises', 'What is scalability according to you?', 'How will you attract users to your website?'],
      Aptitude: ['5L & 3L containers — measure 4L', '5 machines produce coins, one defective — find in one weighing', 'Reverse-alternative of your name'],
      HR: ['Would you work weekends if asked?', 'Team quarrel scenario as leader', 'Entrepreneur or core-developer mindset?']
    }
  },
  {
    n: 'RedBus', yr: [2025, 2026], q: {
      DSA: ['Kadane\'s maximum subarray (code + steps)', 'Two Sum', 'Sort array of 0s,1s,2s', 'Remove Nth node from a linked list', 'Largest connected region of 1s in a binary matrix', 'Spiral traversal of a matrix', 'Rotate an array by K', 'House Robber (max sum of non-adjacent)', 'Slow & fast pointer; build & traverse a DLL', '2nd duplicate character in a string', 'Frequency of each element without HashMap', 'Reverse alternative words; monotonic array', 'Identify a BST', 'Crossword: find words in a 2D grid (all directions)'],
      SQL: ['Delete duplicate emails keeping smallest ID', 'GROUP BY; aggregate functions'],
      DBMS: ['Normalization & normal forms (1NF→BCNF)', 'ER diagrams with examples', 'Inner vs outer join', 'Why MongoDB over SQL?', 'How is MongoDB ObjectId generated?', 'Two users book the same seat — concurrency handling'],
      OOP: ['OOP basics; diamond problem'],
      SD: ['REST API working; how do you test an API (Postman)?', 'JWT token — concept & use case', 'RedBus seat-booking problem'],
      Aptitude: ['9-coin / 9-iron-block balance puzzle', 'Egg drop: 100 floors, 3 eggs (binary search)', 'Snail in a 30-ft well', 'Gold bar: 2 cuts, pay $200/month', 'Clock angle puzzle', 'Arrange array so adjacent sums are prime'],
      HR: ['Why this role? Why RedBus?', 'Family background']
    }
  },
  {
    n: 'Epicor', yr: [2025, 2026], q: {
      DSA: ['Find a word in a sentence without built-ins', 'Substring matching (KMP / Horspool)', 'Duplicates in an array with occurrence counts', 'Primes in a range', 'Sort first half ascending, second half descending', 'Implement stack using queue & queue using stack', 'Insertion & reversal in a doubly linked list', 'What is dynamic programming?', 'Reverse a string (logic)', 'Linear vs binary search'],
      SQL: ['Second-highest salary', 'Foreign-key based query', 'GROUP BY + HAVING: students per category', 'Languages used in DBMS'],
      OOP: ['Classes & objects — full explanation', 'super keyword; static variables; getters/setters', 'Access modifiers: public/private/protected/default', 'Abstraction, interface; C# vs C++ vs Java', 'Explain encapsulation to a farmer/businessman'],
      Projects: ['Why Node.js & React?', 'Web scraping + cron-based refresh explained', 'Schemas used'],
      Aptitude: ['2 candles (1 hr each) — measure 45 min', '8 balls, one heavier — 2 weighings', '3 switches, 3 bulbs — one entry'],
      HR: ['3 good & 3 bad things friends would say', 'Describe yourself as a brand in 3 words', 'Frontend or backend? WFH or office?', 'ML trends, LLMs, how AI agents work']
    }
  },
  {
    n: 'Lam Research', yr: [2025, 2026], q: {
      CN: ['IP spoofing; firewall; disaster recovery', 'OSI model', 'ipconfig & ping commands', 'Switch vs router; MAC address'],
      SQL: ['Joins given a DB (create table + join query)', 'DROP vs DELETE vs TRUNCATE', 'HAVING vs WHERE', 'Remove duplicate student_ids without primary key or new table', 'Index & its types'],
      DSA: ['Count white spaces in a string (C++)', 'Linear vs non-linear data structures', 'ATM sequence matching (code)', 'Insert into a sorted linked list', 'Search in unsorted → sorted (binary search) with dry run', 'Implement stack using queue', 'Quick sort + other sorting algorithms', 'Python: remove duplicates from a list'],
      OOP: ['4 pillars; encapsulation vs abstraction', 'Abstract classes via examples', 'Overloading & overriding applications'],
      SD: ['Cloud computing & cloud tools', 'Spring Boot tech stack; Scrum model', 'Party app design: group children by age, scoreboard, DB design & flow', 'Build a webpage: username, password, email link'],
      Projects: ['ER-diagram database design for your project', 'Working-flow diagram'],
      HR: ['Explain ChatGPT to a non-technical person', 'What scares you the most?', 'Money vs passion', 'Supply chain & what Lam Research does']
    }
  },
  {
    n: 'HPE (Hewlett Packard Enterprise)', yr: [2025], q: {
      OS: ['Virtual memory with a real-world example', 'Demand paging; page table', 'Paging vs segmentation; RAID', 'Threads vs processes; 10 operating systems', 'Multiprogramming vs multitasking', 'Semaphore operations; deadlocks & prevention', 'Thrashing; what happens at boot without an OS?', 'Process scheduling algorithms; IPC components'],
      CN: ['OSI layers & where routers operate', 'TCP vs UDP; OSI vs TCP/IP', 'Router vs gateway; bridge; VPN', 'FTP, SMTP, RIP, DHCP', 'What happens when you type www.google.com', 'IPv4 vs IPv6; ping command'],
      DSA: ['Palindrome string (full C++ program)', 'Count set bits of an integer', 'Sorted array: target or largest ≤ target', 'BST concepts & operations', 'Stack using array + real-life applications', 'Optimize parentheses validation', 'Longest palindromic substring', 'Reverse word order in a string', 'Longest common prefix', 'Circular linked list using a class'],
      OOP: ['Constructors & destructors + types', 'Compile-time vs runtime polymorphism', 'Access modifiers; call by value vs reference', 'Virtual functions; why return 0?'],
      DBMS: ['Types of normalization; keys & constraints', 'Types of joins'],
      SD: ['REST API; PUT vs PATCH', 'React: DOM vs Virtual DOM', 'High-level design: sales dashboard from a DB', 'JWT & how it is generated'],
      Aptitude: ['25 horses, find top 3 in 7 races'],
      HR: ['Why HPE? FTE role expectations', 'Managerial: handling failure, deadlines, conflicts']
    }
  },
  {
    n: 'Thoughtworks', yr: [2025], q: {
      DSA: ['Cost calculator from a raw-materials dictionary + write & fix its test cases', 'Binary search program', 'Search in a rotated sorted array'],
      OOP: ['Types of constructors', 'Shallow vs deep copy', 'Four pillars; virtual functions', 'Hierarchical vs multiple inheritance; multi-level code'],
      CN: ['OSI model; app-layer → physical-layer data flow', 'DHCP vs DNS'],
      OS: ['Deadlocks: 4 conditions, prevention, Banker\'s algorithm', 'Detect deadlock using resource-allocation matrices'],
      SQL: ['INNER JOIN query on two tables', 'GROUP BY with COUNT / AVG; WHERE vs HAVING'],
      HR: ['Task without enough information — what do you do?', 'Negative feedback; project failure response']
    }
  },
  {
    n: 'Oracle', yr: [2025], q: {
      DBMS: ['Triggers, procedures & functions (+differences)', 'Views & their types; NVL & cursors', 'DELETE vs TRUNCATE; DDL/DML/DCL/TCL/DQL', 'Commits, rollbacks & transactions', 'Constraints, indexes & intersection', 'Database designing vs database management'],
      SQL: ['Joins, views & indexes queries', 'INNER vs OUTER JOIN; LEFT/RIGHT examples', 'Count employees per department', 'Second-highest salary', 'GROUP BY vs HAVING'],
      DSA: ['Palindrome number; swap without third variable', 'Empty diamond pattern in C', 'Recursion via Fibonacci; basic sorting', 'Tree traversals; count distinct elements', 'Add two matrices'],
      OOP: ['4 pillars with examples', 'Single vs multiple inheritance; runtime polymorphism', 'Exception handling in C++'],
      SD: ['How Docker works & what problem it solves', 'REST API; GET vs POST', 'Public/private/hybrid cloud; AWS vs Azure vs GCP'],
      HR: ['Willing to relocate?', 'Specialization vs generalization', 'Opinion on AI & its future impact']
    }
  },
  {
    n: 'Big Basket', yr: [2025], q: {
      DSA: ['Reverse a string (iterative & recursive)', 'Remove outermost parentheses', 'Duplicate characters in a string', 'Dutch National Flag (0s,1s,2s)', 'Two Sum (brute → hashmap)', 'Kadane\'s; max product subarray', 'Count negatives in a sorted matrix', 'Stack via arrays & linked lists', '3Sum; delete nth-last node of a linked list', 'Detect loop + find its start; sort a linked list'],
      SQL: ['Inner join syntax & use cases', 'Aggregates: COUNT, SUM, AVG, MAX, MIN', 'Min platforms for train schedules'],
      DBMS: ['Partitioning & its benefits; all join types', 'MySQL vs NoSQL; indexing types', 'Normalization: types, pros & cons', 'Locks & their types; deadlock conditions'],
      OS: ['Thrashing & prevention', 'Multiprocessing vs multitasking', 'Paging & virtual memory; logical vs physical addresses'],
      OOP: ['4 pillars; overloading vs overriding', 'Interfaces vs abstract classes', 'Multiple vs multilevel inheritance problems'],
      SD: ['Virtual DOM in React; state vs props; lifecycle', 'HTTP vs HTTPS', 'Design patterns; microservices vs monolith; HLD'],
      Aptitude: ['3L & 5L jugs → 4L', '10 coins: 5 heads 5 tails — split equally']
    }
  },
  {
    n: 'Amadeus', yr: [2025], q: {
      DSA: ['Merge sort in C++', 'Reverse a string using a stack (no library)', 'Binary tree implementation', 'Palindrome number; stack using array', 'Second largest in an array', 'Pop middle element of a stack', 'LRU — concept + code'],
      OOP: ['Four pillars with a Student class', 'Overriding vs overloading', 'Virtual & friend functions in C++', 'malloc & the new keyword'],
      OS: ['Semaphores & mutexes', 'Demand paging; virtual memory'],
      CN: ['HTTPS vs TCP/IP; 7 OSI layers'],
      DBMS: ['Normalization with example (your project tables)'],
      HR: ['Feedback you adopted', 'Biggest problem you faced', 'Why Amadeus?']
    }
  },
  {
    n: 'Aptiv', yr: [2025], q: {
      OOP: ['Polymorphism, abstraction, encapsulation', 'Copy constructors vs regular', 'Constructor & operator overloading', 'Pure virtual vs virtual functions', 'Shallow vs deep copy; volatile keyword', 'struct vs union + memory size'],
      DSA: ['Stack vs queue; trees & BST basics', 'Second largest element', 'Intersection point of two linked lists', 'Time & space complexity; greedy example; divide & conquer'],
      OS: ['Threads vs processes; scheduling algorithms', 'Compilation steps; linker\'s role', 'Dynamic memory allocation & realloc', 'RTOS basics'],
      CN: ['OSI layers & functions; TCP vs UDP', 'Routing protocols; ARP; topologies'],
      SD: ['SDLC; Agile vs Waterfall; design patterns', 'Movie-ticket booking system considerations'],
      Projects: ['Closures; let/const/var; event delegation; Promises'],
      HR: ['Conflict with a team member', 'Decision with incomplete information']
    }
  },
  {
    n: 'Lowe\'s India', yr: [2025], q: {
      DBMS: ['RDBMS vs NoSQL; when MongoDB vs MySQL', 'ER diagram of your project DB', 'Normalization; triggers; WHERE/COUNT queries'],
      SQL: ['Join 2 tables → salary with name', 'Types of joins in MySQL'],
      DSA: ['Favorite data structure + applications', 'BST: when does search become O(n)?', 'AVL trees & their use', 'Problem of building BST from a sorted array', 'Array frequency counting + verify all counted', 'Anagram grouping {dog,god},{act,cat} with harder variants', 'Real-life uses of arrays, linked lists, stacks; graphs; red-black trees'],
      SD: ['REST architecture; API endpoint syntax', 'Socket.io & how a message is sent', 'GraphQL — why & what', 'Authentication approach'],
      CN: ['Application-layer protocols + port numbers', 'HTTP vs HTTPS'],
      HR: ['Things you want/don\'t want to change about yourself', 'Biggest failure; leading a team through disagreements']
    }
  },
  {
    n: 'MiQ Digital', yr: [2025], q: {
      Java: ['Java OOP; string immutability', '== vs .equals(); JVM', 'Function overriding with examples'],
      DSA: ['Hare & Tortoise method + complexity', 'Pairs with given sum — complexity', 'Merge sort; binary search complexities', 'Missing number; nth node from end', 'Two Sum & detect-loop space complexity + edge cases'],
      SQL: ['Join four tables', 'Second-highest salary', 'College DB design + max marks per semester'],
      DBMS: ['ACID with real-world mapping; dirty read & phantom', 'Composite key; NoSQL vs MySQL', 'Normalization up to 5NF'],
      OS: ['Deadlock + necessary conditions'],
      SD: ['SOLID principles', 'Client-server architecture; two-way handshake'],
      Projects: ['JS event loop; single vs multi-threaded JS; async handling', 'Why MongoDB? State management & routing in React'],
      HR: ['How would you feel if we rejected you?', 'Stipend opinion; relocation']
    }
  },
  {
    n: 'Dish Network', yr: [2025], q: {
      SQL: ['Second-highest salary (rank + join per department)', 'Detect duplicates; update names sun→moon', 'Right join; employees who joined before manager', 'Employees hired in 2024; aggregate functions'],
      DBMS: ['Normalization & constraint types', 'DBMS vs RDBMS; primary & foreign keys'],
      DSA: ['Reverse string & factorial via recursion (C++)', 'Multiply without * (bitwise shifts)', 'Binary search implementation', 'Reverse words; remove/print duplicates in array', 'Half-descending half-ascending array sort', 'Array vs linked list; stack vs queue; hashtable uses', 'BST & linked-list types + applications'],
      OOP: ['4 pillars real-world; overloading vs overriding', 'Constructor vs destructor; new keyword'],
      OS: ['Scheduling algorithms (RR, FCFS)', 'Zombie process'],
      SD: ['JWT; OSI model; exception handling in JS'],
      HR: ['Misreporting scenario — what would you do?', 'Demo of hosted projects']
    }
  },
  {
    n: 'Samsung', yr: [2025], q: {
      DSA: ['Frequency of an element in a sorted array (binary search)', 'Rotate array by one; rotated array problems', 'Majority element', 'Stack using linked list', 'Bitwise binary operators; operator overloading'],
      OS: ['Mutex/locks, semaphores, synchronization', 'Starvation & priority inversion', 'Paging & virtual memory', 'User vs kernel mode; interrupts (hardware examples)', 'Multithreading vs multiprocessing vs multitasking'],
      OOP: ['Why OOP? Inheritance; static vs dynamic polymorphism', 'Abstract classes'],
      Aptitude: ['3 eggs, 10 floors — optimal breaking point', 'Space for 10×10-bit pixels; bits in 1B/1MB/1GB/1TB'],
      Projects: ['Embedded systems + real-life example', 'Fastest language: C vs C++ vs Java?']
    }
  },
  {
    n: 'SAP Labs', yr: [2025], q: {
      DBMS: ['Normalization + forms', 'Truncate vs Drop vs Delete', 'Stored procedure vs trigger', 'Transactions & ACID; DDL vs DML'],
      SQL: ['Union vs Union All; subqueries', 'Joins with diagrams; HAVING vs WHERE', 'Create table & operate on data'],
      DSA: ['Insertion sort + pseudocode', 'Uppercase↔lowercase conversion', 'Pyramid star pattern; stack & queue approach'],
      OOP: ['Class & object real-world; pillars', 'Polymorphism & abstraction', 'Constructor vs static method; abstract methods', 'Call by reference vs call by pointer', 'malloc vs calloc; class memory size'],
      OS: ['Process vs thread; process states'],
      SD: ['Waterfall & SDLC models; cloud computing', 'JWT tokens & their working'],
      Aptitude: ['Torch & bridge puzzle', '3L & 5L buckets → 4L; frog in a well'],
      HR: ['Convince a customer to buy a pen', 'Ideal manager; angry customer handling', 'Why SAP? Customer-support role fit']
    }
  },
  {
    n: 'TCS', yr: [2025], q: {
      Java: ['Java vs C; inheritance & interfaces', 'Method overriding & inheritance', 'Interfaces vs abstract classes; polymorphism via interface'],
      DSA: ['Arrange 1s & 0s (complexity + edge cases)', 'Swap without temp (incl. bitwise & floats)', 'Bubble & insertion sort', 'Arrays vs structures; null vs void pointer'],
      OS: ['Deadlock prevention techniques', 'Cache memory'],
      DBMS: ['DBMS; primary vs foreign key; schema', 'Bitmap vs B-tree index; nested query', 'Outer vs inner join'],
      CN: ['IPsec: components, transport vs tunnel mode, VPNs'],
      SD: ['SDLC; page-load-time optimization; minification trade-offs'],
      HR: ['UX/logo design & content credibility (role-specific)', 'Positive & negative test-case prioritization']
    }
  },
  {
    n: 'Infosys', yr: [2025], q: {
      DSA: ['Check anagrams; selection sort', 'Time complexity of all sorting techniques', 'Linked list vs array; stack & queue', 'Loop start in a linked list (LL Cycle II)', 'Two Sum; House Robber DP; coin exchange'],
      OS: ['Deadlocks'],
      OOP: ['Overloading vs overriding'],
      Projects: ['z-index; why these technologies?'],
      HR: ['Why Specialist Programmer at Infosys?', 'Strengths, weaknesses & overcoming them']
    }
  },
  {
    n: 'Cognizant', yr: [2025], q: {
      OOP: ['Core OOP concepts & inheritance types'],
      DSA: ['Swap without third variable', 'Prime check; reverse a string', 'Sorting methods — explain one'],
      SQL: ['SELECT/INSERT/UPDATE/DELETE queries', 'Joins & their use cases'],
      DBMS: ['ACID; normalization & types'],
      Projects: ['JS: == vs ===; data types; Hello World'],
      HR: ['5-year vision; strengths & weaknesses', 'Handling feedback & team conflicts']
    }
  },
  {
    n: 'HashedIn by Deloitte', yr: [2025], q: {
      DSA: ['Reverse a linked list; detect & remove cycle', 'Singly vs doubly; merge two sorted lists', 'Rotate array; missing number; max/min', 'Max subarray sum; count subarrays with sum', 'Longest subarray with equal 0s & 1s; generate subarrays'],
      DP: ['Overlapping subproblems; memoization vs tabulation', 'LCS; 0/1 knapsack; min cost path in grid'],
      SQL: ['Rows above a threshold; second-highest value', 'Duplicates; GROUP BY; self-join'],
      OS: ['Thrashing: causes, prevention, working set', 'Cache levels; paging & page faults'],
      DBMS: ['Three-schema architecture & data independence', 'ER diagram: entities, 1-N & M-N relationships'],
      SD: ['Design a personal chat application']
    }
  },
  {
    n: 'Havells', yr: [2025], q: {
      DBMS: ['ACID; abstraction levels; when to stop normalizing', 'Locks; deadlock & prevention', 'Triggers with sample code'],
      SQL: ['Total orders per customer ID', 'Departments with ≥2 employees via JOIN'],
      DSA: ['Queue; why linked lists over arrays; BST', 'Insertion sort code; nodes in tree of height k', 'Distinct elements; BFS & DFS; tree traversals', 'Quicksort; move negatives to one end', '"r b y r r b y" → "r r r b b y y"', 'Longest continuous substring length'],
      OS: ['Scheduling; threads vs processes'],
      SD: ['REST API; microservices; JWT signing'],
      Projects: ['CNN; sigmoid vs softmax; activation functions', 'MongoDB integration; Pascal\'s triangle in C++']
    }
  },
  {
    n: 'TransUnion', yr: [2025], q: {
      DSA: ['Rearrange sorted array max-min alternating O(1) space', 'Sort 0s,1s,2s in O(n); second greatest', 'Group anagrams; detect loop in linked list', 'Arrays vs linked lists trade-offs'],
      OS: ['Mutex vs semaphore; paging', 'fork() & processes; deadlock prevention'],
      CN: ['7 OSI layers; how email services work'],
      DBMS: ['ACID properties'],
      SQL: ['Employee queries; duplicate/similar names'],
      SD: ['System design of WhatsApp (chat, groups, read receipts)'],
      HR: ['AI capabilities & regulation strategies', 'CET or COMEDK? Why CSE?']
    }
  },
  {
    n: 'UKG', yr: [2025], q: {
      SQL: ['3rd-highest salary; all joins', 'Triggers; transactions; view from multiple tables'],
      DBMS: ['Normalization + forms; primary vs unique key', 'Why 5 tables instead of 1 in your project?'],
      DSA: ['Palindrome word; letter occurrences', 'Prime numbers in range; radix sort', 'Stack & queue definitions + implementations'],
      Aptitude: ['Angle between clock hands at 7:20'],
      HR: ['Code broke right before deployment — now what?', 'Salary expectations; leadership examples']
    }
  },
  {
    n: 'Zeta', yr: [2025], q: {
      DSA: ['Reverse linked list (iterative & recursive + complexity)', 'Palindrome linked list without extra space', 'Sliding window: max sum of size-k subarrays; variable windows'],
      DP: ['Paint fence with constraints — recurrence & optimization']
    }
  },
  {
    n: 'Target', yr: [2025], q: {
      DSA: ['Reverse number/string using two stacks', 'Binary vs linear search + complexities'],
      OS: ['Process vs thread; race condition & prevention', 'Deadlock & its necessary conditions'],
      DBMS: ['MongoDB vs MySQL; transactions in SQL'],
      SQL: ['Find email present in multiple resumes with exact name match'],
      Projects: ['JWT auth flow; frontend↔backend communication'],
      HR: ['High-pressure situation during engineering']
    }
  },
  {
    n: 'Haladoc', yr: [2025], q: {
      DSA: ['Shift zeroes to end / all zeros to left', 'Delete node & reverse a linked list; reverse only vowels', 'Subarray sum equals K; element frequency', 'Majority element (> n/2); common characters in 3 words', 'random7 → random5 with equal probability', 'Stack using queue; valid brackets', 'Swap two variables without a third; common substring', 'Rank array Gold/Silver/Bronze; sort +/- squares'],
      DBMS: ['Index & foreign key; ACID; MySQL vs MongoDB', 'ER diagram of your project schema'],
      SQL: ['Joins on a weather table'],
      OS: ['Deadlock; processes vs threads; virtual memory'],
      Projects: ['Node vs React vs Express; JS vs C++'],
      HR: ['Biggest failures; what makes you angry', 'Linux & files (managerial)']
    }
  },
  {
    n: 'Onetrust', yr: [2025], q: {
      SQL: ['Customers with order value > 550k', 'Total cost per item (order table)', 'Find & remove duplicates keeping first occurrence'],
      DBMS: ['ACID; joins & types', 'How data is stored in MongoDB (draw internals)'],
      DSA: ['Fibonacci; stack implementation', 'Rotate a 5×4 matrix 90°', 'Minimum cuts for palindrome partitioning', 'Reverse a linked list in C++', 'Swap without a third variable'],
      OOP: ['Class vs structure; object with example', 'Dangling pointer; deep vs shallow copy', '4 pillars with real-world code; abstraction advantages', 'Object-oriented vs object-based — what is Java?'],
      OS: ['What is an OS? Functions; evaluating a good OS'],
      SD: ['What is Docker?', 'Frontend→backend data flow with actual code', 'Securing file transfer between systems'],
      Aptitude: ['Sequence 0,7,26,63,124 (n³−1)']
    }
  },
  {
    n: 'Light And Wonder', yr: [2025], q: {
      DSA: ['Swap using two stacks; duplicate characters', 'Implement stoi(); reverse a linked list', 'Insertion sort: complexities, stability, recursion, linked lists, JS code'],
      OOP: ['Encapsulation for data security', 'Polymorphism; virtual functions; swap via class & object'],
      OS: ['Memory leak; smart pointers; IPC ways', 'Who calls main()? Interpreter vs compiler'],
      CN: ['Connect to office LAN from home'],
      DBMS: ['Why MongoDB if SQL can store key-value?', 'Why JSON tokens over plain strings for auth?'],
      HR: ['Which DS to store interview attendees & why?', 'Suggest improvements to this interview process']
    }
  },
  {
    n: 'London Stock Exchange', yr: [2025], q: {
      DSA: ['Valid parentheses approach', 'Right view of a binary tree', 'Dynamic vs static arrays in C++ (+pointers)', 'A dynamic-programming question of your choice'],
      OOP: ['Abstract class vs regular class', 'Abstraction real-life; function overloading real-time', 'try/catch/finally use cases'],
      DBMS: ['n students & m teachers — tables needed & design', 'MySQL vs NoSQL; when NoSQL?'],
      SD: ['Cloud computing advantages for businesses'],
      Aptitude: ['Criminal-case logic puzzle; 2–3 logic puzzles']
    }
  },
  {
    n: 'Kasmo Digital', yr: [2025], q: {
      DSA: ['Patterns: right triangle, inverted, diamond, Pascal, hollow square, Floyd', 'Prime check + primes in range', 'Palindrome; reverse string without built-ins', 'Stack & queue ops; queue using stack', 'Python: swap, even/odd, factorial, char counts'],
      SQL: ['Stored procedures: insert + row count', 'Remove all data without DELETE; TRUNCATE vs DELETE vs DROP', 'UNION vs UNION ALL; common records of two tables', 'Window functions; GROUP BY; second-highest salary', 'Names starting with A; Students table creation'],
      DBMS: ['DBMS vs RDBMS; normalization types'],
      OOP: ['4 pillars; abstract class vs interface; runtime polymorphism'],
      HR: ['Where do you see yourself in 25 years?', 'Client asks for a last-minute feature', 'Demo fails — how do you handle it?']
    }
  },
  {
    n: 'Amagi', yr: [2025], q: {
      DSA: ['Z-sum & X-sum of an n×n matrix', 'Meeting rooms: max rooms needed', 'Hex string → decimal; string → integer', 'Square root of a number; recursive range sum', 'B-Trees + operations program', 'Time complexity of given codes'],
      OS: ['fork() concept + program'],
      SD: ['Design a lift system: navigation, materials, emergency detection'],
      HR: ['Describe yourself in three words']
    }
  },
  {
    n: 'Applied Materials', yr: [2025], q: {
      OOP: ['Polymorphism & its types', 'Reference variables & initialization lists', 'Constructors/destructors; overloading vs overriding', 'Access modifiers'],
      OS: ['Thread vs process; thread scheduling + sync code', 'Semaphores & applications', 'Dining Philosophers; Readers-Writer', 'Paging & virtual memory'],
      DSA: ['Array vs vector vs linked list', 'Automorphic number check'],
      Aptitude: ['50 series bulbs, one faulty — most efficient find', 'JEE rank & family background']
    }
  },
  {
    n: 'Siemens', yr: [2025], q: {
      OOP: ['4 pillars with simple examples', 'Overloading vs overriding code', 'Virtual functions + predict output', 'Multilevel inheritance real-world program', 'Abstract classes vs virtual functions'],
      OS: ['Process vs thread; thread memory sharing'],
      DSA: ['Palindrome; FizzBuzz; star patterns', 'Second largest 3 ways; third smallest variants'],
      Java: ['try-catch vs throws; checked vs unchecked exceptions'],
      Aptitude: ['Flower doubling: half lake in 6 days → full?']
    }
  },
  {
    n: 'Cohesity', yr: [2025], q: {
      OS: ['Processes & threads in detail; paging example', 'File systems: NTFS vs FAT32; disk partitioning', 'Linux: permissions, file contents, disk usage, new user'],
      CN: ['OSI layer-by-layer + packet journey', 'DHCP & DNS; subnet mask; default gateway', 'MAC & IP of your machine; manual IP config'],
      SD: ['Azure services; create a VM; storage types'],
      DSA: ['Python reverse string using functions'],
      HR: ['Why SRE? Relevant skills']
    }
  },
  {
    n: 'WD (Western Digital)', yr: [2025], q: {
      SQL: ['Window functions; rank vs dense_rank', 'Aggregates; triggers; constraints', 'Functions vs procedures'],
      DBMS: ['Complete schema of a database; tier-1 vs tier-3 architecture', 'Primary key vs unique'],
      DSA: ['Sorting approaches; why less time complexity matters', 'Python: list/tuple/dict/set; sort vs sorted; map/filter/lambda; slice'],
      CN: ['7 OSI layers + protocols per layer', 'TCP vs UDP with usage examples'],
      OS: ['Kernel; starving processes — fix resource allocation'],
      HR: ['Senior manager asks you to delete problematic files — what do you do?', 'Send periodic log reports via mail — design it']
    }
  },
  {
    n: 'MathCo', yr: [2025], q: {
      SQL: ['Joins + WHERE; BETWEEN + HAVING'],
      DSA: ['Reverse list without reverse(); slice in Python', 'Max element; vowel frequency pseudocode', 'Bubble sort + complexity'],
      Aptitude: ['Amoeba doubles/second, full at 60s — when half?', 'Guesstimate taxis in Mysuru; college water usage'],
      SD: ['Break down MakeMyTrip into components', 'KPIs for Amazon Great Indian Sale'],
      HR: ['Leadership example; weakness + improvement steps']
    }
  },
  {
    n: 'Spense', yr: [2025, 2026], q: {
      DSA: ['Square root to 3 decimal places', 'Second largest in an array', 'Palindromic substring; reverse a sentence word-wise', 'Streaming median with 20 storage slots; median of [2,5,4,1]'],
      SQL: ['Count attendance of a student per month', 'Nested queries + joins + aggregates', 'Count cars of a model in a city'],
      SD: ['E-commerce modules (Amazon): delivery, payment-rollback, recommendations', 'System design of Uber (ER-style feature mapping)'],
      Aptitude: ['Memory management for data arriving every second', 'How many shift cars in Mysore — classification basis']
    }
  },
  {
    n: 'National Instruments', yr: [2025], q: {
      DSA: ['First & last position in sorted array', 'Search in rotated sorted array; find min in rotated', 'Median of two sorted arrays; sqrt via binary search', 'Peak element; Kth smallest in sorted matrix', 'Ship packages in D days; Aggressive Cows', 'Search a 2D matrix'],
      DP: ['LIS; 0/1 knapsack; edit distance; LCS', 'House Robber; coin change; subset sum', 'Burst balloons; partition equal subset; max product subarray']
    }
  },
  {
    n: 'Amazon', yr: [2025], q: {
      DSA: ['One hard DSA problem — approach & optimization discussed in depth', 'Linked lists, priority queue, recursion'],
      HR: ['Amazon Leadership Principles', 'Project & tech-stack deep dive']
    }
  },
  {
    n: 'Cisco', yr: [2025], q: {
      CN: ['7 layers of the OSI model', 'IPv4 vs IPv6'],
      DSA: ['Practical example of a doubly linked list'],
      OS: ['What is a thread?'],
      Projects: ['Practical use & implementation problems of your project']
    }
  },
  {
    n: 'IBM', yr: [2025], q: {
      SD: ['Handle high concurrent load without hurting UX', 'Traffic-congestion strategies at peak usage', 'Why is the MERN stack popular?', 'Traditional DBMS vs AI-driven data solutions'],
      HR: ['Complex problem under a tight deadline', 'UI vs UX & why each matters']
    }
  },
  {
    n: 'Incture', yr: [2025], q: {
      Projects: ['Design & development approach; OOP concepts used', 'Performance optimization (time, memory)', 'Design patterns used & why; error handling + logging', 'Version control; UX improvements; refactor plans'],
      DSA: ['Pattern matching in strings; substring search', 'String manipulation; DS for string ops'],
      DBMS: ['SQL vs NoSQL; MongoDB for unstructured data', 'Aggregations in SQL & MongoDB'],
      HR: ['Why system design & architecture interests you']
    }
  },
  {
    n: 'L7 Informatics', yr: [2025], q: {
      DSA: ['Python: lists vs tuples vs dictionaries', 'deepcopy vs shallow copy; *args & **kwargs', 'Decorators; __init__; memory management', 'Exception handling; optimizing Python programs'],
      Projects: ['Objective, role, challenges, critical parts, improvements']
    }
  },
  {
    n: 'Unilog', yr: [2025], q: {
      DSA: ['Predict output (pass-by-object semantics)', 'Tuple vs list; create your own immutable type', 'Library vs module'],
      HR: ['Thoughts on 70/90-hour work weeks', 'Recent self-help book & its significance']
    }
  },
  {
    n: 'Tejas Networks', yr: [2025], q: {
      DSA: ['Rotate a matrix 90° without transpose', 'Rotate an array 90°'],
      OOP: ['Virtual functions & abstract classes; friend functions', 'Why namespace std; memory management in C++', 'Dangling pointer; memory leak'],
      OS: ['Paging & segmentation'],
      HR: ['Java dev → C++ dev shift — okay?']
    }
  },
  {
    n: 'Openmynz', yr: [2025], q: {
      DSA: ['Rotate a linked list; loop detection (map & 2-pointer)', 'Reverse an array using pointers; bubble sort', 'Is the string a rotation?', 'IP address → hexadecimal'],
      OOP: ['4 pillars; inheritance & polymorphism in C++; pointers']
    }
  },
  {
    n: 'Oit Dahramyan', yr: [2025], q: {
      DSA: ['Valid parentheses (favorite-DS deep dive)', '2D arrays; subarray with min sum', 'Min element in a stack in O(1) (interface class)', 'Square of array elements < O(n)', 'Knapsack & travelling salesman'],
      DBMS: ['Primary vs unique key; index in RDBMS; all joins'],
      OOP: ['Pillars with a real-life example'],
      Projects: ['React vs Angular']
    }
  },
  {
    n: 'Anora', yr: [2025], q: {
      DSA: ['Binary search; circular linked list', 'Time complexity of linked-list ops & node deletion', 'Sorting methods; function pointers'],
      OOP: ['Runtime polymorphism']
    }
  },
  {
    n: 'Gale Partners', yr: [2025], q: {
      DSA: ['Check whether two strings are equal'],
      Projects: ['Paging in React; problems faced in your project']
    }
  },
  {
    n: 'Moss Adams', yr: [2025], q: {
      CN: ['Basics of computer networks & cybersecurity', 'SOC basics; SOC1 vs SOC2; audits'],
      HR: ['One reason we should NOT hire you', 'Managerial puzzles & logical reasoning']
    }
  },
  {
    n: 'TE Connectivity', yr: [2025], q: {
      SQL: ['Wildcards; inner vs outer join', 'Joins vs UNION; subqueries vs joins; views'],
      DBMS: ['ACID; normalization; DBMS structure'],
      DSA: ['Linear vs non-linear structures; trees vs graphs', 'Python: loops, lists, tuples, class, self, inheritance'],
      SD: ['REST API; Docker architecture; GitHub commands', 'Design a website to ease your company\'s interview process'],
      Java: ['C++ vs Java in OOP terms; why Java isn\'t pure OOP', 'Encapsulation with code; JWT'],
      HR: ['Years of commitment to TE; why data analyst?']
    }
  },
  {
    n: 'Alstom', yr: [2025, 2026], q: {
      DSA: ['Insert elements into a sorted linked list', 'Coding question in your preferred language'],
      Projects: ['Project + ER diagram of its database', 'Working-flow diagram; API basics; C/C++/Python basics', 'Sensors → computer data conversion; Raspberry Pi components'],
      HR: ['Relocation & preferred location; masters plans']
    }
  },
  {
    n: 'Azentio', yr: [2026], q: {
      DSA: ['Long tricky array problems; string problems', 'Detect a cycle in a linked list', 'Median of two arrays (binary search + hashing)', 'Graph-based DSA problem'],
      Projects: ['Why MongoDB? React concepts & implementation']
    }
  },
  {
    n: 'Afford Medical', yr: [2026], q: {
      DSA: ['Underlying algorithm of set; Map operation complexity'],
      DBMS: ['ACID; sharding; indexing', 'Sort & find users efficiently in a huge DB', 'SQL vs MySQL; can foreign/primary keys be null?'],
      SD: ['process.env in depth; cloud caching; securing API keys'],
      Projects: ['Registration flow & DB of your assignment']
    }
  },
  {
    n: 'Lumos', yr: [2025], q: {
      HR: ['Business development strategies with examples', 'CRM: tool or methodology?', 'US ed-org growth problem; retain a leaving student', 'Why testing role? Why should I hire you?']
    }
  },
  {
    n: 'Ingersoll Rand', yr: [2025], q: {
      HR: ['Masters / higher-studies plans', 'Willing to relocate? Family obligations & work-life balance', 'Long-term career plans']
    }
  }
];

/* ---------- 🗓️ 30-DAY SPRINT ROADMAP DATA ---------- */
const SPRINT_ROADMAP = [
  { day: 1, title: "Java & OOP Core Foundations", category: "OOP", topics: ["Four Pillars of OOP", "Abstract Class vs Interface", "Method Overloading vs Overriding"], xp: 15 },
  { day: 2, title: "SQL Joins & Data Filtering Mastery", category: "SQL", topics: ["INNER, LEFT, RIGHT & FULL Joins", "WHERE vs HAVING", "GROUP BY & Aggregates"], xp: 15 },
  { day: 3, title: "DBMS Keys & Normalization", category: "DBMS", topics: ["Primary, Foreign & Unique Keys", "1NF → BCNF Normalization", "ACID Properties"], xp: 15 },
  { day: 4, title: "Operating Systems Process & Threads", category: "OS", topics: ["Process vs Thread", "CPU Scheduling (FCFS, SJF, RR)", "Deadlock 4 Conditions"], xp: 15 },
  { day: 5, title: "Computer Networks OSI & TCP/IP Layering", category: "CN", topics: ["OSI 7 Layers vs TCP/IP", "TCP vs UDP", "HTTP vs HTTPS & SSL/TLS"], xp: 15 },
  { day: 6, title: "Arrays & Two Pointer Technique", category: "DSA", topics: ["Two Sum", "Kadane's Algorithm", "Sort Colors (0,1,2)"], xp: 15 },
  { day: 7, title: "Sliding Window & Subarrays", category: "DSA", topics: ["Best Time to Buy & Sell Stock", "Longest Substring Without Repeating", "Max Subarray Sum K"], xp: 15 },
  { day: 8, title: "Fast & Slow Pointers (Linked Lists)", category: "DSA", topics: ["Reverse Linked List", "Detect Cycle in Linked List", "Middle of Linked List"], xp: 15 },
  { day: 9, title: "Binary Search & Search Space", category: "DSA", topics: ["Binary Search", "Search in Rotated Sorted Array", "Find Peak Element"], xp: 15 },
  { day: 10, title: "Recursion & Backtracking Sprint", category: "DSA", topics: ["Subsets & Subset II", "Permutations", "N-Queens / Word Search"], xp: 15 },
  { day: 11, title: "Stack & Queue Data Structures", category: "DSA", topics: ["Valid Parentheses", "Min Stack", "Next Greater Element"], xp: 15 },
  { day: 12, title: "Trees & Traversals (DFS / BFS)", category: "DSA", topics: ["Inorder, Preorder, Postorder", "Maximum Depth of Binary Tree", "Lowest Common Ancestor"], xp: 15 },
  { day: 13, title: "Binary Search Trees (BST)", category: "DSA", topics: ["Validate BST", "Kth Smallest Element in BST", "Construct BST from Preorder"], xp: 15 },
  { day: 14, title: "Heap & Priority Queues", category: "DSA", topics: ["Kth Largest Element", "Top K Frequent Elements", "Merge K Sorted Lists"], xp: 15 },
  { day: 15, title: "Graphs - BFS & DFS Traversals", category: "DSA", topics: ["Number of Islands", "Clone Graph", "Course Schedule (Topological Sort)"], xp: 15 },
  { day: 16, title: "Graphs - Shortest Path & MST", category: "DSA", topics: ["Dijkstra's Algorithm", "Bellman-Ford Algorithm", "Kruskal's & Prim's MST"], xp: 15 },
  { day: 17, title: "Dynamic Programming - 1D DP", category: "DSA", topics: ["Climbing Stairs", "Coin Change", "House Robber"], xp: 15 },
  { day: 18, title: "Dynamic Programming - 2D & Grid DP", category: "DSA", topics: ["Unique Paths", "Longest Common Subsequence (LCS)", "0/1 Knapsack Problem"], xp: 15 },
  { day: 19, title: "System Design - High Level Basics", category: "SD", topics: ["Client-Server & Load Balancers", "Caching (Redis)", "Database Scaling & Sharding"], xp: 15 },
  { day: 20, title: "SQL Advanced Window Functions", category: "SQL", topics: ["RANK vs DENSE_RANK vs ROW_NUMBER", "Second Highest Salary Query", "Finding Duplicate Records"], xp: 20 },
  { day: 21, title: "DBMS Indexing & Transaction Isolation", category: "DBMS", topics: ["B-Tree & Hash Indexing", "Concurrency Control & Locks", "SQL vs NoSQL (MySQL vs MongoDB)"], xp: 20 },
  { day: 22, title: "Operating Systems Memory & Paging", category: "OS", topics: ["Virtual Memory & Paging", "Page Replacement (LRU, FIFO)", "Segmentation vs Paging"], xp: 20 },
  { day: 23, title: "Computer Networks Protocols & DNS", category: "CN", topics: ["DNS Resolution Lookup", "DHCP, ARP & ICMP", "WebSockets vs Long Polling"], xp: 20 },
  { day: 24, title: "Bit Manipulation & Math Tricks", category: "DSA", topics: ["Single Number", "Counting Bits", "Power of Two"], xp: 20 },
  { day: 25, title: "Trie & Advanced Data Structures", category: "DSA", topics: ["Implement Trie (Prefix Tree)", "Design Add and Search Words"], xp: 20 },
  { day: 26, title: "Tops 15 Company Question Drill", category: "Company", topics: ["Amazon Most Frequent Problems", "Fidelity & Akamai Question Review"], xp: 20 },
  { day: 27, title: "HR Behavioral STAR Method Drills", category: "HR", topics: ["Tell Me About Yourself", "Conflict Resolution", "Biggest Failure & Learnings"], xp: 20 },
  { day: 28, title: "Full 45-Min Mock Interview Round 1", category: "Mock", topics: ["Timed 45-Min Test - 2 DSA + 2 Theory + 1 SQL"], xp: 25 },
  { day: 29, title: "Full 45-Min Mock Interview Round 2", category: "Mock", topics: ["Timed 45-Min Test - Advanced System & DSA"], xp: 25 },
  { day: 30, title: "Final Placement Readiness Audit", category: "Final", topics: ["100% Readiness Audit", "Resume Review & Final Review"], xp: 30 }
];

/* ---------- 🎙️ TOP 15 HR BEHAVIORAL QUESTIONS ---------- */
const HR_QUESTIONS = [
  { id: 'hr1', q: 'Tell me about yourself and why you are interested in this role.', tips: 'Structure: Background (15s) → Technical Skills & Projects (45s) → Why this company (30s).' },
  { id: 'hr2', q: 'What is your biggest technical strength and your biggest weakness?', tips: 'Strength: Concrete technical skill with project proof. Weakness: Real area you are actively improving.' },
  { id: 'hr3', q: 'Describe a time you faced a tough technical challenge in a project and how you solved it.', tips: 'Use STAR Method: Situation → Task → Action → Result.' },
  { id: 'hr4', q: 'Where do you see yourself in 3 to 5 years?', tips: 'Focus on growth as a Software Engineer, mastering core architecture, and contributing value.' },
  { id: 'hr5', q: 'Describe a situation where you had a conflict with a team member. How did you resolve it?', tips: 'Emphasize active listening, data-driven decisions, and professional collaboration.' },
  { id: 'hr6', q: 'Why do you want to join our company specifically?', tips: 'Mention specific tech stack, products, or recent company engineering blogs.' },
  { id: 'hr7', q: 'Tell me about a time you failed or made a mistake in a project.', tips: 'Focus 80% of your answer on what you learned and how you prevented it from happening again.' },
  { id: 'hr8', q: 'How do you prioritize tasks when working under strict deadlines?', tips: 'Talk about Eisenhower matrix, breaking tasks down, and clear communication with stakeholders.' },
  { id: 'hr9', q: 'What is your experience working in an Agile/Scrum team environment?', tips: 'Discuss daily standups, sprint planning, pull requests, and peer code reviews.' },
  { id: 'hr10', q: 'Are you comfortable relocating or working night/flexible shifts?', tips: 'Be clear, honest, and express willingness to adapt for career growth.' },
  { id: 'hr11', q: 'What is a project you are most proud of, and what was your individual contribution?', tips: 'Highlight your specific module, architectural decisions, and key metrics achieved.' },
  { id: 'hr12', q: 'How do you keep yourself updated with new technologies and frameworks?', tips: 'Mention engineering blogs (Uber, Netflix, TechCrunch), GitHub open source, and building side projects.' },
  { id: 'hr13', q: 'What would you do if your team lead gives you a task you have never worked on before?', tips: 'Outline your learning approach: official docs, isolated prototype, asking targeted questions.' },
  { id: 'hr14', q: 'What are your salary expectations or career growth expectations?', tips: 'Mention industry standards for entry-level SDE roles and focus on growth opportunities.' },
  { id: 'hr15', q: 'Do you have any questions for us?', tips: 'Always ask 2 smart questions: e.g., "What does a typical day look like for a new SDE?" or "What tech stack is the team moving towards?"' }
];

/* ---------- 💼 REAL LIVE JOBS & MASS HIRING DRIVES (POSTED < 7 DAYS) ---------- */
const LIVE_JOBS = [
  {
    id: 'job1',
    company: 'Tata Consultancy Services (TCS)',
    logo: '🏢',
    role: 'Associate Software Engineer / Digital / Prime (NQT 2025 & 2026)',
    batch: '2025 & 2026 Batch',
    ctc: '₹3.36 LPA - ₹9.0 LPA',
    postedDaysAgo: 1,
    type: 'Mass Hiring Drive',
    location: 'PAN India (Bengaluru, Hyderabad, Pune, Chennai, Delhi NCR)',
    skills: ['Java', 'Python', 'SQL', 'Aptitude', 'Data Structures'],
    desc: 'TCS National Qualifier Test (NQT) mass hiring drive for Ninja, Digital, and Prime cadres. Eligible for B.E/B.Tech/M.E/M.Tech/MCA/M.Sc. Requires strong fundamental coding and problem-solving skills.',
    url: 'https://nextstep.tcs.com/'
  },
  {
    id: 'job2',
    company: 'Cognizant',
    logo: '💼',
    role: 'GenC & GenC Elevate Developer (Mass Hiring 24,000+ Freshers)',
    batch: '2025 & 2026 Batch',
    ctc: '₹4.0 LPA - ₹6.75 LPA',
    postedDaysAgo: 2,
    type: 'Mass Hiring Drive',
    location: 'Bengaluru, Hyderabad, Pune, Kolkata, Coimbatore',
    skills: ['Java', 'Python', 'OOP', 'SQL', 'GenAI Basics'],
    desc: 'Cognizant is scaling up entry-level hiring targeting 24,000+ freshers for GenC, GenC Elevate, and GenAI specialization tracks.',
    url: 'https://careers.cognizant.com/'
  },
  {
    id: 'job3',
    company: 'Accenture',
    logo: '⚡',
    role: 'Associate Software Engineer (ASE) & Application Developer',
    batch: '2025 & 2026 Batch',
    ctc: '₹4.5 LPA - ₹6.5 LPA',
    postedDaysAgo: 3,
    type: 'Off-Campus Drive',
    location: 'Bengaluru, Hyderabad, Pune, Gurugram',
    skills: ['C++', 'Java', 'Python', 'Cloud Basics', 'Web Fundamentals'],
    desc: 'Accenture nationwide off-campus hiring for Associate Software Engineer role. Candidates are evaluated on cognitive ability, technical assessment, and coding challenges.',
    url: 'https://www.accenture.com/in-en/careers'
  },
  {
    id: 'job4',
    company: 'Infosys',
    logo: '🔷',
    role: 'System Engineer & Digital Specialist Engineer (DSE)',
    batch: '2025 & 2026 Batch',
    ctc: '₹3.6 LPA - ₹9.5 LPA',
    postedDaysAgo: 1,
    type: 'Mass Hiring Drive',
    location: 'Bengaluru, Mysuru, Pune, Hyderabad',
    skills: ['DSA', 'Java', 'Python', 'DBMS', 'OS Fundamentals'],
    desc: 'Infosys off-campus hiring drive for Systems Engineer and DSE tracks. Online test includes reasoning, mathematical ability, pseudo-code, and hands-on coding.',
    url: 'https://www.infosys.com/careers/'
  },
  {
    id: 'job5',
    company: 'Amazon',
    logo: '🚀',
    role: 'Software Development Engineer 1 (SDE-1) - University Talent',
    batch: '2025 & 2026 Batch',
    ctc: '₹18.0 LPA - ₹28.0 LPA',
    postedDaysAgo: 1,
    type: 'Off-Campus SDE Drive',
    location: 'Bengaluru, Hyderabad, Chennai',
    skills: ['DSA', 'Data Structures & Algorithms', 'System Design', 'Problem Solving'],
    desc: 'Amazon University Talent Acquisition drive for SDE-1 entry level engineers. Focuses on advanced data structures, algorithms, and Leadership Principles.',
    url: 'https://www.amazon.jobs/'
  },
  {
    id: 'job6',
    company: 'Philips',
    logo: '💡',
    role: 'Apprentice Software Trainee Engineer',
    batch: '2025 & 2026 Batch',
    ctc: '₹6.0 LPA - ₹8.5 LPA',
    postedDaysAgo: 4,
    type: 'Fresher Trainee Program',
    location: 'Bengaluru Innovation Campus',
    skills: ['C#', 'Java', 'React', 'SQL', 'Git'],
    desc: 'Philips Innovation Campus apprentice software developer program for fresh graduates. Focuses on healthcare technology stack, cloud software, and modern web frameworks.',
    url: 'https://www.careers.philips.com/'
  },
  {
    id: 'job7',
    company: 'Applied Materials',
    logo: '🔬',
    role: 'Software QA & Test Engineer (New College Graduate)',
    batch: '2025 & 2026 Batch',
    ctc: '₹8.0 LPA - ₹11.0 LPA',
    postedDaysAgo: 5,
    type: 'New Graduate Hiring',
    location: 'Bengaluru',
    skills: ['Python', 'Automation Testing', 'SQL', 'Linux Commands'],
    desc: 'Applied Materials software QA engineering program for fresh graduates. Includes automation testing, Python scripting, and semiconductor software validation.',
    url: 'https://www.appliedmaterials.com/us/en/careers.html'
  },
  {
    id: 'job8',
    company: 'Unthinkable Solutions',
    logo: '🧠',
    role: 'Software Engineer Trainee',
    batch: '2026 & 2027 Batch',
    ctc: '₹5.0 LPA - ₹7.0 LPA',
    postedDaysAgo: 2,
    type: 'Direct Hiring Drive',
    location: 'Gurugram / Remote',
    skills: ['DSA', 'JavaScript', 'C++', 'Java', 'Problem Solving'],
    desc: 'Direct hiring challenge for fresher software engineers. Evaluates core algorithmic capability, clean code writing, and analytical problem solving.',
    url: 'https://www.unthinkable.co/careers/'
  }
];

/* ---------- 🎯 10 MAJOR COMPANY-WISE PREPARATION ROADMAPS DATA ---------- */
const COMPANY_ROADMAPS = [
  {
    id: 'amazon',
    name: 'Amazon',
    logo: '🚀',
    tier: 'Tier 1 SDE',
    ctc: '₹18.0 - ₹28.0 LPA',
    rounds: [
      'Round 1: Online Assessment (Debugging + Reasoning + 2 Coding - 90 mins)',
      'Round 2: Technical Interview 1 (DSA Trees, Graphs, Dynamic Programming)',
      'Round 3: Technical Interview 2 (System Design & Object-Oriented Design)',
      'Round 4: Bar Raiser Interview (Behavioral & Amazon Leadership Principles)'
    ],
    dsaSyllabus: ['Trees (Binary Tree, BST, LCA)', 'Graphs (BFS, DFS, Dijkstra)', 'Dynamic Programming (Knapsack, LCS)', 'Sliding Window & Two Pointers'],
    csSyllabus: ['Object-Oriented Design (OOD)', 'Database Normalization & Indexing', 'Concurrency & Thread Safety', 'High-Level Architecture Basics'],
    tips: 'Master Amazon 14 Leadership Principles (Customer Obsession, Ownership, Bias for Action). Every technical round evaluates LP stories!'
  },
  {
    id: 'tcs',
    name: 'Tata Consultancy Services (TCS)',
    logo: '🏢',
    tier: 'Ninja / Digital / Prime',
    ctc: '₹3.36 - ₹9.0 LPA',
    rounds: [
      'Round 1: TCS NQT Online Test (Foundation + Advanced Aptitude, Verbal, Coding)',
      'Round 2: Technical Interview (Core Java / Python, SQL, DBMS Keys)',
      'Round 3: HR & Managerial Interview (Communication & Willingness to relocate)'
    ],
    dsaSyllabus: ['Arrays & Matrix Operations', 'String Manipulation & Pattern Matching', 'Basic Searching & Sorting Algorithms'],
    csSyllabus: ['SQL Joins, WHERE vs HAVING', 'DBMS Keys & 1NF-3NF Normalization', 'Java OOP Pillars & Collections', 'OS Process vs Thread'],
    tips: 'NQT Advanced section determines whether you get Ninja (3.36L), Digital (7L), or Prime (9L) offer. Focus on clean coding syntax!'
  },
  {
    id: 'cognizant',
    name: 'Cognizant',
    logo: '💼',
    tier: 'GenC / GenC Elevate',
    ctc: '₹4.0 - ₹6.75 LPA',
    rounds: [
      'Round 1: Skill Assessment (Aptitude + Debugging + SQL/Coding)',
      'Round 2: Technical Interview (Java, SQL Joins, DBMS Keys)',
      'Round 3: HR Interview (Background & Flexibility)'
    ],
    dsaSyllabus: ['String Manipulation', 'Arrays & HashMaps', 'Basic Linked Lists'],
    csSyllabus: ['Four Pillars of OOP', 'SQL Joins & Group By', 'DBMS ACID Properties', 'HTTP & Web Basics'],
    tips: 'GenC Elevate track offers higher CTC (6.75 LPA). Demonstrate strong hands-on SQL and Java OOP concept clarity.'
  },
  {
    id: 'infosys',
    name: 'Infosys',
    logo: '🔷',
    tier: 'System Engineer / DSE',
    ctc: '₹3.6 - ₹9.5 LPA',
    rounds: [
      'Round 1: Infosys Online Test (Reasoning, Pseudo-code, DBMS, 3 Coding Problems)',
      'Round 2: Technical & HR Discussion (Project Review + Core CS Concepts)'
    ],
    dsaSyllabus: ['Greedy Algorithms', 'Dynamic Programming Basics', 'Array Prefix Sums', 'Recursion & Backtracking'],
    csSyllabus: ['Pseudo-code Tracing', 'DBMS Transactions & Locks', 'Python / Java Syntax', 'Software Engineering Lifecycles'],
    tips: 'Practice pseudo-code evaluation and logical reasoning for Round 1 clearance. Specialist Programmer (SP) role tests DP and Graphs.'
  },
  {
    id: 'accenture',
    name: 'Accenture',
    logo: '⚡',
    tier: 'ASE / FSE',
    ctc: '₹4.5 - ₹6.5 LPA',
    rounds: [
      'Round 1: Cognitive & Technical Assessment (90 mins)',
      'Round 2: Coding Assessment (45 mins - 2 Problems)',
      'Round 3: Communication Assessment (Automated Voice & Pronunciation)',
      'Round 4: Technical & HR Interview'
    ],
    dsaSyllabus: ['Array Operations & Subarrays', 'String Reversal & Anagrams', 'Basic Mathematical Logic'],
    csSyllabus: ['MS Office & Networking Basics', 'Cloud & Security Fundamentals', 'OOP Method Overloading vs Overriding', 'SQL SELECT Commands'],
    tips: 'Round 1 eliminate maximum candidates. Practice fast mental math, logical reasoning, and basic network protocols.'
  },
  {
    id: 'fidelity',
    name: 'Fidelity Investments',
    logo: '🏦',
    tier: 'Financial Tech Lead',
    ctc: '₹8.0 - ₹12.0 LPA',
    rounds: [
      'Round 1: Online Coding Test (DSA + SQL + Computer Science MCQs)',
      'Round 2: Technical Interview 1 (Java Multithreading, SQL Window Functions, DSA)',
      'Round 3: Technical Interview 2 (System Design & Database Architecture)',
      'Round 4: HR Discussion'
    ],
    dsaSyllabus: ['Stack & Queue Applications', 'Binary Search Variants', 'Graph Traversals (BFS/DFS)', 'HashMap Internal Working'],
    csSyllabus: ['Java Collections & Multithreading', 'SQL RANK(), DENSE_RANK(), Subqueries', 'DBMS Indexing (B-Tree)', 'Spring Boot & Microservices Basics'],
    tips: 'Fidelity asks heavily about Java internals (String Pool, HashMap collision) and real-life financial transaction SQL queries.'
  },
  {
    id: 'akamai',
    name: 'Akamai Technologies',
    logo: '🌐',
    tier: 'Cloud SDE',
    ctc: '₹10.0 - ₹15.0 LPA',
    rounds: [
      'Round 1: Online Assessment (DSA + OS & CN MCQs)',
      'Round 2: Technical Interview 1 (OS Paging, Deadlock, C++/Java, DSA)',
      'Round 3: Technical Interview 2 (Computer Networks, Linux Internals, System Design)',
      'Round 4: HR Discussion'
    ],
    dsaSyllabus: ['Linked List Cycles', 'Trie / Prefix Trees', 'Bit Manipulation', 'Tree Depth & LCA'],
    csSyllabus: ['OS Memory Paging & Deadlocks', 'CN TCP vs UDP & 3-Way Handshake', 'Linux Shell Commands & IPC', 'Multithreading & Locks'],
    tips: 'Deep dive into Computer Networks (DNS, CDN architecture) and OS memory management. Akamai is a global CDN leader!'
  },
  {
    id: 'oracle',
    name: 'Oracle',
    logo: '🟥',
    tier: 'Database & Cloud SDE',
    ctc: '₹12.0 - ₹18.0 LPA',
    rounds: [
      'Round 1: Online Coding & CS Core MCQs (DBMS, OS, Data Structures)',
      'Round 2: Technical Interview 1 (DBMS Indexing, SQL Complex Queries, Trees)',
      'Round 3: Technical Interview 2 (Data Structures, System Architecture)',
      'Round 4: HR Discussion'
    ],
    dsaSyllabus: ['Trees & BST Validation', 'Heap / Priority Queues', 'Graph Shortest Path (Dijkstra)', 'Dynamic Programming'],
    csSyllabus: ['DBMS B-Tree Indexing & Sharding', 'SQL Subqueries & Window Functions', 'Stored Procedures & Triggers', 'Operating Systems Virtual Memory'],
    tips: 'Expect heavy grilling on DBMS internals, indexing mechanisms, and writing complex SQL queries with multiple JOINs.'
  },
  {
    id: 'miq',
    name: 'MiQ Digital',
    logo: '📊',
    tier: 'Data & Software Tech',
    ctc: '₹8.0 - ₹12.0 LPA',
    rounds: [
      'Round 1: Online Coding Test (Data Structures & SQL)',
      'Round 2: Technical Interview 1 (Java Collections, SQL Joins, OOP Pillars)',
      'Round 3: Technical Interview 2 (System Architecture & Project Deep Dive)',
      'Round 4: Director HR Discussion'
    ],
    dsaSyllabus: ['HashMap & HashSet', 'Two Pointer Technique', 'String Parsing & Manipulations', 'Sorting & Searching'],
    csSyllabus: ['Java JVM, JRE, JDK & Equals/HashCode', 'SQL Second Highest Salary Queries', 'OOP Diamond Problem & Abstract Classes', 'REST API Design'],
    tips: 'Be prepared to explain your resume projects in detail, including ER diagrams, database design, and choice of frameworks.'
  },
  {
    id: 'lowes',
    name: 'Lowe\'s India',
    logo: '🛒',
    tier: 'Retail Tech SDE',
    ctc: '₹8.5 - ₹13.0 LPA',
    rounds: [
      'Round 1: Online Technical Assessment (DSA + Database Questions)',
      'Round 2: Technical Interview 1 (DSA Arrays/Strings, Spring Boot/Node/Java)',
      'Round 3: Technical Interview 2 (System Design & High Availability)',
      'Round 4: HR Discussion'
    ],
    dsaSyllabus: ['Sliding Window Problems', 'Stack Next Greater Element', 'Binary Search Space', 'Topological Sort'],
    csSyllabus: ['SQL Joins & Grouping', 'Microservices Architecture', 'Database Caching (Redis)', 'OOP Encapsulation & Inheritance'],
    tips: 'Focus on high-availability web architectures, e-commerce workflow design, and clean modular code writing.'
  }
];


