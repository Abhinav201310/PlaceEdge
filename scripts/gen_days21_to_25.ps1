# Generator for Days 21 to 25 (125 Unique Questions)

# ==================== DAY 21: DBMS Indexing & Transaction Isolation ====================
Add-Q 21 1 "Medium" "Why does a database Clustered Index determine the physical order of data on disk?" `
    "Because disk platters are circular" `
    "Because leaf nodes of a clustered index contain the actual data rows of the table; hence only ONE clustered index can exist per table" `
    "Because clustered indexes are stored in RAM only" `
    "It is a virtual sorting rule" 1 `
    "A clustered index physically sorts table rows on disk to match the index key order. Because physical data can only be stored in one sequence, a table can have only one clustered index."

Add-Q 21 2 "Hard" "In B+ Tree index structures, why are all leaf nodes linked together in a doubly linked list?" `
    "To save disk storage" `
    "To provide ultra-fast sequential range scans (e.g. BETWEEN 10 AND 50) without having to traverse back up through parent index nodes" `
    "To prevent hash collisions" `
    "To enable multithreaded writes" 1 `
    "In a B+ Tree, leaf nodes hold all actual data pointers and are chained together horizontally. Range queries simply locate the first leaf and follow sequential pointers without re-traversing tree branches."

Add-Q 21 3 "Medium" "What is the 'Leftmost Prefix Rule' in composite (multi-column) indexing on (A, B, C)?" `
    "The index is stored in the leftmost disk sector" `
    "The query can utilize the index only if it filters on leading columns starting from the leftmost column (A, or A and B, or A and B and C); filtering on B and C alone cannot use the index" `
    "All columns must have identical data types" `
    "The query must select only the leftmost column" 1 `
    "A composite index orders entries hierarchically: first by A, then by B, then by C. Without filtering on the leading column A, the tree ordering cannot be traversed."

Add-Q 21 4 "Hard" "What is a 'Covering Index' and why does it drastically improve query performance?" `
    "An index that covers the entire hard drive" `
    "An index that contains all columns requested by the SELECT, WHERE, and JOIN clauses, eliminating the need to perform a table/bookmark lookup into the primary heap" `
    "An index that automatically compresses data" `
    "An index created across all tables in a schema" 1 `
    "If an index covers all columns requested by the query, the database engine satisfies the query entirely from index leaf pages (Index-Only Scan), avoiding costly random I/O table lookups."

Add-Q 21 5 "Medium" "What is the primary difference between Hash Indexing and B-Tree Indexing?" `
    "Hash indexes support range scans (< and >); B-trees do not" `
    "Hash indexes provide O(1) exact equality lookups (=) but cannot support range queries or sorting; B-Trees support both equality and range scans in O(log N)" `
    "B-trees can only store numbers" `
    "Hash indexes are slower than full table scans" 1 `
    "Hash indexes map keys to buckets via hash functions (ideal for key-value equality). B-Trees maintain sorted order, supporting range scans, prefix matches, and ORDER BY operations."

Add-Q 21 6 "Hard" "What is Multi-Version Concurrency Control (MVCC) in modern databases (PostgreSQL, InnoDB)?" `
    "A technique that creates a separate database for each user" `
    "A mechanism where readers do not block writers and writers do not block readers; modifications create new row versions (snapshots) while active readers see older consistent snapshots" `
    "A lock that locks the entire disk" `
    "A tool for managing Git branches inside SQL" 1 `
    "MVCC maintains multiple timestamped versions of data rows. Writers create new versions without locking out readers, and readers access consistent snapshot views, eliminating read-write contention."

