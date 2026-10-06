# Generator for Days 26 to 30 (125 Unique Questions)

# ==================== DAY 26: Top 15 Company Question Drill ====================
Add-Q 26 1 "Medium" "In Amazon coding assessments, which algorithmic problem tests the combination of Doubly Linked List and Hash Map for O(1) eviction?" `
    "Binary Tree Inorder Traversal" `
    "LRU Cache (Least Recently Used Cache)" `
    "Merge Sort on Arrays" `
    "Fibonacci Calculation" 1 `
    "LRU Cache is Amazon's most frequently asked data structure problem, testing hash table fast lookups combined with node rewiring in doubly linked lists."

Add-Q 26 2 "Hard" "In Google interviews, how is the 'Alien Dictionary' problem modeled and solved?" `
    "Dynamic programming on strings" `
    "Directed Graph dependency modeling: compare adjacent words to deduce character precedence edges, followed by Topological Sort (Kahn's or DFS) to detect cycles" `
    "Binary search on alphabet length" `
    "Levenshtein distance" 1 `
    "Google frequently tests graph modeling from real-world constraints. Comparing lexicographically adjacent words builds a directed dependency graph, resolved via topological sort."

Add-Q 26 3 "Medium" "In Microsoft interviews, what is the optimal algorithm for 'Spiral Matrix' traversal?" `
    "Recursive backtracking" `
    "Four boundary pointers (top, bottom, left, right): traverse top row, right column, bottom row, left column, contracting boundaries inward until they cross" `
    "Sort all matrix values" `
    "Rotate matrix 4 times" 1 `
    "Maintaining top, bottom, left, and right bounds and advancing while top <= bottom && left <= right traverses the M x N matrix in strictly O(M*N) time and O(1) space."

Add-Q 26 4 "Hard" "In Meta (Facebook) interviews, what is the optimal solution for 'Subarray Sum Equals K' when the array contains negative numbers?" `
    "Two-pointer sliding window in O(N)" `
    "Prefix Sum HashMap: store running prefix sums and their frequency counts; at each index, add map.getOrDefault(curSum - K, 0) to total in O(N) time and O(N) space" `
    "Nested loops in O(N^2)" `
    "Divide and conquer in O(N log N)" 1 `
    "Meta's top asked problem: because negative numbers invalidate sliding window monotonicity, tracking prefix sum frequencies in a hash map guarantees O(N) evaluation."

Add-Q 26 5 "Medium" "In Apple technical interviews, which bit manipulation trick is asked to determine if an integer is a Power of Two?" `
    "(n & 1) == 0" `
    "(n > 0) && ((n & (n - 1)) == 0)" `
    "(n >> 2) == 1" `
    "n % 2 == 0" 1 `
    "A power of two has exactly one set bit in binary. Subtracting 1 flips all bits below it. The bitwise AND of n and (n - 1) evaluates to 0 if and only if n is a power of 2."

Add-Q 26 6 "Hard" "In Netflix engineering interviews, which pattern handles sudden spikes in distributed microservices traffic gracefully without collapsing backend databases?" `
    "Restarting containers on high load" `
    "Rate Limiting with Token Bucket / Leaky Bucket at the API Gateway, coupled with Circuit Breakers (Resilience4j/Hystrix) and message queues" `
    "Increasing database connection timeouts to 60 seconds" `
    "Synchronous REST calls with infinite retries" 1 `
    "Netflix pioneered Chaos Engineering and resilience: circuit breakers trip open when failure thresholds exceed limits, preventing cascading failures, while token bucket gateway rate limiters shield services."

Add-Q 26 7 "Medium" "In Uber driver-dispatch system design rounds, what geospatial indexing algorithm is used to find nearby drivers in O(1)?" `
    "Full table scan with Pythagorean formula" `
    "Geohashing or Google S2 / Uber H3 hexagonal spatial indexing" `
    "Binary search on latitude" `
    "Storing coordinates in JSON files" 1 `
    "Uber created H3 (hexagonal hierarchical spatial index). Earth's surface is partitioned into hexagonal cells mapped to 64-bit integer keys, allowing instant nearby driver radius lookups."

Add-Q 26 8 "Hard" "In Adobe interviews, which algorithm solves 'Trapping Rain Water' in O(N) time and O(1) auxiliary space?" `
    "Dynamic programming storing prefix and suffix arrays" `
    "Two pointers (left and right) tracking left_max and right_max, processing the pointer with the smaller maximum inward" `
    "Monotonic decreasing stack" `
    "Both B and C achieve O(N) time, with B achieving O(1) auxiliary space" 3 `
    "Adobe frequently tests Trapping Rain Water: both two-pointers and monotonic stack run in O(N), with two-pointers requiring zero additional memory."

Add-Q 26 9 "Medium" "In Goldman Sachs technical rounds, what problem determines the maximum profit from buying and selling a stock once?" `
    "Two Sum" `
    "Best Time to Buy and Sell Stock I: single pass maintaining min_price seen so far and updating max_profit" `
    "Quicksort on prices" `
    "Matrix chain multiplication" 1 `
    "A finance staple: iterate through prices while tracking the running minimum purchase price, computing profit at each step in O(N) time and O(1) space."

Add-Q 26 10 "Hard" "In Morgan Stanley low-latency trading interviews, what concurrency issue occurs when multiple threads modify adjacent array elements residing on the same 64-byte CPU cache line?" `
    "Deadlock on RAM" `
    "False Sharing: cache coherence protocol invalidates the entire cache line across CPU cores even though threads touch distinct variables, degrading performance" `
    "Segmentation fault" `
    "Stack overflow" 1 `
    "False sharing happens when independent variables share a single 64-byte CPU cache line. Core 1 writing to variable A forces Core 2's cache line containing variable B to be invalidated, triggering expensive bus traffic."

Add-Q 26 11 "Medium" "In TCS Digital interviews, what is the time complexity of finding an element in a balanced Binary Search Tree?" `
    "O(N)" `
    "O(log N)" `
    "O(1)" `
    "O(N log N)" 1 `
    "In a balanced BST, each comparison halves the remaining search tree, achieving O(log N) lookup time."

Add-Q 26 12 "Hard" "In Infosys SP/DSE rounds, how is 'Course Schedule' solved when tasks must be output in valid sequence?" `
    "Dijkstra's shortest path" `
    "Topological Sort using Kahn's algorithm (BFS with in-degrees) or DFS with cycle detection" `
    "Binary search on course credits" `
    "Kruskal's algorithm" 1 `
    "Topological sorting orders vertices in a directed acyclic graph such that every directed edge u -> v has u preceding v, resolving course prerequisites."

Add-Q 26 13 "Medium" "In Oracle database developer interviews, what is the default behavior of an unindexed foreign key when the parent table row is deleted?" `
    "Instant sub-millisecond cascade" `
    "A full table scan of the child table to verify referential integrity, causing table-level lock contention" `
    "Syntax error" `
    "Child table is automatically dropped" 1 `
    "Oracle specifically flags unindexed foreign keys: deleting or updating a parent key requires locking and scanning the child table, creating severe concurrency bottlenecks."

Add-Q 26 14 "Hard" "In Akamai CDN interviews, what caching replacement policy is preferred for streaming media where items are accessed once in bulk?" `
    "FIFO" `
    "2Q (Two Queues) or LRFU (Least Recently/Frequently Used) to prevent one-time scans from polluting the main cache" `
    "Random Eviction" `
    "Never evicting from cache" 1 `
    "Standard LRU suffers 'cache pollution' from large sequential scans. 2Q separates one-time accesses into a FIFO probationary queue before promoting recurrent items to an LRU cache."

Add-Q 26 15 "Medium" "In Fidelity Investments interviews, what SQL function calculates a running cumulative total of transactions ordered by date?" `
    "SUM(amount) GROUP BY date" `
    "SUM(amount) OVER (ORDER BY transaction_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)" `
    "COUNT(*) OVER ()" `
    "MAX(amount)" 1 `
    "The window function SUM() combined with an ORDER BY frame computes running cumulative totals row-by-row without collapsing transaction details."

Add-Q 26 16 "Hard" "In Amazon Bar Raiser rounds, how should a candidate demonstrate 'Customer Obsession' during technical design?" `
    "By adding as many features as possible" `
    "By designing the system around end-user latency, 99.99% availability, intuitive failure fallbacks, and real user experience metrics rather than theoretical tech stacks" `
    "By choosing the newest unreleased programming language" `
    "By reducing code comments" 1 `
    "Amazon evaluates architecture through user impact: minimizing user-perceived latency, handling edge cases gracefully, and measuring operational SLOs that directly benefit the customer."

Add-Q 26 17 "Medium" "In Capgemini and Cognizant coding assessments, how is a String checked to see if it is a Palindrome in O(1) space?" `
    "Reverse string and store in new variable" `
    "Two pointers (left at start, right at end) comparing characters and moving inward until they cross" `
    "Convert to char array and sort" `
    "Use regular expressions" 1 `
    "Two converging pointers compare s[left] and s[right]. If any pair mismatches, return false. Terminates in O(N) time and O(1) auxiliary space."

Add-Q 26 18 "Hard" "In Cisco networking interviews, how is the Spanning Tree Protocol (STP - IEEE 802.1D) used on Ethernet switches?" `
    "To assign IP addresses" `
    "To prevent bridge loops and broadcast radiation storms by disabling redundant network links until an active link fails" `
    "To compress Ethernet frames" `
    "To route BGP packets" 1 `
    "STP dynamically detects loops in layer 2 switched topologies and blocks redundant ports. If an active bridge link goes down, STP unblocks the backup port to restore connectivity."

Add-Q 26 19 "Medium" "In Accenture technical interviews, what is the difference between primary key and unique key regarding NULLs?" `
    "Primary key allows 1 NULL; unique key allows 0" `
    "Primary key allows 0 NULLs (strictly disallows NULL); unique key permits NULL values depending on the database" `
    "Both strictly disallow NULL" `
    "Unique key can only be numeric" 1 `
    "A Primary Key strictly disallows NULL values. Unique constraints enforce uniqueness among non-null values while permitting NULLs."

Add-Q 26 20 "Hard" "In Walmart Global Tech interviews, which algorithm solves the 'Meeting Rooms II' room scheduling problem?" `
    "Sort intervals by start time; use a Min-Heap of meeting end times to track currently occupied rooms in O(N log N)" `
    "Sort intervals descending" `
    "Use a hash map of room numbers" `
    "Binary search on meeting durations" 0 `
    "Walmart frequently asks interval scheduling: sorting by start time and tracking active room end times via Min-Heap determines minimum rooms in O(N log N)."

Add-Q 26 21 "Medium" "In Wipro Elite NTH coding tests, what is Kadane's algorithm used to compute?" `
    "Minimum spanning tree" `
    "Maximum contiguous subarray sum in O(N) time" `
    "Shortest path in graph" `
    "Prime factorization" 1 `
    "Kadane's algorithm maintains the maximum subarray sum ending at each position, achieving O(N) linear time and O(1) auxiliary space."

Add-Q 26 22 "Hard" "In Salesforce interviews, what is the design of a Multi-Tenant SaaS database architecture?" `
    "Separate physical server for each customer" `
    "Shared database with Tenant ID column partitioning (Row-level security), or separate schemas per tenant with shared application pool" `
    "All customers share one user account" `
    "NoSQL files stored on client browsers" 1 `
    "Salesforce pioneered multi-tenancy: millions of clients share common infrastructure where metadata engines and tenant_id column filters isolate customer data safely with maximum resource efficiency."

Add-Q 26 23 "Medium" "In standard placement assessments, what is the time complexity of Binary Search?" `
    "O(1)" `
    "O(log N)" `
    "O(N)" `
    "O(N log N)" 1 `
    "Binary search eliminates half the remaining search space at each iteration, running in O(log N) time."

Add-Q 26 24 "Hard" "In Bloomberg financial engineering rounds, what data structure maintains top-10 real-time bids/asks in O(1) access and O(log K) updates?" `
    "Array of size 1,000,000" `
    "Balanced Binary Search Tree (std::map) or Min-Max Priority Queue indexed by price level" `
    "Linked list" `
    "Hash map with no ordering" 1 `
    "Order books require ordered price tiers. Balanced BSTs (Red-Black trees) or B-trees maintain price sorting with O(log K) insertion, deletion, and order execution."

Add-Q 26 25 "Medium" "What is the typical time limit for solving a single medium DSA coding problem in top tech company interviews?" `
    "5 minutes" `
    "20 to 25 minutes (including explaining thought process, dry running, and writing clean code)" `
    "90 minutes" `
    "3 hours" 1 `
    "In a standard 45-minute interview containing two problems or one problem with follow-ups, candidates are expected to understand, design, code, and test a solution within 20-25 minutes."

# ==================== DAY 27: HR Behavioral STAR Method Drills ====================
Add-Q 27 1 "Medium" "What does the STAR acronym stand for in behavioral interview methodology?" `
    "Strategy, Tactics, Action, Review" `
    "Situation, Task, Action, Result" `
    "System, Test, Architecture, Release" `
    "Summary, Timing, Assessment, Report" 1 `
    "The STAR technique structures behavioral answers: Situation (context), Task (objective/challenge), Action (specific steps you took), and Result (quantifiable business impact and learnings)."

Add-Q 27 2 "Hard" "In the STAR framework, which two components should constitute roughly 70% of your total answer time?" `
    "Situation and Task" `
    "Action and Result" `
    "Situation and Result" `
    "Task and Strategy" 1 `
    "Interviewers evaluate YOU, not the situation. Spending too long setting up the context leaves too little time to showcase your individual technical actions and quantifiable outcomes."

Add-Q 27 3 "Medium" "How should you answer the interview question: 'Tell me about yourself'?" `
    "Recite your entire life story and childhood hobbies" `
    "A concise 90-second pitch: current technical expertise -> key college/internship project highlights -> why you are excited about this specific role" `
    "Read your resume line by line" `
    "Ask the interviewer to guess" 1 `
    "The elevator pitch: 15s present background, 45s technical capabilities and standout achievements, 30s why this company aligns with your career trajectory."

Add-Q 27 4 "Hard" "When asked 'What is your biggest weakness?', which approach demonstrates emotional maturity and self-awareness?" `
    "'I am too much of a perfectionist' or 'I work too hard'" `
    "State a genuine professional skill gap you have identified, explain the concrete actions you are actively taking to improve it, and describe recent progress" `
    "'I have no weaknesses at all'" `
    "Blame previous professors or managers" 1 `
    "Cliche humble-brags raise red flags. Choosing a real area of development (e.g. public speaking, delegating tasks) accompanied by proactive improvement steps proves maturity."

Add-Q 27 5 "Medium" "How should you describe a conflict with a teammate or peer during a group project?" `
    "Explain that the other person was incompetent and you did all their work" `
    "Focus on differing technical viewpoints: listened actively to their reasoning, used data or objective trade-off benchmarks to evaluate alternatives, and arrived at a consensus professionally" `
    "Refuse to work with them" `
    "Report them to the HR immediately" 1 `
    "Focus on technical disagreements rather than personalities. Demonstrate active listening, objective data-driven decision making, and preserving team morale."