Add-Q 21 7 "Medium" "In ANSI SQL transaction isolation levels, which isolation level is vulnerable to 'Non-Repeatable Reads'?" `
    "Serializable" `
    "Repeatable Read" `
    "Read Committed" `
    "Snapshot Isolation" 2 `
    "Under Read Committed, re-reading the same row within a transaction can yield different values if another transaction committed updates to that row in the interim."

Add-Q 21 8 "Hard" "What is the 'Write Skew' anomaly that can occur under Snapshot Isolation (Repeatable Read)?" `
    "Disks spinning at different speeds" `
    "Two concurrent transactions read overlapping datasets, satisfy a business constraint locally, and make disjoint writes that together violate the global constraint upon commit" `
    "A write failing due to disk full" `
    "A deadlock between two INSERT statements" 1 `
    "Classic example: On-call doctor rota requires at least 1 doctor active. Two doctors simultaneously check on-call count (sees 2) and both take leave. Both transactions commit because writes touched different rows, leaving 0 doctors active."

Add-Q 21 9 "Medium" "What is the difference between Shared (S) Locks and Exclusive (X) Locks?" `
    "Shared locks are for writes; Exclusive locks are for reads" `
    "Multiple transactions can hold Shared locks concurrently (read lock); only one transaction can hold an Exclusive lock (write lock), which conflicts with all other locks" `
    "Exclusive locks cannot be released" `
    "Shared locks require admin privileges" 1 `
    "Shared locks allow concurrent reading. Exclusive locks are required for mutations (INSERT/UPDATE/DELETE) and strictly prohibit any other transaction from acquiring shared or exclusive locks on that resource."

Add-Q 21 10 "Hard" "How does a database engine detect deadlocks among concurrent transactions?" `
    "By checking CPU temperatures" `
    "By maintaining a Wait-For Graph (where directed edges represent transactions waiting for locks held by others) and periodically running cycle detection algorithms" `
    "By terminating all transactions every 5 seconds" `
    "By disabling indexes" 1 `
    "The lock manager constructs a directed Wait-For Graph. If a directed cycle is detected (T1 waits for T2 who waits for T1), a deadlock exists; the engine selects and aborts a victim transaction."

Add-Q 21 11 "Medium" "What is the trade-off of adding indexes to a heavily updated database table?" `
    "Indexes increase CPU temperature" `
    "Indexes speed up SELECT queries but slow down INSERT, UPDATE, and DELETE operations because all corresponding index trees must also be updated" `
    "Indexes reduce disk space" `
    "Indexes disable transactions" 1 `
    "Every modification to an indexed column requires updating the underlying B+ tree index pages, adding write I/O overhead and lock contention."

Add-Q 21 12 "Hard" "What is an Intent Lock (e.g. Intent Shared IS, Intent Exclusive IX) in hierarchical multi-granularity locking?" `
    "A lock that predicts future queries" `
    "A lock placed on higher-level containers (table or page) indicating that a transaction intends to lock individual rows lower down, preventing table-level lock conflicts efficiently" `
    "A lock used only during database backup" `
    "A lock that cannot be revoked" 1 `
    "Without intent locks, locking a whole table would require checking every single row to see if any row is locked. An Intent Lock on the table flag-signals row-level activity, allowing O(1) table lock checks."

Add-Q 21 13 "Medium" "When should a Bitmap Index be used instead of a B-Tree Index?" `
    "On unique primary keys like UUIDs" `
    "On low-cardinality columns (e.g. Gender, Marital Status, Boolean flags) in read-heavy analytical data warehouses (OLAP)" `
    "On text columns storing user essays" `
    "Bitmap indexes should never be used" 1 `
    "Bitmap indexes represent low-cardinality values with compact bit vectors. Bitwise operations (AND, OR) evaluate multi-condition queries at blistering speeds in OLAP environments."

Add-Q 21 14 "Hard" "In Optimistic Concurrency Control (OCC), how are conflicts detected without holding long-lived pessimistic locks?" `
    "Transactions lock the entire table" `
    "Transactions record a version number or timestamp upon reading, and check during validation/commit phase if the version changed; if changed, the transaction aborts and retries" `
    "Queries run sequentially on a single thread" `
    "Disks are checked for checksum errors" 1 `
    "OCC avoids locking during reads and processing. At commit time, it checks 'WHERE id = ? AND version = read_version'. If zero rows update, concurrent modification occurred, triggering a safe retry."

Add-Q 21 15 "Medium" "What is an index Cardinality in relational database administration?" `
    "The physical file size of the index" `
    "The number of unique values in an indexed column" `
    "The depth of the B+ tree" `
    "The date the index was created" 1 `
    "High cardinality means many distinct values (e.g. user_id, email - ideal for B-tree index). Low cardinality means few distinct values (e.g. status flag - poor for B-tree index)."

Add-Q 21 16 "Hard" "What is the difference between Rigorous 2PL and Strict 2PL in transaction management?" `
    "Rigorous 2PL requires all locks (both Shared and Exclusive) to be held until transaction commit/abort; Strict 2PL only requires Exclusive locks to be held until commit" `
    "Strict 2PL prevents deadlocks; Rigorous does not" `
    "Rigorous 2PL is only for NoSQL" `
    "There is no difference" 0 `
    "Strict 2PL holds exclusive locks until commit. Rigorous 2PL holds ALL locks (shared and exclusive) until the transaction ends, guaranteeing a strict serializable order that mirrors transaction commit order."

Add-Q 21 17 "Medium" "What is an Index Seek versus an Index Scan in query execution plans?" `
    "Index Seek scans the entire index; Index Scan finds one row" `
    "Index Seek navigates the B-Tree directly using search keys to find qualifying rows in O(log N); Index Scan traverses all leaf pages of the index from start to finish" `
    "Both take identical time" `
    "Index Seek is only used on strings" 1 `
    "An Index Seek uses B-tree traversal to pinpoint exact matching keys in O(log N). An Index Scan reads through the entire index sequentially (faster than full table scan, but still scanning all index leaves)."

Add-Q 21 18 "Hard" "In the ARIES database recovery algorithm, what are the three recovery phases executed after a crash?" `
    "Compile, Run, Debug" `
    "Analysis (reconstruct state from log), Redo (repeat history to restore pre-crash state), and Undo (rollback active uncommitted transactions)" `
    "Backup, Restore, Verify" `
    "Scan, Flush, Commit" 1 `
    "ARIES recovery operates in 3 distinct passes: 1. Analysis phase identifies dirty pages and active transactions, 2. Redo phase repeats all logged operations (repeating history), 3. Undo phase reverses changes of uncommitted transactions."

Add-Q 21 19 "Medium" "What does EXPLAIN ANALYZE provide that regular EXPLAIN does not?" `
    "Source code of the database engine" `
    "EXPLAIN shows optimizer estimates; EXPLAIN ANALYZE actually executes the query and reports actual runtimes, row counts, and memory used" `
    "Automatic index creation" `
    "Syntax correction" 1 `
    "EXPLAIN shows estimated costs without running the query. EXPLAIN ANALYZE actually executes the query to return actual execution times, buffer hits, and exact row counts at each execution step."

Add-Q 21 20 "Hard" "What is the 'Phantom Problem' in SQL transactions and how does Next-Key Locking in InnoDB prevent it?" `
    "Data vanishing from hard drive" `
    "Concurrent inserts into a queried range; Next-Key locking locks the index record along with the GAP immediately preceding it, preventing concurrent transactions from inserting into the gap" `
    "Memory corruption in buffer pool" `
    "Duplicate key errors" 1 `
    "InnoDB prevents phantom reads in Repeatable Read by using Next-Key Locks (Record Lock + Gap Lock). Locking the gaps between existing keys blocks other transactions from inserting new rows into the scanned range."