Add-Q 27 6 "Hard" "What is the Amazon Leadership Principle 'Disagree and Commit'?" `
    "Agreeing with everything the manager says" `
    "Respectfully challenging decisions with data when you disagree; but once a final decision is made by the team, committing 100% to its execution without harboring resentment" `
    "Resigning when your architecture proposal is rejected" `
    "Voting on every code commit" 1 `
    "Leaders voice convictions respectfully during the decision phase. Once a direction is chosen, they rally behind it with total commitment to ensure collective success."

Add-Q 27 7 "Medium" "Why do interviewers ask: 'Why do you want to join our company specifically?'" `
    "To test if you memorized their stock ticker" `
    "To evaluate if you researched their products, technology stack, and engineering culture, and whether your motivations align with the company's mission" `
    "To see if you want free snacks" `
    "It is a filler question with no scoring value" 1 `
    "Generic answers ('You are a Fortune 500 company') score poorly. Mentioning specific tech blogs, recent product releases, or engineering challenges proves genuine intent."

Add-Q 27 8 "Hard" "When describing a past failure in an interview, what is the critical element the interviewer is evaluating?" `
    "Whether you can hide your mistakes" `
    "Accountability, blameless root-cause analysis, and the concrete guardrails/learnings you instituted to prevent that failure from recurring" `
    "Who you blamed for the outage" `
    "Whether the project was canceled" 1 `
    "Great engineers own mistakes. Highlighting personal ownership, systemic root cause analysis, and proactive safeguards turns a failure into proof of resilience and growth."

Add-Q 27 9 "Medium" "What is the best way to answer: 'Where do you see yourself in 3 to 5 years?'" `
    "In your interviewer's chair" `
    "Growing as a strong, versatile Software Engineer, mastering core architecture and system scalability, and mentoring junior engineers while delivering high-impact features" `
    "Running my own separate startup company" `
    "Retired on a beach" 1 `
    "Demonstrate commitment to professional technical growth, progressive ownership, deepening architectural breadth, and contributing long-term value to the organization."

Add-Q 27 10 "Hard" "How should a fresh graduate answer: 'Tell me about a time you showed leadership' when they have never held a formal management title?" `
    "Claim they were the CEO of a group" `
    "Describe taking proactive technical initiative: identifying an unassigned bottleneck in a project, organizing team documentation, or mentoring a struggling peer to deliver on time" `
    "State that leadership is only for managers" `
    "Talk about high school sports captains" 1 `
    "Leadership is action, not rank. Taking initiative to fix broken CI/CD pipelines, driving consensus on architecture, or unblocking teammates demonstrates leadership."

Add-Q 27 11 "Medium" "At the end of an interview when asked 'Do you have any questions for us?', what should you do?" `
    "Say 'No, everything is clear' and leave immediately" `
    "Ask 2-3 thoughtful questions about the team's engineering challenges, deployment processes, or technical stack to demonstrate engagement and interest" `
    "Ask what your salary will be tomorrow" `
    "Ask when the interview will end" 1 `
    "Skipping questions signals disinterest. Asking about technical architecture, sprint retrospectives, or mentorship culture shows you envision yourself working on the team."

Add-Q 27 12 "Hard" "How should you respond when an interviewer asks your salary expectations as a campus placement candidate?" `
    "Demand a specific high number immediately" `
    "State that you are focused on learning and finding the right engineering fit, and that you are confident the company offers competitive, standard industry packages for campus graduates" `
    "Refuse to answer" `
    "Say you will work for free" 1 `
    "Campus offers typically follow fixed company tier compensation bands. Demonstrating focus on learning and cultural fit while acknowledging standard market bands is professional."

Add-Q 27 13 "Medium" "What is the Eisenhower Matrix used for in time management and deadline prioritization?" `
    "Writing binary search algorithms" `
    "Categorizing tasks into Urgent vs Important: Urgent & Important (Do First), Important & Not Urgent (Schedule), Urgent & Not Important (Delegate), Neither (Eliminate)" `
    "Allocating memory pages" `
    "Calculating CPU burst times" 1 `
    "The matrix prevents getting overwhelmed by reactive tasks, ensuring you prioritize critical engineering tasks that deliver long-term impact."

Add-Q 27 14 "Hard" "How should you handle an interview question where you genuinely do not know the answer?" `
    "Pretend you know and invent fake technical terminology" `
    "Acknowledge honestly that you haven't encountered that specific tool, then explain how you would reason about it from foundational principles or find the answer efficiently" `
    "Remain silent for 5 minutes" `
    "Ask to skip to the next interviewer" 1 `
    "Bluffing is easily caught and destroys trust. Admitting the knowledge boundary followed by structured first-principles reasoning proves honesty and problem-solving aptitude."

Add-Q 27 15 "Medium" "Why is active listening crucial during technical interviews?" `
    "To memorize the interviewer's voice" `
    "To catch subtle hints, edge case clarifications, and constraints the interviewer provides before jumping into code" `
    "To avoid writing code" `
    "It is not important" 1 `
    "Many candidates fail because they code before fully clarifying requirements. Listening to the interviewer's subtle hints often saves 15 minutes of rewriting code."

Add-Q 27 16 "Hard" "How should you describe your role in an Agile / Scrum software team?" `
    "Say you don't like meetings" `
    "Mention participating in daily standups, sprint planning and story point estimations, peer code reviews, and continuous improvement during sprint retrospectives" `
    "Say the project manager writes all code" `
    "Say you work exclusively alone" 1 `
    "Familiarity with Agile ceremonies (Standup, Backlog grooming, Retrospectives) signals that you will integrate smoothly into modern engineering teams on day one."

Add-Q 27 17 "Medium" "How should you explain a complex technical concept to a non-technical interviewer?" `
    "Use as much dense jargon and assembly code as possible" `
    "Use real-world analogies, high-level business metaphors, and focus on user impact and problem-solving rather than low-level implementation details" `
    "Tell them it is too hard for them to understand" `
    "Refuse to answer" 1 `
    "Great engineers communicate with cross-functional teams. Breaking down technical complexity into intuitive analogies (e.g. cache as a desk drawer vs warehouse) proves communication mastery."

Add-Q 27 18 "Hard" "How do you demonstrate 'Ownership' when working on a codebase?" `
    "Locking files so teammates cannot edit them" `
    "Writing comprehensive unit tests, adding clear documentation, monitoring production telemetry after deployment, and volunteering to debug production issues beyond your immediate ticket" `
    "Claiming credit for all team commits" `
    "Refusing to accept code reviews" 1 `
    "Ownership means caring about the whole product lifecycle: automated tests, observability, clean error handling, and being accountable for code in production."

Add-Q 27 19 "Medium" "What is the proper etiquette if you disagree with an interviewer's technical comment or hint?" `
    "Argue aggressively until they admit you are right" `
    "Politely explain your reasoning with a clear example, listen carefully to their response, and stay collaborative: 'I see your point about edge case X; let me adapt the approach'" `
    "Complain on social media" `
    "Stop writing code" 1 `
    "Interviews test collaborative coachability. Defensiveness is an automatic rejection. Receptive, polite discussions around trade-offs reflect how you will interact in PR reviews."