Add-Q 21 21 "Medium" "What is an unindexed Full Table Scan (Sequential Scan)?" `
    "Reading data directly from cache" `
    "The database engine reads every single page and row in the table sequentially from disk/buffer pool to evaluate WHERE conditions" `
    "A scan that runs in O(1) time" `
    "A scan of table metadata only" 1 `
    "Without a matching index, the database must read all data pages from disk into memory, resulting in high I/O consumption on large tables."

Add-Q 21 22 "Hard" "In distributed databases, what is Vector Clock used for?" `
    "Measuring clock speed of CPUs" `
    "Capturing causal relationships and detecting concurrent conflicting updates across distributed nodes without synchronized physical clocks" `
    "Encrypting vector embeddings" `
    "Accelerating GPU calculations" 1 `
    "Vector clocks track logical causality across distributed nodes. Comparing vector clocks determines whether one event causally preceded another or if two updates occurred concurrently (conflict requiring resolution)."

Add-Q 21 23 "Medium" "Which SQL constraint enforces that all values in a column are distinct across the entire table?" `
    "DEFAULT" `
    "UNIQUE" `
    "CHECK" `
    "FOREIGN KEY" 1 `
    "The UNIQUE constraint ensures all values in a column or set of columns are distinct (typically implemented internally using a unique B-tree index)."

Add-Q 21 24 "Hard" "What is Write Amplification in SSD-based database engines (like RocksDB using LSM Trees)?" `
    "Writing louder audio signals" `
    "The ratio of the amount of data physically written to storage media compared to the amount of logical data written by the application" `
    "Compaction of indexes in RAM" `
    "Increasing network bandwidth" 1 `
    "In databases and SSDs, updates trigger multi-level compactions or garbage collection block rewrites. Write amplification measures this overhead (e.g. writing 1 KB logically causes 10 KB of physical NAND flash writes)."

Add-Q 21 25 "Medium" "What is a Foreign Key Index and why is it recommended to index foreign key columns?" `
    "It converts foreign keys to integers" `
    "Foreign keys are not automatically indexed by most RDBMS; indexing them prevents full table scans during JOIN queries and parent-table DELETE/UPDATE cascade checks" `
    "To encrypt foreign keys" `
    "To make foreign keys unique" 1 `
    "While primary keys get automatic unique indexes, foreign key columns do not. Without an index, parent table deletes or joins force sequential scans of the child table."

# ==================== DAY 22: Operating Systems Memory & Paging ====================
Add-Q 22 1 "Medium" "What is the primary difference between Logical (Virtual) Address Space and Physical Address Space?" `
    "Logical is on disk; Physical is in RAM" `
    "Logical address is generated by the CPU during program execution; Physical address refers to the actual hardware memory address in physical RAM, translated by the MMU" `
    "Physical addresses can be negative" `
    "Logical addresses are 16-bit only" 1 `
    "The CPU operates entirely with virtual (logical) memory addresses. The Memory Management Unit (MMU) hardware maps these virtual addresses to physical RAM frames using page tables."

Add-Q 22 2 "Hard" "What is the difference between Internal Fragmentation and External Fragmentation in memory allocation?" `
    "Internal occurs on SSDs; external on HDDs" `
    "Internal fragmentation is allocated memory within a fixed block that goes unused; External fragmentation is free memory broken into small scattered holes that cannot satisfy large contiguous allocation requests" `
    "External fragmentation occurs inside cache" `
    "Internal fragmentation is eliminated by compaction" 1 `
    "Paging eliminates external fragmentation (any free frame can be allocated), but suffers internal fragmentation when a process doesn't fully use the last allocated page. Variable-size segmentation suffers external fragmentation."

Add-Q 22 3 "Medium" "What is the Translation Lookaside Buffer (TLB) in CPU architecture?" `
    "A buffer for network packets" `
    "A fast hardware cache of recent virtual-to-physical address translations located inside the MMU to avoid repeated memory lookups into page tables" `
    "A disk write buffer" `
    "A stack buffer for recursive calls" 1 `
    "Because reading multi-level page tables from RAM is slow, the TLB caches active page-to-frame translations. A TLB hit resolves physical addresses in single clock cycles."