Add-Q 27 20 "Hard" "What is a 'Blameless Post-Mortem' in high-reliability engineering cultures?" `
    "Firing the junior engineer who pushed the bug" `
    "An incident review that focuses on process, tooling, and architectural weaknesses rather than blaming individuals, implementing guardrails to prevent future occurrences" `
    "Deleting server logs after a crash" `
    "Hiding the incident from executives" 1 `
    "Human error is a symptom of poor systemic safeguards. Blameless culture encourages transparent incident reporting and builds automated tests, alerts, and CI/CD canaries."

Add-Q 27 21 "Medium" "How should you describe your proudest technical project in an interview?" `
    "Read the repository README file" `
    "State the problem statement -> your specific architectural contribution -> technical obstacles overcome -> measurable impact (e.g. latency, users, tests)" `
    "Say it was easy and simple" `
    "Only show the frontend UI" 1 `
    "Highlight your individual contributions: architectural choices, specific algorithms selected, trade-offs evaluated, and measurable outcomes."

Add-Q 27 22 "Hard" "What is the best way to handle constructive criticism during a technical round?" `
    "Become defensive and justify every line of code" `
    "Welcome the feedback openly, ask clarifying questions to understand their perspective, and immediately demonstrate how you can incorporate it into the design" `
    "Ignore the feedback and continue unchanged" `
    "Apologize profusely without fixing anything" 1 `
    "Interviewers intentionally offer feedback to test coachability. Embracing the feedback and refining your code demonstrates high collaborative intelligence."

Add-Q 27 23 "Medium" "Why should you prepare questions about the company's engineering culture before the interview?" `
    "To fill uncomfortable silences" `
    "Because pairing your career values with their engineering practices ensures long-term mutual success and highlights your proactive diligence" `
    "Interviewers require it for their paperwork" `
    "It is optional and makes no difference" 1 `
    "An interview is a two-way street. Evaluating their CI/CD maturity, tech debt handling, and mentorship culture demonstrates career intentionality."

Add-Q 27 24 "Hard" "How should you explain an academic gap or low semester GPA if questioned by the HR interviewer?" `
    "Make up a false medical excuse" `
    "Be honest and transparent: acknowledge the reasons maturely, highlight how you turned the situation around, and point to recent strong project achievements and coding mastery" `
    "Blame the college professors" `
    "Refuse to discuss academic marks" 1 `
    "Honesty coupled with demonstrable turnaround and strong technical projects overcomes past academic gaps effectively."

Add-Q 27 25 "Medium" "What is the single most important non-technical attribute interviewers look for in campus recruits?" `
    "Arrogance" `
    "Strong learning agility, curiosity, clear communication, and a positive collaborative attitude" `
    "Typing speed" `
    "Memorization of textbook definitions" 1 `
    "Technologies change rapidly. Companies value candidates with rock-solid fundamentals who are eager to learn, communicate transparently, and collaborate effectively with teammates."

# ==================== DAY 28: Full 45-Min Mock Interview Round 1 ====================
Add-Q 28 1 "Medium" "What is the time complexity of searching for an element in an unsorted array of size N?" `
    "O(1)" `
    "O(N) linear scan" `
    "O(log N)" `
    "O(N log N)" 1 `
    "Without sorted order or an auxiliary index, every element must potentially be examined in the worst case, requiring O(N) comparisons."

Add-Q 28 2 "Hard" "In a distributed system, how does a Load Balancer ensure session persistence (Sticky Sessions)?" `
    "By rebooting backend servers" `
    "By hashing the client's IP address or issuing an HTTP tracking cookie to consistently route subsequent requests from the same user to the same backend server" `
    "By storing all sessions in browser local storage" `
    "By disabling HTTPS" 1 `
    "Sticky sessions use cookie injection or IP-hash routing to direct a client to the specific backend instance holding their in-memory session state."

Add-Q 28 3 "Medium" "What is the function of the Program Counter (PC) in a CPU?" `
    "Counts total executed instructions" `
    "Holds the memory address of the next instruction to be fetched and executed by the CPU" `
    "Measures CPU temperature" `
    "Tracks operating system boot time" 1 `
    "The Program Counter is a core hardware register that points to the memory address of the next machine code instruction to execute."

Add-Q 28 4 "Hard" "In computer networking, what is the Maximum Segment Size (MSS) in TCP?" `
    "The total size of the IP packet including headers" `
    "The maximum amount of application data (payload) that a host can receive in a single unfragmented TCP segment (typically MTU - 40 bytes = 1460 bytes for standard Ethernet)" `
    "The size of the TCP window in megabytes" `
    "The maximum length of a URL" 1 `
    "MSS specifies the data payload limit: Standard MTU (1500) minus IPv4 header (20) minus TCP header (20) leaves 1460 bytes."

Add-Q 28 5 "Medium" "What does the SQL command 'TRUNCATE TABLE employees;' do differently from 'DELETE FROM employees;'?" `
    "TRUNCATE deletes specific rows; DELETE deletes all" `
    "TRUNCATE is a DDL operation that drops and recreates table pages with minimal logging; DELETE is DML that logs individual row deletions and supports ROLLBACK" `
    "TRUNCATE requires a WHERE clause" `
    "DELETE resets auto-increment counters" 1 `
    "TRUNCATE deallocates data pages directly, making it much faster than DELETE which evaluates and logs row-by-row deletions."

Add-Q 28 6 "Hard" "What is the time complexity to find the diameter of a binary tree in a single postorder pass?" `
    "O(N^2)" `
    "O(N) visiting each node once and calculating height" `
    "O(log N)" `
    "O(2^N)" 1 `
    "Postorder DFS computes left and right subtree heights simultaneously updating global diameter = max(diameter, left_h + right_h) in O(N) time."

Add-Q 28 7 "Medium" "What is the primary role of a Database Index?" `
    "To encrypt table data" `
    "To speed up data retrieval (SELECT) operations at the cost of additional storage and slower write operations" `
    "To enforce foreign key constraints" `
    "To compress CSV files" 1 `
    "An index is a lookup data structure (e.g. B+ Tree) that enables rapid location of rows without scanning every row in the table."

Add-Q 28 8 "Hard" "In operating systems, what is the Difference between Paging and Segmentation?" `
    "Paging uses fixed-size memory blocks; Segmentation divides memory into variable-sized logical blocks reflecting user program structure" `
    "Segmentation is implemented in hardware only; paging in software only" `
    "Paging causes external fragmentation; segmentation does not" `
    "There is no difference" 0 `
    "Paging divides physical memory into uniform fixed frames (eliminating external fragmentation). Segmentation divides memory into variable-sized logical segments."

Add-Q 28 9 "Medium" "Which HTTP status code signifies that a requested resource was not found on the server?" `
    "200 OK" `
    "404 Not Found" `
    "500 Internal Server Error" `
    "301 Moved Permanently" 1 `
    "HTTP 404 indicates that the client was able to communicate with the server, but the requested URI path does not exist."

Add-Q 28 10 "Hard" "In an LRU Cache of capacity C, what is the time complexity of both get() and put() operations?" `
    "O(log C)" `
    "O(1) constant time" `
    "O(C)" `
    "O(C^2)" 1 `
    "By combining a Hash Map for O(1) key lookups with a Doubly Linked List for O(1) node additions and removals, both get and put run in strict O(1) time."

Add-Q 28 11 "Medium" "What is the purpose of the 'break' statement inside a loop in programming?" `
    "Skips the current iteration and advances to next" `
    "Terminates the loop immediately and transfers execution control to the statement following the loop" `
    "Restarts the loop from index 0" `
    "Halts the operating system" 1 `
    "break causes immediate termination of the innermost enclosing switch or loop statement."

Add-Q 28 12 "Hard" "What is the difference between Optimistic Locking and Pessimistic Locking?" `
    "Pessimistic assumes conflicts are frequent and locks data on read; Optimistic assumes conflicts are rare, detects version changes at commit, and aborts if conflicted" `
    "Optimistic locking requires hardware locks" `
    "Pessimistic locking is used only for NoSQL" `
    "Optimistic locking causes deadlocks" 0 `
    "Pessimistic locking locks rows upfront (SELECT ... FOR UPDATE). Optimistic locking uses version columns, validating without locks until update time."

Add-Q 28 13 "Medium" "What is a Race Condition in multithreaded programming?" `
    "When two threads run on different CPUs" `
    "An undesirable situation where the output or state of a program depends on the non-deterministic execution sequence or timing of concurrent threads" `
    "When a thread completes faster than expected" `
    "When memory leaks occur in a loop" 1 `
    "Race conditions occur when concurrent threads access shared mutable data without proper synchronization, corrupting data integrity."

Add-Q 28 14 "Hard" "In computer networking, what is the Purpose of the Subnet Broadcast Address?" `
    "To send packets to all routers on the internet" `
    "To send a single packet to every host on that specific local IP subnetwork simultaneously (e.g. host bits all 1s)" `
    "To resolve domain names" `
    "To assign dynamic IP addresses" 1 `
    "The broadcast address (all host bits set to 1) delivers packets to all listening interfaces within that local subnet."

Add-Q 28 15 "Medium" "What is the worst-case time complexity of QuickSort?" `
    "O(N log N)" `
    "O(N^2) when the pivot chosen is consistently the smallest or largest element (e.g. sorted array with first element as pivot)" `
    "O(N)" `
    "O(2^N)" 1 `
    "Unbalanced partitions (size 0 and N-1) cause recursion depth N, resulting in O(N^2) worst-case time."

Add-Q 28 16 "Hard" "In relational algebra, what does the Projection (pi) operator do?" `
    "Filters rows based on a predicate condition" `
    "Selects a specific subset of COLUMNS (attributes) from a relation, eliminating duplicates" `
    "Joins two tables on a foreign key" `
    "Sorts the table descending" 1 `
    "Projection (pi) extracts specified columns vertically from a table, whereas Selection (sigma) filters rows horizontally."

Add-Q 28 17 "Medium" "Which layer of the OSI model handles logical IP addressing and packet routing across networks?" `
    "Data Link Layer" `
    "Network Layer (Layer 3)" `
    "Transport Layer" `
    "Physical Layer" 1 `
    "The Network Layer handles logical IP addressing, routing tables, and forwarding packets between distinct networks."

Add-Q 28 18 "Hard" "What is the purpose of the 'volatile' keyword in C / C++ when dealing with memory-mapped hardware registers?" `
    "To make the code thread-safe" `
    "To instruct the compiler NOT to optimize reads/writes away into CPU registers, ensuring every read/write accesses actual hardware memory directly" `
    "To encrypt the variable" `
    "To allocate memory on the heap" 1 `
    "In C/C++, volatile prevents compiler optimizations like caching values in CPU registers, ensuring hardware I/O updates are read from memory."

Add-Q 28 19 "Medium" "In an SQL query, which keyword sorts results in ascending order by default?" `
    "DESC" `
    "ASC (or omitted ORDER BY default)" `
    "TOP" `
    "SORT" 1 `
    "ORDER BY column_name sorts ascending (ASC) by default unless DESC is explicitly appended."

Add-Q 28 20 "Hard" "In Dijkstra's algorithm, why do we skip an extracted node if its popped distance is greater than the recorded distance (d > dist[u])?" `
    "Because the node is unvisited" `
    "Because a shorter path to that node was already settled in a previous iteration; processing it again would be redundant and waste CPU cycles" `
    "Because distances cannot be negative" `
    "To prevent infinite loops" 1 `
    "Standard priority queues do not support decrease-key directly. When duplicate entries exist in the queue, skipping stale entries avoids unnecessary edge relaxations."

Add-Q 28 21 "Medium" "What is a Foreign Key constraint designed to enforce?" `
    "Data compression" `
    "Referential Integrity between two related tables" `
    "User authentication" `
    "Primary key uniqueness" 1 `
    "Referential integrity ensures that relationships between tables remain consistent and child records cannot reference non-existent parent rows."

Add-Q 28 22 "Hard" "In Linux process management, what signal does 'kill -9 <PID>' send to a process?" `
    "SIGINT (graceful interrupt)" `
    "SIGKILL (immediate termination by kernel; cannot be caught, blocked, or ignored by the process)" `
    "SIGTERM (termination request)" `
    "SIGHUP (hangup)" 1 `
    "SIGKILL (signal 9) forcibly aborts the process immediately at the kernel level without giving the process a chance to run cleanup code."

Add-Q 28 23 "Medium" "What is the result of '10 % 3' in integer arithmetic?" `
    "3" `
    "1" `
    "0" `
    "0.33" 1 `
    "The modulo operator (%) returns the integer remainder after division: 10 divided by 3 is 3 with remainder 1."

Add-Q 28 24 "Hard" "What is a Distributed Consensus algorithm (e.g. Raft, Paxos) designed to achieve?" `
    "Fast database indexing" `
    "Ensuring multiple independent machines agree on a common state or log of events even when some nodes crash or network messages are delayed" `
    "Compressing network traffic" `
    "Encrypting SSL certificates" 1 `
    "Raft and Paxos solve consensus in distributed systems, guaranteeing log replication and leader election as long as a quorum (majority) of nodes are operational."

Add-Q 28 25 "Medium" "What is the Big-O time complexity of inserting a node at the beginning (head) of a Singly Linked List?" `
    "O(N)" `
    "O(1)" `
    "O(log N)" `
    "O(N^2)" 1 `
    "Prepending to a linked list simply rewires newNode.next = head; head = newNode, executing in constant O(1) time."

# ==================== DAY 29: Full 45-Min Mock Interview Round 2 ====================
Add-Q 29 1 "Medium" "What is the difference between a Compiler and an Interpreter?" `
    "Compilers run code line by line; interpreters compile to machine code" `
    "A compiler translates entire source code into native machine code before execution; an interpreter translates and executes source code line by line at runtime" `
    "There is no difference" `
    "Interpreters can only run C++" 1 `
    "Compilers generate a standalone binary ahead of time. Interpreters execute code directly from source or intermediate bytecode on the fly."

Add-Q 29 2 "Hard" "In Distributed Systems, what does the 'Two-Phase Commit' (2PC) protocol achieve across multiple databases?" `
    "Double speed data replication" `
    "Atomic distributed transactions: Phase 1 (Prepare/Vote: all nodes check readiness), Phase 2 (Commit/Abort: coordinator issues global commit if all voted yes)" `
    "Two backups of every table" `
    "Compressing transactions twice" 1 `
    "2PC guarantees distributed atomicity across distinct databases: either all nodes commit the transaction or all abort if any single node votes no."

Add-Q 29 3 "Medium" "What is a Mutex (Mutual Exclusion lock) used for?" `
    "To speed up thread execution" `
    "To prevent multiple threads from concurrently accessing a shared critical section resource" `
    "To terminate background processes" `
    "To allocate virtual memory" 1 `
    "A mutex grants exclusive access to a single thread at a time, enforcing serial entry into the critical section."