Add-Q 22 4 "Hard" "What is Belady's Anomaly in operating systems page replacement algorithms?" `
    "A memory leak in Linux kernel" `
    "The counter-intuitive phenomenon where increasing the number of physical page frames results in MORE page faults for certain access patterns under the FIFO algorithm" `
    "A deadlock between page tables" `
    "CPU throttling during high memory usage" 1 `
    "Belady proved that for First-In-First-Out (FIFO) page replacement, allocating more frames to a process can sometimes increase total page faults. Stack-based algorithms (like LRU and OPT) are mathematically immune."

Add-Q 22 5 "Medium" "What is a Page Fault in virtual memory systems?" `
    "A physical hardware RAM failure" `
    "A hardware interrupt raised by the MMU when a program accesses a virtual page that is marked invalid or not currently loaded into physical RAM" `
    "A segmentation fault that terminates the program" `
    "An incorrect calculation in code" 1 `
    "When a referenced page is not in RAM (valid bit = 0), the MMU triggers a page fault trap. The OS kernel retrieves the page from swap space on disk and maps it into a free physical frame."

Add-Q 22 6 "Hard" "What is Thrashing in operating system virtual memory, and what causes it?" `
    "A process deleting too many files" `
    "A state where the system spends more time swapping pages in and out of disk than executing instructions, caused by over-committing memory such that the sum of working sets exceeds physical RAM" `
    "Disk heads colliding with platters" `
    "Network packets dropping under high load" 1 `
    "When physical RAM is insufficient to hold the combined working sets of active processes, processes continuously page-fault each other, causing the CPU to sit idle waiting for disk I/O."

Add-Q 22 7 "Medium" "Which Page Replacement Algorithm provides the lowest possible page fault rate for any memory access sequence (theoretical benchmark)?" `
    "First-In, First-Out (FIFO)" `
    "Optimal Page Replacement (OPT / Belady's Min Algorithm)" `
    "Least Recently Used (LRU)" `
    "Least Frequently Used (LFU)" 1 `
    "The OPT algorithm replaces the page that will not be referenced for the longest period of time in the future. Because it requires impossible future knowledge, it serves as the theoretical benchmark."

Add-Q 22 8 "Hard" "How does the Clock (Second-Chance) Page Replacement Algorithm approximate LRU in hardware?" `
    "By keeping a timestamp for every page" `
    "By organizing page frames in a circular queue with a reference bit: the clock hand inspects the bit; if 1, clear to 0 and advance; if 0, select this page for replacement" `
    "By sorting pages by size" `
    "By checking page checksums" 1 `
    "Clock algorithm avoids expensive timestamps or list rewiring. It uses a 1-bit reference flag set by hardware on read/write, rotating a clock hand to give pages with bit=1 a second chance."

Add-Q 22 9 "Medium" "What is the standard page size in x86/x64 architecture?" `
    "512 bytes" `
    "4 KB (4096 bytes)" `
    "1 MB" `
    "64 KB" 1 `
    "The standard page size in x86/x64 virtual memory architectures is 4 Kilobytes (4096 bytes), with support for Huge Pages (2 MB or 1 GB)."

Add-Q 22 10 "Hard" "Why do modern 64-bit operating systems use Multi-Level Paging (e.g. 4-level or 5-level page tables) instead of a single flat page table?" `
    "To make memory access faster" `
    "A single flat page table for a 64-bit address space would require gigabytes of contiguous RAM per process; multi-level paging allocates page table pages on-demand for only the mapped virtual regions" `
    "Because 64-bit CPUs lack MMU" `
    "To encrypt memory addresses" 1 `
    "A flat 64-bit page table would require impossible memory overhead. Multi-level hierarchical paging creates a tree where unallocated address space regions require zero physical page table allocations."

Add-Q 22 11 "Medium" "What is Swapping in operating system memory management?" `
    "Swapping variable values in code" `
    "Moving an entire process or inactive pages between physical RAM and secondary disk storage (swap space)" `
    "Switching CPU cores" `
    "Reversing memory addresses" 1 `
    "When physical RAM is constrained, the OS swaps inactive memory pages out to a designated swap partition/file on disk, reclaiming RAM for active tasks."