Add-Q 29 4 "Hard" "What is the difference between a Hard Link and a Soft Link (Symbolic Link) in Linux filesystems?" `
    "Hard links are for folders; soft links for files" `
    "A Hard Link points directly to the inode of the file on disk; a Soft Link is a separate pointer file containing the pathname of the target file" `
    "Hard links cannot be deleted" `
    "Soft links use more RAM" 1 `
    "Hard links share the same inode (file data persists until all hard links are deleted). Soft links point to file paths; deleting the target creates a broken dangling link."

Add-Q 29 5 "Medium" "Which SQL keyword combines the results of two queries and removes duplicate records?" `
    "JOIN" `
    "UNION" `
    "INTERSECT" `
    "MERGE" 1 `
    "UNION combines two compatible result sets and removes duplicates (unlike UNION ALL which keeps duplicates)."

Add-Q 29 6 "Hard" "In Dynamic Programming, what is the Matrix Chain Multiplication recurrence relation for split point k?" `
    "dp[i][j] = dp[i][k] * dp[k+1][j]" `
    "dp[i][j] = min(dp[i][j], dp[i][k] + dp[k+1][j] + p[i-1] * p[k] * p[j]) for i <= k < j" `
    "dp[i][j] = dp[i-1][j-1] + 1" `
    "dp[i][j] = p[i] + p[j]" 1 `
    "The recurrence evaluates splitting the chain into two matrices: multiplying chain A_i..A_k and A_{k+1}..A_j, plus the cost to multiply the two resulting matrices: p[i-1]*p[k]*p[j]."

Add-Q 29 7 "Medium" "What is the primary difference between a Stack and a Queue?" `
    "Stack is FIFO; Queue is LIFO" `
    "Stack is LIFO (Last-In, First-Out); Queue is FIFO (First-In, First-Out)" `
    "Stack is dynamic; Queue is fixed" `
    "There is no difference" 1 `
    "Stacks add and remove from the top (LIFO). Queues add to the back and remove from the front (FIFO)."

Add-Q 29 8 "Hard" "What is the difference between Symmetric Multiprocessing (SMP) and Asymmetric Multiprocessing (AMP)?" `
    "SMP uses SSDs; AMP uses HDDs" `
    "In SMP, all CPUs share memory and execute identical OS kernel tasks peer-to-peer; in AMP, a master CPU controls the system and assigns specific tasks to subordinate CPUs" `
    "SMP is single core; AMP is multicore" `
    "AMP cannot run user programs" 1 `
    "SMP treats all processors equally, running OS tasks across any available core. AMP divides duties hierarchically with designated master/worker processors."

Add-Q 29 9 "Medium" "What is DNS propagation delay?" `
    "Time taken to reboot a DNS server" `
    "The time it takes for DNS record updates to reflect across all worldwide recursive resolvers due to cached TTL values" `
    "Speed of fiber optic light" `
    "Delay in browser rendering" 1 `
    "When a DNS record is modified, intermediate resolvers retain the old record until its Time-To-Live (TTL) counter expires."

Add-Q 29 10 "Hard" "In Object-Oriented Design, what is the Dependency Inversion Principle (DIP)?" `
    "Classes should depend on concrete implementations" `
    "High-level modules should not depend on low-level modules; both should depend on abstractions (interfaces)" `
    "Subclasses should override all methods" `
    "Constructors should be private" 1 `
    "DIP decouples architecture: business logic relies on abstract interfaces rather than concrete details, making modules swappable and testable."

Add-Q 29 11 "Medium" "What is an Inorder traversal sequence of the tree with root 2, left child 1, and right child 3?" `
    "2, 1, 3" `
    "1, 2, 3" `
    "3, 2, 1" `
    "1, 3, 2" 1 `
    "Inorder visits Left (1), Root (2), then Right (3), producing 1, 2, 3."

Add-Q 29 12 "Hard" "What is the purpose of the 'Content-Security-Policy' (CSP) HTTP response header?" `
    "To compress images" `
    "To restrict where resources (scripts, styles, images) can be loaded from, mitigating Cross-Site Scripting (XSS) attacks" `
    "To encrypt database passwords" `
    "To speed up browser rendering" 1 `
    "CSP restricts trusted domains for executable scripts, preventing unauthorized inline scripts or malicious external script injection (XSS)."

Add-Q 29 13 "Medium" "What is an SQL Injection attack?" `
    "Injecting viruses into database RAM" `
    "A security vulnerability where malicious SQL commands are inserted into user input fields, executing unauthorized commands in the database" `
    "Overheating database servers" `
    "Deleting database backups" 1 `
    "Unsanitized user inputs concatenated into raw SQL strings allow attackers to alter query logic. Parameterized Prepared Statements prevent this."

Add-Q 29 14 "Hard" "In Operating Systems, what is the difference between a Microkernel and a Monolithic Kernel?" `
    "Microkernels are written in Python; Monolithic in C" `
    "Monolithic kernels run all OS services (file systems, drivers, networking) in privileged kernel space; Microkernels keep only bare essentials in kernel space and run drivers/filesystems in user space" `
    "Monolithic kernels are slower for all tasks" `
    "Microkernels cannot run multithreaded apps" 1 `
    "Monolithic (Linux) is fast but a driver crash can crash the system. Microkernel (Mach, QNX) provides modular isolation and stability at the cost of IPC context-switch overhead."

Add-Q 29 15 "Medium" "What is the time complexity to search an element in a Hash Table with good hash distribution?" `
    "O(N)" `
    "O(1) average time" `
    "O(log N)" `
    "O(N log N)" 1 `
    "A well-distributed hash function places keys into buckets uniformly, resolving lookups in constant O(1) average time."

Add-Q 29 16 "Hard" "In Computer Networks, what is TCP Head-of-Line (HoL) Blocking?" `
    "When a router overheats" `
    "When a single lost packet in a TCP byte stream halts delivery of all subsequent packets in the buffer until the lost packet is retransmitted and acknowledged" `
    "When DNS servers drop requests" `
    "When HTTP headers are too large" 1 `
    "TCP enforces in-order byte stream delivery. If packet 2 is lost, packets 3, 4, 5 cannot be passed to the application until packet 2 is retransmitted."

Add-Q 29 17 "Medium" "What is the purpose of the 'finally' block in Java / C# exception handling?" `
    "Executes only if an exception is caught" `
    "Executes unconditionally whether an exception was thrown, caught, or not thrown, typically used for resource cleanup" `
    "Executes only if no exception occurred" `
    "Terminates the program" 1 `
    "The finally block always executes, ensuring critical resources (file handles, database connections) are closed."

Add-Q 29 18 "Hard" "What is a Distributed Denial of Service (DDoS) Amplification attack (e.g. NTP or DNS Amplification)?" `
    "Attacking servers with large files" `
    "Spoofing the victim's IP address and sending small requests to public servers that respond with massive payloads, overwhelming the victim's network bandwidth" `
    "Compacting server databases" `
    "Cracking passwords using GPUs" 1 `
    "Attackers send UDP requests with victim's source IP to open resolvers (e.g. DNS ANY query). The resolver replies with a 50x larger response directed at the victim."

Add-Q 29 19 "Medium" "What is the space complexity of an adjacency matrix representation of a graph with V vertices?" `
    "O(V)" `
    "O(V^2)" `
    "O(V + E)" `
    "O(E)" 1 `
    "A 2D V x V matrix allocates storage for all vertex pairs, requiring O(V^2) space."