Add-Q 22 12 "Hard" "What is the 'Working Set Model' of a process?" `
    "The number of threads in the process" `
    "The set of memory pages referenced by the process during a recent time window delta (representing the process's active working memory demand)" `
    "The total disk space occupied by the binary" `
    "The list of open files in the PCB" 1 `
    "The working set W(t, delta) represents pages accessed in the last delta time units. If the sum of working sets of all running processes exceeds physical RAM, thrashing occurs."

Add-Q 22 13 "Medium" "What is the purpose of Compaction in memory management?" `
    "To compress files on disk" `
    "To shuffle allocated memory blocks in RAM into one contiguous segment, merging all scattered free holes into a single large usable block to eliminate external fragmentation" `
    "To reduce cache size" `
    "To delete zombie processes" 1 `
    "Compaction relocates active memory segments to consolidate scattered free holes into one large contiguous free block, but is only possible with dynamic runtime address binding."

Add-Q 22 14 "Hard" "What is an Inverted Page Table and what problem does it solve?" `
    "A page table stored on disk" `
    "A page table indexed by physical frame number rather than virtual page number (containing one entry per physical frame), bounding page table memory regardless of virtual address space size" `
    "A page table that reverses bit order" `
    "A page table for GPUs" 1 `
    "Standard page tables grow with virtual address space. An Inverted Page Table has exactly one entry per physical RAM frame, dramatically reducing page table memory in large address space systems."

Add-Q 22 15 "Medium" "What is the difference between Spatial Locality and Temporal Locality?" `
    "Spatial locality refers to disks; temporal refers to RAM" `
    "Temporal locality means recently accessed memory is likely to be accessed again soon; Spatial locality means memory locations physically near recently accessed memory are likely to be accessed soon" `
    "Temporal locality is for variables; spatial is for functions" `
    "There is no difference" 1 `
    "Caches and virtual memory exploit both: Temporal locality reuses recently used items (loops, variables), while Spatial locality prefetches adjacent contiguous memory blocks (sequential array iterations)."

Add-Q 22 16 "Hard" "What is Copy-on-Write (COW) when a process executes fork() in Unix/Linux?" `
    "Child process creates an immediate physical copy of all parent memory pages" `
    "Parent and child initially share the same physical memory pages marked read-only; a private physical copy of a page is duplicated only when either process attempts to write to that page" `
    "Child process writes only to disk" `
    "Parent memory is overwritten by child" 1 `
    "Copy-on-Write makes fork() nearly instantaneous: rather than copying entire megabytes of memory, pages are shared read-only. A page is duplicated only if modified, saving memory and CPU cycles."

Add-Q 22 17 "Medium" "What is Demand Paging?" `
    "Loading all program pages into RAM before execution begins" `
    "Loading a page into physical memory only when an actual reference/page-fault occurs for that page during execution" `
    "Paging triggered by user commands" `
    "Paging on SSD drives only" 1 `
    "Demand paging loads pages lazily as needed. Unreferenced program modules or error handlers are never read from disk into RAM, minimizing startup time and memory footprint."

Add-Q 22 18 "Hard" "What are the Dirty Bit (Modified Bit) and Valid Bit in a page table entry?" `
    "Valid bit indicates if page is allocated in virtual memory; Dirty bit indicates if the page has been modified since being loaded into RAM (requiring disk write on eviction)" `
    "Dirty bit indicates malware; Valid bit indicates encryption" `
    "Valid bit is for CPU; Dirty bit is for GPU" `
    "Dirty bit counts page faults" 0 `
    "Valid bit: 1 = in RAM, 0 = on disk / unmapped. Dirty bit: set to 1 by hardware on any write. If clean (dirty=0), eviction simply discards the page without disk I/O; if dirty=1, it must be written back to swap."

Add-Q 22 19 "Medium" "What is Segmentation in memory management?" `
    "Dividing memory into equal-sized 4KB pages" `
    "A memory management scheme that divides logical address space into variable-sized segments based on user program logical units (e.g. Code, Stack, Data, Heap)" `
    "Splitting CPU instructions across cores" `
    "Formatting hard drives into partitions" 1 `
    "Unlike paging which breaks memory into fixed-size hardware chunks, segmentation divides memory into variable-sized units reflecting semantic program modules (code segment, stack segment, data segment)."

Add-Q 22 20 "Hard" "How is Effective Memory Access Time (EMAT) calculated given TLB hit ratio alpha, TLB access time t, and memory access time m?" `
    "EMAT = t + m" `
    "EMAT = alpha * (t + m) + (1 - alpha) * (t + 2m) [for single-level page table]" `
    "EMAT = alpha * m" `
    "EMAT = (t + m) / alpha" 1 `
    "On TLB hit (probability alpha), time is t (TLB lookup) + m (fetch actual data). On TLB miss (1 - alpha), time is t + m (fetch page table entry from RAM) + m (fetch actual data) = t + 2m."

Add-Q 22 21 "Medium" "What happens when a process attempts to write to a memory page marked Read-Only?" `
    "The CPU ignores the write" `
    "The hardware MMU generates a Protection Fault (Segmentation Fault / General Protection Fault), and the OS kernel sends a SIGSEGV signal terminating the process" `
    "The memory page expands" `
    "The write is stored in swap space" 1 `
    "Protection bits in the page table enforce permissions (Read, Write, Execute). Violating write access on read-only pages triggers a trap that typically crashes the errant process with Segmentation Fault."

Add-Q 22 22 "Hard" "What is Address Space Layout Randomization (ASLR) and what security vulnerability does it defend against?" `
    "Encrypts network traffic" `
    "Randomizes the virtual memory positions of the stack, heap, and libraries at process launch, making Buffer Overflow and Return-Oriented Programming (ROP) exploits difficult" `
    "Randomizes CPU clock speeds" `
    "Scrambles database passwords" 1 `
    "ASLR randomizes memory offsets on every execution. Attackers cannot rely on hardcoded memory addresses to redirect execution control flow, thwarting common exploit techniques."

Add-Q 22 23 "Medium" "What hardware component is responsible for translating Virtual Addresses to Physical Addresses?" `
    "ALU (Arithmetic Logic Unit)" `
    "MMU (Memory Management Unit)" `
    "GPU (Graphics Processing Unit)" `
    "DMA Controller" 1 `
    "The Memory Management Unit (MMU) is the dedicated hardware circuitry inside the CPU that handles virtual-to-physical address translation via page tables."

Add-Q 22 24 "Hard" "What is the difference between First-Fit, Best-Fit, and Worst-Fit dynamic storage allocation algorithms?" `
    "First-Fit allocates the first hole large enough; Best-Fit allocates the smallest hole that is large enough (minimizing leftover); Worst-Fit allocates the largest available hole" `
    "Best-fit is always the fastest" `
    "Worst-fit produces zero fragmentation" `
    "First-fit requires sorting holes by size" 0 `
    "First-Fit is fast (stops at first suitable hole). Best-Fit minimizes leftover hole size (but creates tiny unusable fragments). Worst-Fit leaves the largest remaining fragment."

Add-Q 22 25 "Medium" "Why is Virtual Memory larger than physical RAM in many computer systems?" `
    "Because RAM chips are physically smaller than CPU" `
    "Because secondary storage (disk/SSD swap space) extends the available physical memory, allowing processes to address more memory than physically installed RAM" `
    "Because virtual memory is 64-bit" `
    "It is a software simulation without real storage" 1 `
    "Virtual memory decouples logical address space from physical limits, utilizing fast SSD/HDD swap backing storage to support programs larger than physical RAM."

Write-Output "Days 21, 22 loaded."