Add-Q 29 20 "Hard" "What is the CAP theorem classification of Apache Cassandra versus Apache HBase?" `
    "Cassandra is CP; HBase is AP" `
    "Cassandra is AP (prioritizes Availability and Partition Tolerance with eventual consistency); HBase is CP (prioritizes Consistency and Partition Tolerance)" `
    "Both are strictly CA systems" `
    "Neither supports distributed data" 1 `
    "Cassandra uses masterless peer-to-peer ring architecture (AP). HBase uses master-based region servers with ZooKeeper coordination enforcing strict consistency (CP)."

Add-Q 29 21 "Medium" "Which algorithm is used to find the shortest path in an unweighted graph?" `
    "Depth-First Search (DFS)" `
    "Breadth-First Search (BFS)" `
    "Kruskal's algorithm" `
    "Bellman-Ford algorithm" 1 `
    "BFS explores vertices in order of edge distance from source, guaranteeing the shortest path in unweighted graphs."

Add-Q 29 22 "Hard" "What is the Raft Consensus protocol leader election split-vote problem and how is it resolved?" `
    "By human administrator intervention" `
    "Using randomized election timeouts (e.g. 150ms-300ms) for each candidate node so one candidate times out and starts an election before others, avoiding split votes" `
    "By electing the node with smallest IP" `
    "By restarting the entire cluster" 1 `
    "Randomizing election timeouts breaks symmetry: one candidate times out first, requests votes from peers, and wins a majority before rival candidates time out."

Add-Q 29 23 "Medium" "What is an API Gateway in microservices architecture?" `
    "A physical router" `
    "A single entry point for all client requests, handling routing, composition, authentication, rate limiting, and SSL termination" `
    "A database server" `
    "A client-side browser plugin" 1 `
    "An API Gateway abstracts microservices behind a unified interface, decoupling client applications from internal service topographies."

Add-Q 29 24 "Hard" "What is the Difference between Optimistic Concurrency Control and Pessimistic Concurrency Control in database updates?" `
    "Optimistic uses version numbers without locking; Pessimistic acquires locks upfront" `
    "Pessimistic uses no locks" `
    "Optimistic locking is only for reads" `
    "There is no difference" 0 `
    "Optimistic concurrency control assumes low conflict rates, verifying version matches at commit time. Pessimistic concurrency control locks rows to prevent conflicts."

Add-Q 29 25 "Medium" "What is the primary benefit of Continuous Integration (CI) in software development?" `
    "Eliminates the need for code reviews" `
    "Automatically builds and tests code on every commit, catching integration bugs early before they reach production" `
    "Compiles code faster on developer laptops" `
    "Automatically pays cloud bills" 1 `
    "CI pipelines automate build and test verification on every code merge, ensuring code quality and rapid bug detection."

# ==================== DAY 30: Final Placement Readiness Audit ====================
Add-Q 30 1 "Medium" "What does the Single Responsibility Principle (SRP) in SOLID software design state?" `
    "A function should take only 1 parameter" `
    "A class should have one, and only one, reason to change (it should have only one responsibility)" `
    "A project should have only one developer" `
    "All classes must be declared final" 1 `
    "SRP states that each software module or class should be responsible for a single aspect of functionality, reducing coupling and making maintenance easier."

Add-Q 30 2 "Hard" "According to the Master Theorem for divide-and-conquer recurrences T(n) = a*T(n/b) + f(n), what is the time complexity when f(n) = O(n^(log_b(a) - epsilon))?" `
    "Theta(n log n)" `
    "Theta(n^(log_b a)) (Case 1: tree leaves dominate computation)" `
    "Theta(f(n))" `
    "Theta(n^2)" 1 `
    "Case 1 of the Master Theorem applies when the recursive work at the leaves n^(log_b a) grows polynomially faster than the non-recursive work f(n), making total complexity Theta(n^(log_b a))."

Add-Q 30 3 "Medium" "What is the Difference between Unit Testing and Integration Testing?" `
    "Unit testing tests the database; integration testing tests functions" `
    "Unit testing tests individual isolated components or functions in isolation (often with mocks); Integration testing verifies interactions between integrated modules or external services" `
    "Unit testing is performed in production only" `
    "There is no difference" 1 `
    "Unit tests verify individual functions with mocked dependencies. Integration tests verify combined subsystem interactions (e.g. API communicating with database)."

Add-Q 30 4 "Hard" "What is Canary Deployment in modern cloud release management?" `
    "Deploying code on yellow servers" `
    "Rolling out a new software release to a tiny subset of real production users (e.g. 2-5%) first, monitoring telemetry and error rates before full deployment" `
    "Testing code on staging environments only" `
    "Reverting all changes every 24 hours" 1 `
    "Canary deployments expose updates to a small fraction of live traffic. If error rates or latency metrics degrade, traffic rolls back instantly with minimal customer impact."

Add-Q 30 5 "Medium" "What is the DRY principle in software engineering?" `
    "Do Rely on Yourself" `
    "Don't Repeat Yourself: avoid code duplication by abstracting common logic into reusable functions or modules" `
    "Delete Redundant Yields" `
    "Deploy Right Yesterday" 1 `
    "The DRY principle reduces duplication across code and systems, ensuring that every piece of domain knowledge has a single, authoritative representation."

Add-Q 30 6 "Hard" "What is the Difference between REST and GraphQL APIs regarding data fetching?" `
    "GraphQL only works on mobile devices" `
    "REST endpoints return fixed predefined schemas (often causing over-fetching or under-fetching); GraphQL allows clients to request exactly the fields they need in a single round-trip" `
    "REST uses UDP; GraphQL uses TCP" `
    "GraphQL does not support authentication" 1 `
    "REST APIs require multiple endpoint calls or return fixed payloads. GraphQL provides a declarative query language where clients specify precise data requirements."

Add-Q 30 7 "Medium" "What is a Memory Leak in software applications?" `
    "Physical RAM dropping on the floor" `
    "Allocated memory that is no longer needed by the program but fails to be released or reclaimed, causing total memory consumption to grow until the program crashes" `
    "Compressing files in memory" `
    "CPU running at 100% capacity" 1 `
    "Memory leaks occur when references to unused allocations are unintentionally retained, eventually exhausting system RAM and triggering OutOfMemory errors."

Add-Q 30 8 "Hard" "In Docker containerization, how do Linux cgroups (Control Groups) and Namespaces provide isolation?" `
    "By running separate virtual hardware BIOS instances" `
    "Namespaces isolate what a process can SEE (Process IDs, Mounts, Network); cgroups limit what a process can USE (CPU cores, RAM limits, Disk I/O)" `
    "By encrypting the Linux kernel" `
    "cgroups and namespaces are deprecated" 1 `
    "Containers are lightweight processes isolated by Linux kernel features: Namespaces provide virtualized views (isolated PIDs and networks), while cgroups enforce resource consumption limits."

Add-Q 30 9 "Medium" "What is the KISS principle in software architecture?" `
    "Keep It Simple, Stupid: systems work best when kept simple rather than made unnecessarily complex" `
    "Keep Interfaces Strictly Synchronous" `
    "Key Index Storage System" `
    "Kernel Instruction Set Standard" 0 `
    "KISS advises against over-engineering: prioritize simple, readable, and maintainable designs over convoluted abstractions."

Add-Q 30 10 "Hard" "What is the Difference between Latency and Throughput in computer systems?" `
    "Latency is measured in gigabytes; Throughput in milliseconds" `
    "Latency is the time delay taken to complete a single operation (measured in ms); Throughput is the total volume of operations completed per unit time (requests/sec)" `
    "They are interchangeable terms" `
    "Latency is for disks; throughput is for networks" 1 `
    "Latency measures delay (how long an individual request takes). Throughput measures capacity and rate (how many requests the system processes per second)."

Add-Q 30 11 "Medium" "What is the YAGNI principle in Agile software engineering?" `
    "You Are Getting New Infrastructure" `
    "You Aren't Gonna Need It: do not build features or abstractions until they are actually necessary" `
    "Yield All Global Network Inputs" `
    "Yet Another Gateway Network Interface" 1 `
    "YAGNI discourages premature optimization and building speculative features that may never be utilized."

Add-Q 30 12 "Hard" "What is Amortized Analysis in algorithmic complexity?" `
    "Estimating the monetary cost of running servers" `
    "Averaging the time taken per operation over a sequence of operations, guaranteeing that the average cost is low even if occasional individual operations are expensive (e.g. dynamic array resizing)" `
    "Calculating worst-case single operations" `
    "Measuring CPU clock frequency" 1 `
    "Amortized analysis shows that expensive operations (like doubling array capacity) happen infrequently enough that the average cost per operation remains constant O(1)."

Add-Q 30 13 "Medium" "What does the Open/Closed Principle (OCP) in SOLID design state?" `
    "Classes should be open for modification and closed for extension" `
    "Software entities should be open for extension, but closed for modification" `
    "All software must be open source" `
    "Database connections should remain open" 1 `
    "OCP promotes extending behavior by adding new subclasses or strategies rather than editing tested, existing source code."

Add-Q 30 14 "Hard" "In Production Incident Management, what is Mean Time to Recovery (MTTR)?" `
    "Average time to reboot a laptop" `
    "The average time taken to detect, diagnose, fix, and restore normal service operation after an unplanned production outage occurs" `
    "The time between scheduled deployments" `
    "Average time to train a new engineer" 1 `
    "MTTR is a core DevOps and reliability metric: minimizing MTTR via automated alerts, runbooks, and rollbacks limits business downtime."

Add-Q 30 15 "Medium" "What is the Difference between Synchronous and Asynchronous execution?" `
    "Synchronous runs in parallel; Asynchronous runs sequentially" `
    "Synchronous execution blocks the calling thread until the operation finishes; Asynchronous execution executes in the background without blocking the caller" `
    "Synchronous is used only on servers" `
    "There is no difference" 1 `
    "Synchronous calls block execution flow until completion. Asynchronous calls return immediately, delivering results via callbacks, promises, or events."

Add-Q 30 16 "Hard" "What is the Circuit Breaker pattern in microservices communication?" `
    "A physical fuse on a power strip" `
    "A software pattern that monitors calls to external services; if errors exceed a threshold, it trips 'Open' to fail fast without overloading the failing service, transitioning to 'Half-Open' to test recovery" `
    "A tool for breaking encryption keys" `
    "A firewall rule" 1 `
    "Circuit breakers prevent cascading outages: instead of hanging on timeouts to a struggling downstream service, it fails fast immediately and periodically tests if the service has recovered."

Add-Q 30 17 "Medium" "What is Mocking in software unit testing?" `
    "Insulting bad code" `
    "Creating simulated replacement objects that mimic the behavior of complex real dependencies (e.g. database, network APIs) in controlled ways for testing" `
    "Running code in production" `
    "Compiling without tests" 1 `
    "Mock objects simulate external systems, allowing fast, isolated, deterministic unit tests without requiring live databases or network services."

Add-Q 30 18 "Hard" "What is Database Sharding Rebalancing and why is it complex?" `
    "Rebooting shards simultaneously" `
    "Migrating data partitions across nodes when adding new database shards without causing downtime or violating data consistency" `
    "Compressing shard indexes" `
    "Converting SQL to NoSQL" 1 `
    "Adding nodes to a sharded cluster requires redistributing data chunks. Maintaining live read/write traffic during heavy partition migrations demands careful locking and catch-up replication."

Add-Q 30 19 "Medium" "What is the Interface Segregation Principle (ISP) in SOLID design?" `
    "All interfaces must have exactly one method" `
    "Clients should not be forced to depend on interfaces they do not use (prefer many small, specific interfaces over one bloated general-purpose interface)" `
    "Interfaces cannot inherit other interfaces" `
    "Interfaces should be private" 1 `
    "ISP prevents 'fat' interfaces: breaking interfaces into cohesive smaller contracts prevents implementing classes from carrying dummy or unsupported method stubs."

Add-Q 30 20 "Hard" "What is the Purpose of Chaos Engineering (e.g. Chaos Monkey)?" `
    "Creating random bugs in source code" `
    "Intentionally injecting failures (terminating servers, introducing latency) into production or staging systems to verify resiliency and discover architectural weaknesses before outages occur" `
    "Deleting database backups" `
    "Testing without automated monitoring" 1 `
    "Pioneered by Netflix: testing system resilience under deliberate, controlled failures builds confidence that the distributed system will survive unpredictable outages."

Add-Q 30 21 "Medium" "What is the Difference between Authentication and Authorization?" `
    "They are identical terms" `
    "Authentication verifies WHO you are (identity verification); Authorization determines WHAT you are allowed to access (permissions/privileges)" `
    "Authentication is for databases; authorization for networks" `
    "Authorization happens before authentication" 1 `
    "Authentication checks credentials (e.g. login with password/2FA). Authorization evaluates roles and permissions to grant or deny access to resources."

Add-Q 30 22 "Hard" "What is Blue-Green Deployment in release engineering?" `
    "Deploying code on blue and green monitors" `
    "Maintaining two identical production environments (Blue is active live, Green is idle staging); deploy new version to Green, test, and instantly switch the router/load balancer to Green" `
    "Deploying only on weekends" `
    "Testing code in user browsers" 1 `
    "Blue-Green deployments eliminate downtime: traffic switches instantaneously at the router level. If unexpected bugs surface, traffic routes back to the unmodified Blue environment immediately."

Add-Q 30 23 "Medium" "What is Code Profiling in performance optimization?" `
    "Formatting code with linters" `
    "Measuring the dynamic execution behavior of a program (CPU cycle consumption, memory allocations, method execution times) to identify performance bottlenecks" `
    "Checking git commit history" `
    "Printing debug logs to console" 1 `
    "Profilers analyze running programs to pinpoint functions consuming disproportionate CPU time or allocating excessive memory, guiding targeted optimizations."

Add-Q 30 24 "Hard" "What is the Difference between Monolithic Architecture and Microservices Architecture in terms of operational complexity?" `
    "Monoliths require more servers than microservices" `
    "Monoliths have simple deployments and low operational overhead but tight coupling; Microservices offer independent scalability and deployment flexibility but introduce high distributed networking, tracing, and operational complexity" `
    "Microservices eliminate all bugs" `
    "There is no difference" 1 `
    "Monoliths are straightforward to develop, debug, and deploy initially. Microservices decouple team deployments but demand robust distributed tracing, service discovery, and network resilience."

Add-Q 30 25 "Medium" "What is the most effective approach to solving a coding interview problem within a 45-minute technical round?" `
    "Start writing code immediately without speaking" `
    "1. Clarify constraints and edge cases -> 2. Explain high-level approach & trade-offs -> 3. Agree on approach with interviewer -> 4. Write clean, modular code -> 5. Dry run with test cases" `
    "Memorize code and type as fast as possible" `
    "Ask the interviewer to write the code" 1 `
    "Top placement candidates follow a structured methodology: clarifying requirements, communicating algorithmic trade-offs, getting alignment, writing clean code, and proactively dry-running test cases."

Write-Output "Days 26 to 30 loaded."
