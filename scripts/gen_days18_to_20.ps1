# Generator for Days 18 to 20 (75 Unique Questions)

# ==================== DAY 18: Dynamic Programming - 2D & Grid DP ====================
Add-Q 18 1 "Medium" "In 'Unique Paths' on an M x N grid (moving only right or down), what is the DP state transition relation?" `
    "dp[i][j] = dp[i-1][j-1] + 1" `
    "dp[i][j] = dp[i - 1][j] + dp[i][j - 1] with base cases dp[0][c] = 1 and dp[r][0] = 1" `
    "dp[i][j] = min(dp[i - 1][j], dp[i][j - 1])" `
    "dp[i][j] = i * j" 1 `
    "To reach cell (i, j), you can only arrive from the cell directly above (i-1, j) or the cell directly to the left (i, j-1). Summing the paths from both neighbors gives dp[i][j]."

Add-Q 18 2 "Hard" "In the 0/1 Knapsack problem (capacity W, weights wt[], values val[]), why must the 1D space-optimized array iterate capacity backwards from W down to wt[i]?" `
    "To reverse the order of items" `
    "To ensure that each item is used at most ONCE, preventing values updated in the current iteration from overwriting subproblems of the same item" `
    "Because arrays can only be traversed backward in C++" `
    "To prevent integer underflow" 1 `
    "In 0/1 knapsack, each item is taken at most once. Traversing capacity backward guarantees that dp[w - wt[i]] represents the state from the PREVIOUS item, preventing the current item from being counted multiple times."

Add-Q 18 3 "Medium" "In 'Minimum Path Sum' on an M x N grid with non-negative numbers, what is the recurrence relation?" `
    "dp[i][j] = grid[i][j] + min(dp[i - 1][j], dp[i][j - 1])" `
    "dp[i][j] = grid[i][j] + max(dp[i - 1][j], dp[i][j - 1])" `
    "dp[i][j] = dp[i - 1][j] * dp[i][j - 1]" `
    "dp[i][j] = sum(grid[0..i][0..j])" 0 `
    "To minimize the path sum reaching cell (i, j), add the cost of grid[i][j] to the minimum cost of arriving from either the cell above (i-1, j) or the cell to the left (i, j-1)."

Add-Q 18 4 "Hard" "In 'Longest Common Subsequence' (LCS) of strings s1 (length M) and s2 (length N), what are the transitions for dp[i][j]?" `
    "If s1[i-1] == s2[j-1]: dp[i][j] = 1 + dp[i-1][j-1]; Else: dp[i][j] = max(dp[i-1][j], dp[i][j-1])" `
    "dp[i][j] = dp[i-1][j-1] + dp[i-1][j]" `
    "If match: dp[i][j] = dp[i-1][j]; Else: 0" `
    "dp[i][j] = max(i, j)" 0 `
    "If the characters match, they extend the LCS by 1 from the subproblem excluding both characters (dp[i-1][j-1]). Otherwise, take the maximum obtained by excluding s1[i-1] or s2[j-1]."

Add-Q 18 5 "Medium" "In 'Edit Distance' (convert word1 to word2 with insert, delete, replace), what is the cost transition when word1[i-1] != word2[j-1]?" `
    "dp[i][j] = dp[i-1][j-1] + 2" `
    "dp[i][j] = 1 + min(dp[i-1][j] (delete), dp[i][j-1] (insert), dp[i-1][j-1] (replace))" `
    "dp[i][j] = max(dp[i-1][j], dp[i][j-1])" `
    "dp[i][j] = 0" 1 `
    "When characters differ, we choose the operation requiring the fewest edits: delete from word1 (dp[i-1][j]), insert into word1 (dp[i][j-1]), or replace character (dp[i-1][j-1]), adding 1 for the operation."

Add-Q 18 6 "Hard" "In 'Dungeon Game' (knight rescuing princess in bottom-right with positive/negative health points), why must DP be computed backwards from bottom-right to top-left?" `
    "Knight starts at the bottom-right" `
    "Because the knight's survival at cell (i, j) depends on the MINIMUM health required upon EXITING the cell into the next room, which is only known at subsequent cells" `
    "Top-left contains negative numbers" `
    "To save memory" 1 `
    "Moving forward, health accumulated depends on previous path choices. Moving backward: min health needed entering (i, j) is max(1, min(dp[i+1][j], dp[i][j+1]) - dungeon[i][j]), resolving requirements deterministically."

Add-Q 18 7 "Medium" "In 'Maximal Square' (largest square of all 1s in a binary matrix), what is the DP relation for square side length dp[i][j]?" `
    "dp[i][j] = 1 + max(dp[i-1][j], dp[i][j-1])" `
    "dp[i][j] = matrix[i][j] == '1' ? 1 + min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) : 0" `
    "dp[i][j] = dp[i-1][j-1] + 1" `
    "dp[i][j] = matrix[i][j] * 4" 1 `
    "A square of size S ending at (i, j) requires all three neighbors (top, left, and top-left diagonal) to support squares of at least size S - 1. Thus side length is 1 + min of the three neighbors."

Add-Q 18 8 "Hard" "In 'Burst Balloons' (interval DP: burst balloons to maximize coins), why does the DP subproblem iterate over the LAST balloon to burst in interval (i, j)?" `
    "Because bursting the first balloon divides the remaining balloons into independent subproblems" `
    "Bursting balloon k LAST ensures its adjacent boundaries are fixed at i and j throughout the entire subproblem, decoupling subproblems (i, k) and (k, j) cleanly" `
    "Balloons can only burst in reverse order" `
    "To prevent divide by zero" 1 `
    "If we pick the first balloon to burst, subproblems are coupled because balloons become adjacent across the split. Picking the LAST balloon to burst guarantees balloons i and j remain adjacent to k until the very end."

Add-Q 18 9 "Medium" "What is the difference between 0/1 Knapsack and Unbounded Knapsack?" `
    "0/1 Knapsack has no weight limit" `
    "In 0/1 Knapsack each item can be chosen at most once; in Unbounded Knapsack each item can be selected an unlimited number of times" `
    "Unbounded Knapsack requires fractional values" `
    "There is no difference" 1 `
    "In 0/1 Knapsack items are unique (0 or 1 choice). In Unbounded Knapsack (like Coin Change), each item denomination can be reused indefinitely, meaning the 1D DP capacity loop runs forward."

Add-Q 18 10 "Hard" "In 'Regular Expression Matching' (supporting '.' and '*'), how does the '*' wildcard transition in DP?" `
    "'*' matches any 10 characters" `
    "dp[i][j] = dp[i][j-2] (matching zero preceding elements) OR (match(s[i-1], p[j-2]) && dp[i-1][j]) (matching one or more preceding elements)" `
    "'*' simply matches '.' only" `
    "It converts to binary search" 1 `
    "A '*' can match zero occurrences of the preceding element (bypassing p[j-2..j-1] via dp[i][j-2]), or if the preceding element matches current character s[i-1], consume s[i-1] via dp[i-1][j]."

Add-Q 18 11 "Medium" "In 'Unique Paths II' (grid with obstacles represented by 1), what is the value of dp[i][j] for an obstacle cell?" `
    "-1" `
    "0 (zero paths can pass through an obstacle)" `
    "1" `
    "Infinity" 1 `
    "If obstacleGrid[i][j] == 1, no path can enter or pass through that cell, so its number of paths dp[i][j] is set to 0."

Add-Q 18 12 "Hard" "In 'Matrix Chain Multiplication' (MCM), what does dp[i][j] represent and what is its time complexity?" `
    "Maximum product of matrix diagonals" `
    "Minimum scalar multiplications needed to multiply chain of matrices A_i through A_j; computed in O(N^3) time by trying all split points k between i and j" `
    "Determinant of the matrix product" `
    "Eigenvalues in O(N^2)" 1 `
    "MCM finds optimal parenthesization: dp[i][j] = min_{i<=k<j}(dp[i][k] + dp[k+1][j] + d_{i-1}*d_k*d_j). Evaluating all intervals of length 2 to N takes O(N^3) time and O(N^2) space."

Add-Q 18 13 "Medium" "Can the Fractional Knapsack problem be solved using Dynamic Programming, and is DP necessary?" `
    "DP is mandatory because it is NP-complete" `
    "No; Fractional Knapsack exhibits greedy choice property and is solved optimally using a Greedy approach (sorting by value-to-weight ratio) in O(N log N)" `
    "Only if weights are integers" `
    "Fractional Knapsack cannot be solved" 1 `
    "Because items can be divided into fractions, taking as much of the highest value-per-unit-weight item as possible is provably optimal. Greedy sorting solves it in O(N log N) without needing DP."

Add-Q 18 14 "Hard" "In 'Interleaving String' (is s3 formed by interleaving s1 and s2?), what condition must hold before initializing DP?" `
    "s1 must be longer than s2" `
    "s1.length() + s2.length() must equal s3.length()" `
    "s1 and s2 must contain identical characters" `
    "s3 must be a palindrome" 1 `
    "An interleaving must preserve all characters from both s1 and s2. If the sum of their lengths does not match s3's length, it is impossible for s3 to be an interleaving."

Add-Q 18 15 "Medium" "What is the time complexity of the DP solution for Longest Common Subsequence of strings of length M and N?" `
    "O(M + N)" `
    "O(M * N)" `
    "O(2^(M+N))" `
    "O(M log N)" 1 `
    "A 2D table of dimensions (M + 1) x (N + 1) is populated, with each cell computed in O(1) time, yielding O(M * N) time and space."

Add-Q 18 16 "Hard" "In 'Distinct Subsequences' (number of distinct subsequences of s that equal t), what is the transition when s[i-1] == t[j-1]?" `
    "dp[i][j] = dp[i-1][j-1]" `
    "dp[i][j] = dp[i-1][j-1] (use s[i-1] to match) + dp[i-1][j] (skip s[i-1] and match elsewhere in s)" `
    "dp[i][j] = dp[i][j-1] * 2" `
    "dp[i][j] = dp[i-1][j] + 1" 1 `
    "When characters match, you can either match s[i-1] with t[j-1] (relying on dp[i-1][j-1] matches for the prefix) or skip s[i-1] entirely and find occurrences earlier in s (dp[i-1][j])."

Add-Q 18 17 "Medium" "How can space complexity of 'Unique Paths' or 'Minimum Path Sum' on an M x N grid be optimized from O(M * N) to O(N)?" `
    "By deleting rows after reading" `
    "By keeping only the previous row (or 1D array of size N updated in-place), since computing current row only requires current and directly previous row values" `
    "By dividing M by N" `
    "By converting the grid to a graph" 1 `
    "Each cell (i, j) only references values from the row above and the current row to the left. A single 1D array of length N updated in-place achieves O(N) space."

Add-Q 18 18 "Hard" "In 'Wildcard Matching' ('?' matches single char, '*' matches any sequence of chars), what is the DP transition for '*'?" `
    "dp[i][j] = dp[i-1][j-1]" `
    "dp[i][j] = dp[i][j-1] (matches empty sequence) || dp[i-1][j] (matches one or more characters)" `
    "dp[i][j] = dp[i-1][j] && dp[i][j-1]" `
    "Wildcard matching cannot be solved with DP" 1 `
    "If p[j-1] == '*', it can represent an empty sequence (dp[i][j-1]) or absorb current character s[i-1] and continue matching further characters (dp[i-1][j])."

Add-Q 18 19 "Medium" "In 'Target Sum' (assign + or - to nums to achieve target S), how is it transformed into the Subset Sum problem?" `
    "Multiply all numbers by S" `
    "Let P be positive subset and N be negative subset: P - N = S and P + N = Total. Adding yields 2*P = S + Total, so P = (S + Total) / 2" `
    "Sort nums descending" `
    "Replace all + with *" 1 `
    "Partitioning numbers into positive and negative sets reduces directly to finding a subset summing to (Target + TotalSum) / 2, solvable via 0/1 knapsack DP."

Add-Q 18 20 "Hard" "In 'Shortest Common Supersequence' (SCS) of strings s1 and s2, how does its length relate to LCS?" `
    "len(SCS) = len(s1) * len(s2) / len(LCS)" `
    "len(SCS) = len(s1) + len(s2) - len(LCS(s1, s2))" `
    "len(SCS) = len(LCS) * 2" `
    "len(SCS) = max(len(s1), len(s2))" 1 `
    "The shortest common supersequence includes characters from both strings, with the shared common characters (LCS) included only once, giving len(s1) + len(s2) - len(LCS)."

Add-Q 18 21 "Medium" "What is the optimal substructure in the 0/1 Knapsack problem for item i and capacity w?" `
    "dp[i][w] = dp[i-1][w] * val[i]" `
    "dp[i][w] = max(dp[i-1][w], dp[i-1][w - wt[i]] + val[i]) if wt[i] <= w, else dp[i-1][w]" `
    "dp[i][w] = val[i] / wt[i]" `
    "dp[i][w] = w - wt[i]" 1 `
    "For item i: either exclude it (value is dp[i-1][w]) or include it (value is dp[i-1][w - wt[i]] + val[i]). The optimal choice is the maximum of the two options."

Add-Q 18 22 "Hard" "In 'Cherry Pickup' (two agents moving from (0,0) to (N-1,N-1)), why does running two separate DP passes sequentially FAIL to find the global optimum?" `
    "Grid values are too small" `
    "Greedy decisions in the first pass can consume cherries needed by the second pass to reach an overall combined maximum" `
    "DP only works for single agents" `
    "Because agents cannot move right" 1 `
    "A greedy first pass blocks optimal team routes. The correct formulation moves both agents simultaneously in a single DP: state (r1, c1, r2) where steps = r1 + c1 = r2 + c2."

Add-Q 18 23 "Medium" "In an M x N grid DP problem, how many total subproblems are evaluated?" `
    "M + N" `
    "M * N" `
    "2^(M + N)" `
    "M!" 1 `
    "A grid DP fills an M x N matrix, meaning exactly M * N subproblems are stored and evaluated."

Add-Q 18 24 "Hard" "In 'Minimum Cost to Cut a Stick' (interval DP on cut points), what preprocessing makes interval subproblems clean?" `
    "Sort cut points and add boundaries 0 and stick_length N to the cuts array" `
    "Cut the stick in half at every step" `
    "Use a greedy priority queue" `
    "Remove duplicate cuts" 0 `
    "Appending 0 and N to the cuts array and sorting allows standard interval DP: dp[i][j] = (cuts[j] - cuts[i]) + min_{i < k < j}(dp[i][k] + dp[k][j]) in O(C^3) time."

Add-Q 18 25 "Medium" "What is the base case for Edit Distance when transforming an empty string into a string of length N?" `
    "0 operations" `
    "N operations (N insertions)" `
    "1 operation" `
    "Undefined" 1 `
    "Transforming an empty string into a target string of length N requires inserting each of the N characters, which costs exactly N operations."

# ==================== DAY 19: System Design - High Level Basics ====================
Add-Q 19 1 "Medium" "What is the primary architectural difference between Vertical Scaling (Scale Up) and Horizontal Scaling (Scale Out)?" `
    "Vertical adds more servers; Horizontal adds RAM" `
    "Vertical scaling upgrades CPU/RAM/Disk of an existing single machine; Horizontal scaling adds more server instances to distribute load across a pool" `
    "Vertical scaling is only for databases; horizontal for mobile apps" `
    "Horizontal scaling has a hard hardware ceiling; vertical is infinite" 1 `
    "Vertical scaling enhances a single machine's specs (bounded by hardware limits and single point of failure). Horizontal scaling scales out by provisioning multiple distributed node instances."

Add-Q 19 2 "Hard" "According to the CAP Theorem, in the presence of a Network Partition (P), which trade-off must a distributed system make?" `
    "Performance vs Security" `
    "Consistency (C) vs Availability (A)" `
    "Latency vs Throughput" `
    "Durability vs Atomicity" 1 `
    "When a network partition occurs, nodes cannot communicate. The system must either reject requests to preserve strict data consistency (CP) or accept writes/reads risking stale or divergent data to stay available (AP)."

Add-Q 19 3 "Medium" "What is the role of a Reverse Proxy (such as Nginx or HAProxy) in web architecture?" `
    "It caches web pages on client browsers" `
    "It sits in front of backend servers, routing client requests, terminating SSL/TLS, load balancing, and shielding internal server IPs" `
    "It assigns DHCP IP addresses to client laptops" `
    "It converts SQL queries into GraphQL" 1 `
    "A reverse proxy intercepts incoming internet traffic on behalf of private upstream servers, providing load distribution, SSL termination, caching, and security isolation."

Add-Q 19 4 "Hard" "In Consistent Hashing, how do 'Virtual Nodes' solve the problem of non-uniform data distribution (Hotspots)?" `
    "By adding more physical CPU cores" `
    "By mapping each physical server to multiple points across the 360-degree hash ring, balancing hash distribution across all nodes evenly" `
    "By encrypting the hash ring with RSA" `
    "By running round-robin DNS" 1 `
    "With few physical nodes, hash ring gaps cause unbalanced key distribution. Mapping each server to 100+ virtual node tokens uniformly blends server coverage around the ring, eliminating hotspots."

Add-Q 19 5 "Medium" "What is the Cache-Aside (Lazy Loading) caching pattern?" `
    "The cache is populated before application startup" `
    "Application queries cache first; on cache miss, it reads from database, populates cache, and returns data" `
    "All writes go exclusively to cache and never reach database" `
    "Database pushes updates to cache automatically" 1 `
    "In Cache-Aside, the application coordinates between cache and store: checks cache -> on miss, queries DB -> writes fetched data to cache with a TTL -> returns response to caller."

Add-Q 19 6 "Hard" "What is the 'Thundering Herd' (Cache Stampede) problem and how can it be mitigated?" `
    "Too many writes corrupting the cache" `
    "When a popular cached key expires, thousands of concurrent requests simultaneously miss the cache and overwhelm the underlying database; mitigated by mutex locking or probabilistic early refresh (XFetch)" `
    "Network packets colliding on an Ethernet hub" `
    "Cache servers running out of disk space" 1 `
    "When a hot key expires, massive simultaneous misses flood the database. Mitigations include distributed mutex locks (only one thread recomputes the key) or background refresh before expiry."

Add-Q 19 7 "Medium" "Which load balancing algorithm distributes incoming requests to servers in sequential circular order?" `
    "Least Connections" `
    "Round Robin" `
    "IP Hash" `
    "Weighted Response Time" 1 `
    "Round Robin passes incoming requests sequentially down a list of backend servers, looping back to the beginning once all servers have received a request."

Add-Q 19 8 "Hard" "What is the difference between Write-Through and Write-Back (Write-Behind) caching strategies?" `
    "Write-Through writes to disk first; Write-Back to RAM" `
    "Write-Through writes synchronously to cache AND database simultaneously; Write-Back writes to cache immediately and asynchronously flushes batches to database later" `
    "Write-Back cannot lose data on crash" `
    "Write-Through has lower write latency than Write-Back" 1 `
    "Write-Through guarantees consistency but suffers higher write latency. Write-Back provides ultra-fast write performance by acknowledging writes once in cache, but risks data loss if cache crashes before flushing to DB."

Add-Q 19 9 "Medium" "What does a Content Delivery Network (CDN) do?" `
    "Compiles backend source code" `
    "Caches static assets (images, CSS, JS, videos) on geographically distributed edge servers near end users to minimize latency" `
    "Encrypts database hard drives" `
    "Generates dynamic SQL queries" 1 `
    "CDNs store static assets at Point of Presence (PoP) edge locations worldwide, drastically cutting latency and offloading traffic from origin servers."

Add-Q 19 10 "Hard" "In database scaling, what is Database Sharding (Horizontal Partitioning)?" `
    "Creating read replicas of the database" `
    "Splitting a single logical dataset across multiple independent database servers based on a shard key (e.g. user_id % N or hash(user_id))" `
    "Storing data in CSV files on S3" `
    "Indexing every column in a table" 1 `
    "Sharding partitions rows across multiple distinct database nodes using a shard key, enabling massive write and storage scalability beyond single-server capacity."

Add-Q 19 11 "Medium" "What is the difference between Layer 4 and Layer 7 Load Balancing?" `
    "Layer 4 is for IPv4; Layer 7 is for IPv6" `
    "Layer 4 routes traffic based on IP address and TCP/UDP ports without inspecting packet payload; Layer 7 inspects HTTP headers, cookies, and URL paths" `
    "Layer 7 is always faster than Layer 4" `
    "Layer 4 operates in user space; Layer 7 in hardware" 1 `
    "Layer 4 balances purely at transport layer (fast, protocol-agnostic). Layer 7 inspects application layer content (HTTP URL paths, cookies, authorization headers) to make intelligent routing decisions."

Add-Q 19 12 "Hard" "What is the Token Bucket algorithm used for in API Gateway Rate Limiting?" `
    "Assigning JWT tokens to authenticated users" `
    "Tokens are added to a bucket at a constant refill rate up to maximum capacity; each incoming request consumes 1 token. If the bucket is empty, request is rejected with 429 Too Many Requests" `
    "Encrypting API payloads" `
    "Balancing database connections" 1 `
    "Token Bucket allows handling temporary burst traffic (up to bucket capacity) while enforcing a steady average consumption rate defined by the refill rate."

Add-Q 19 13 "Medium" "What is a Single Point of Failure (SPOF) in system architecture?" `
    "A bug in a unit test" `
    "A critical component whose failure causes the entire system to stop functioning" `
    "A user entering an invalid password" `
    "A slow database query" 1 `
    "A SPOF is any single component (e.g. un-replicated database, solitary load balancer) that lacks redundancy, such that its failure collapses the whole architecture."

Add-Q 19 14 "Hard" "What is the PACELC Theorem in distributed data storage systems?" `
    "A protocol for compressing JSON files" `
    "An extension of CAP: If there is a Partition (P), trade Availability (A) vs Consistency (C); Else (E), trade Latency (L) vs Consistency (C)" `
    "A method for calculating server cooling costs" `
    "An encryption standard replacing RSA" 1 `
    "PACELC extends CAP: even when operating normally without network partitions (Else), distributed systems still face a fundamental trade-off between Latency (L) and Consistency (C) due to replication lag."

Add-Q 19 15 "Medium" "Why are Message Queues (e.g. Apache Kafka, RabbitMQ) used in microservices architectures?" `
    "To store user passwords" `
    "To decouple producer and consumer services, buffer traffic spikes (rate leveling), and enable asynchronous processing" `
    "To replace relational databases completely" `
    "To compile microservices into single binaries" 1 `
    "Message brokers decouple services: producers publish messages without waiting for consumers to finish, smoothing out traffic spikes and providing fault tolerance."

Add-Q 19 16 "Hard" "What is the difference between Polling, Long Polling, and WebSockets for real-time client-server communication?" `
    "WebSockets only work on mobile devices" `
    "Polling repeatedly sends HTTP requests; Long Polling keeps HTTP request open until data is ready; WebSockets establishes a persistent, full-duplex TCP connection" `
    "Long polling is faster than WebSockets" `
    "Polling uses UDP; WebSockets uses ICMP" 1 `
    "Short polling creates excessive HTTP overhead. Long polling reduces checks by holding requests open until an update occurs. WebSockets provides true bidirectional low-overhead full-duplex communication over a single socket."

Add-Q 19 17 "Medium" "What is Database Replication with Primary-Replica (Master-Slave) architecture typically used for?" `
    "Running automated tests" `
    "Scaling Read-heavy workloads by routing writes to Primary and distributing reads across multiple Replicas, while providing backup redundancy" `
    "Encrypting database connections" `
    "Eliminating the need for SQL queries" 1 `
    "Primary processes all writes and streams changes to read replicas. Distributing read traffic across replicas scales read throughput and provides failover targets."

Add-Q 19 18 "Hard" "What is Replication Lag in distributed database systems and what anomaly can it cause?" `
    "Time taken to reboot a database" `
    "The delay before updates committed on Primary reflect on Read Replicas, which can cause a user to perform an update and immediately fail to see it on subsequent read (Read-Your-Own-Writes violation)" `
    "Network latency on client browsers" `
    "Delay in SSL handshake" 1 `
    "Asynchronous replication creates a window where replicas lag behind the primary. If a user posts a comment and reloads from a lagging replica, their new post may appear missing until replication catches up."

Add-Q 19 19 "Medium" "What does ACID vs BASE represent in database philosophy?" `
    "ACID is for mobile; BASE is for desktop" `
    "ACID prioritizes strict consistency and transactions (RDBMS); BASE (Basically Available, Soft state, Eventual consistency) prioritizes high availability and partition tolerance (NoSQL)" `
    "ACID is open source; BASE is proprietary" `
    "There is no difference" 1 `
    "ACID guarantees strict transactional correctness. BASE embraces eventual consistency in distributed systems to deliver massive scale and fault-tolerant availability."

Add-Q 19 20 "Hard" "In the design of a URL Shortener (e.g. Bit.ly), why is Base62 encoding chosen for short URLs over Base64?" `
    "Base62 is faster to compress" `
    "Base62 uses [a-z, A-Z, 0-9] avoiding characters like '+' and '/' which have reserved special meanings in HTTP URLs" `
    "Base62 produces shorter strings than Base64" `
    "Base62 encrypts the URL automatically" 1 `
    "Base62 uses 62 alphanumeric characters (26 lowercase, 26 uppercase, 10 digits). Unlike Base64, it omits '+' and '/' which require URL-encoding (%2B, %2F), ensuring clean, safe copy-paste URLs."

Add-Q 19 21 "Medium" "What is High Availability (HA) metric 'Four Nines' (99.99%) uptime in terms of allowable downtime per year?" `
    "Approximately 3.65 days" `
    "Approximately 52.6 minutes of total downtime per year" `
    "Approximately 8.76 hours" `
    "Zero downtime" 1 `
    "99.9% (Three Nines) allows ~8.76 hours/year. 99.99% (Four Nines) allows at most ~52.6 minutes/year. 99.999% (Five Nines) allows ~5.26 minutes/year."

Add-Q 19 22 "Hard" "What is a Bloom Filter and why is it used in caching and databases (e.g. Cassandra, Bigtable)?" `
    "A compression algorithm for images" `
    "A space-efficient probabilistic data structure used to test set membership, returning 'definitely not in set' or 'possibly in set', avoiding unnecessary disk I/O for missing keys" `
    "A cryptographic hash table" `
    "A sorting algorithm for strings" 1 `
    "Bloom filters use bit arrays and multiple hash functions. They have zero false negatives: if it says a key is not present, the database skips expensive disk block lookups entirely."

Add-Q 19 23 "Medium" "What is the purpose of Database Connection Pooling?" `
    "To share queries across databases" `
    "To maintain a cache of active database connections, eliminating the heavy latency overhead of establishing new TCP/TLS connections on every request" `
    "To pool memory between RAM and SSD" `
    "To automate database backups" 1 `
    "Establishing database connections involves TCP handshakes, TLS negotiation, and authentication. A connection pool keeps a pool of open connections ready for immediate reuse."

Add-Q 19 24 "Hard" "What is Idempotency in API design and why is it critical for payment processing?" `
    "Making APIs run in parallel" `
    "An operation that produces the exact same outcome whether executed once or multiple times, ensuring network retries do not result in duplicate customer charges" `
    "Compressing HTTP response bodies" `
    "Requiring API keys on every call" 1 `
    "If a network drops during a payment request, the client retries. An idempotent endpoint using an Idempotency-Key detects the duplicate submission and returns the cached result without charging twice."

Add-Q 19 25 "Medium" "What is Horizontal Pod Autoscaling (HPA) in modern container orchestration (Kubernetes)?" `
    "Adding more memory to a physical motherboard" `
    "Automatically adjusting the number of running container pod replicas based on observed CPU utilization or memory metrics" `
    "Shutting down servers at midnight" `
    "Compressing container images on Docker Hub" 1 `
    "HPA automatically scales the number of active pod instances up or down based on real-time traffic demand (e.g. CPU > 70%), maintaining responsiveness and optimizing infrastructure cost."

# ==================== DAY 20: SQL Advanced Window Functions & CTEs ====================
Add-Q 20 1 "Medium" "What is the difference between ROW_NUMBER(), RANK(), and DENSE_RANK() in SQL when values tie?" `
    "They all produce identical outputs" `
    "ROW_NUMBER assigns unique sequential integers (no ties); RANK assigns identical rank to ties and skips subsequent numbers (1,2,2,4); DENSE_RANK assigns identical rank to ties without skipping (1,2,2,3)" `
    "DENSE_RANK skips numbers; RANK does not" `
    "ROW_NUMBER only works on strings" 1 `
    "Ties illustrate the difference: values [100, 90, 90, 80] yield ROW_NUMBER: 1, 2, 3, 4; RANK: 1, 2, 2, 4; DENSE_RANK: 1, 2, 2, 3."

Add-Q 20 2 "Hard" "How do you find the Second Highest Salary in an Employee table handling duplicate salaries and returning NULL if no second exists?" `
    "SELECT salary FROM Employee ORDER BY salary DESC LIMIT 1 OFFSET 1;" `
    "SELECT MAX(salary) AS SecondHighestSalary FROM Employee WHERE salary < (SELECT MAX(salary) FROM Employee);" `
    "SELECT salary[1] FROM Employee;" `
    "SELECT DENSE_RANK(2) FROM Employee;" 1 `
    "Filtering WHERE salary < (SELECT MAX(salary)) finds the largest salary strictly below the maximum. If no lower salary exists (e.g. only 1 employee or all equal), MAX() returns NULL cleanly."

Add-Q 20 3 "Medium" "What does the SQL LEAD() window function do?" `
    "Returns the first value of the entire table" `
    "Accesses data from a subsequent row at a specified physical offset without requiring a self-join" `
    "Calculates running sum of salaries" `
    "Deletes future records" 1 `
    "LEAD(col, offset, default) provides access to a following row's value relative to the current row within the partition/window order."

Add-Q 20 4 "Hard" "In a window function frame specification, what is the critical difference between 'ROWS BETWEEN' and 'RANGE BETWEEN'?" `
    "ROWS works on strings; RANGE works on integers" `
    "ROWS treats duplicate values as distinct physical rows; RANGE treats duplicates as peers with identical logical value ranges" `
    "RANGE is faster than ROWS" `
    "ROWS is only supported in SQLite" 1 `
    "ROWS frames by physical row count (e.g. ROWS 1 PRECEDING). RANGE frames by logical value difference (e.g. RANGE BETWEEN 10 PRECEDING AND CURRENT ROW), treating tied peer values identically."

Add-Q 20 5 "Medium" "What is a Common Table Expression (CTE) in SQL defined with the 'WITH' clause?" `
    "A permanent table stored on disk" `
    "A named temporary result set that exists only within the execution scope of a single SELECT, INSERT, UPDATE, or DELETE statement" `
    "A type of foreign key constraint" `
    "An index created in RAM" 1 `
    "A CTE (WITH cte_name AS (...)) defines a modular, readable temporary query block that can be referenced like a table in the subsequent main query."

Add-Q 20 6 "Hard" "What is a Recursive CTE in SQL and what are its two structural components joined by UNION ALL?" `
    "A CTE that calls a stored procedure" `
    "An Anchor Member (base query returning initial rows) and a Recursive Member (query that references the CTE itself until termination)" `
    "Two CTEs joined by FULL OUTER JOIN" `
    "A CTE that deletes rows iteratively" 1 `
    "A recursive CTE executes iteratively: the Anchor Member produces the initial dataset, and the Recursive Member references the CTE recursively, appending rows until an empty set is produced."

Add-Q 20 7 "Medium" "Which window function divides an ordered partition into N roughly equal buckets and assigns a bucket number from 1 to N to each row?" `
    "BUCKET(N)" `
    "NTILE(N)" `
    "QUARTILE(N)" `
    "DIVIDE(N)" 1 `
    "NTILE(n) distributes rows across n buckets (e.g. NTILE(4) assigns quartiles 1 through 4), balancing row distribution across buckets as evenly as possible."

Add-Q 20 8 "Hard" "Why can't Window Functions be used directly inside a WHERE clause (e.g. WHERE ROW_NUMBER() OVER (...) = 1)?" `
    "Because window functions are deprecated" `
    "Because in SQL logical query processing, WHERE is evaluated before Window Functions (which are evaluated during the SELECT phase); a subquery or CTE must wrap it" `
    "Because WHERE only accepts Boolean literals" `
    "Because window functions only return strings" 1 `
    "Logical processing order: FROM -> WHERE -> GROUP BY -> HAVING -> SELECT (Window Functions) -> ORDER BY. Because WHERE filters before window functions are calculated, filtering requires a CTE or subquery."

Add-Q 20 9 "Medium" "What does the SQL LAG() window function return?" `
    "The last row of the table" `
    "The value from a preceding row at a specified offset within the partition" `
    "The average delay of the query" `
    "The smallest number in the column" 1 `
    "LAG(col, offset, default) accesses data from a previous row relative to the current row, ideal for computing day-over-day growth or differences."

Add-Q 20 10 "Hard" "How do you find and remove duplicate rows in a table while keeping the row with the lowest id using a CTE and ROW_NUMBER()?" `
    "DELETE FROM table WHERE id IN (SELECT id FROM ... WHERE row_num > 1)" `
    "WITH cte AS (SELECT id, ROW_NUMBER() OVER (PARTITION BY col1, col2 ORDER BY id) as rn FROM table) DELETE FROM table WHERE id IN (SELECT id FROM cte WHERE rn > 1);" `
    "DROP TABLE table;" `
    "SELECT DISTINCT * INTO table FROM table;" 1 `
    "Partitioning by the duplicate definition columns and ordering by id assigns rn = 1 to the first instance. Filtering rn > 1 isolates all excess duplicate rows for deletion."

Add-Q 20 11 "Medium" "What is the default window frame specification when ORDER BY is supplied inside OVER() without an explicit ROWS clause?" `
    "ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING" `
    "RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW" `
    "ROWS BETWEEN CURRENT ROW AND CURRENT ROW" `
    "No frame is applied" 1 `
    "By ANSI SQL standard, specifying ORDER BY defaults the frame to 'RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW', which accumulates running totals up to the current row (including tied peers)."

Add-Q 20 12 "Hard" "What is the 'Gaps and Islands' problem in SQL and how do window functions solve it?" `
    "A geographic mapping query" `
    "Detecting continuous contiguous sequences of data (Islands) and missing intervals (Gaps), typically solved by subtracting ROW_NUMBER() from a sequence column" `
    "Finding empty tables in database" `
    "Indexing floating point numbers" 1 `
    "When consecutive dates or integers increment together, (date_col - ROW_NUMBER() * interval '1 day') remains constant for contiguous runs (islands), forming a natural grouping key."

Add-Q 20 13 "Medium" "What does PARTITION BY do inside a window function OVER() clause?" `
    "Physically splits table onto multiple disks" `
    "Divides the result set into independent partitions/groups over which the window function is separately evaluated" `
    "Filters out rows with NULL values" `
    "Sorts the final result set" 1 `
    "PARTITION BY divides the query dataset into logical subgroups. The window function calculates afresh for each partition, restarting calculations at partition boundaries."

Add-Q 20 14 "Hard" "In 'FIRST_VALUE(col) OVER (ORDER BY date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)', what does the function return?" `
    "The value of 'col' from the very first row of the partition" `
    "The value of 'col' from the previous row" `
    "The maximum value of 'col'" `
    "The average value" 0 `
    "FIRST_VALUE returns the value of the specified expression from the first row of the window frame (which starts at UNBOUNDED PRECEDING)."

Add-Q 20 15 "Medium" "What is the result of 'SELECT SUM(salary) OVER () FROM Employee;' on each row?" `
    "Running sum of salaries row by row" `
    "The grand total sum of all employee salaries in the entire table, repeated on every single row" `
    "Salary of the current row only" `
    "An error because OVER() is empty" 1 `
    "An empty OVER() clause defines a window spanning the entire result set without partitioning or ordering, displaying the grand total alongside individual row data."

Add-Q 20 16 "Hard" "What does the CUME_DIST() window function calculate?" `
    "Cumulative distance between geometric coordinates" `
    "The relative rank of a value: (number of rows with values <= current row value) / (total rows in partition)" `
    "Standard deviation of the column" `
    "The average difference between adjacent rows" 1 `
    "CUME_DIST() calculates the cumulative distribution (a percentile between > 0 and 1.0) representing the fraction of rows that are less than or equal to the current row value."

Add-Q 20 17 "Medium" "How does a Window Function differ from a regular GROUP BY aggregate function?" `
    "Window functions can only be used on indexed tables" `
    "GROUP BY collapses multiple rows into a single summary row; Window functions retain individual row identities while calculating aggregate values across groups" `
    "Window functions are slower than cursors" `
    "GROUP BY cannot use SUM or COUNT" 1 `
    "Unlike GROUP BY which aggregates and collapses rows, window functions append calculated partition metrics to each original row without altering total row count."

Add-Q 20 18 "Hard" "What does PERCENT_RANK() return for the first row of any partition?" `
    "1.0" `
    "0.0" `
    "0.5" `
    "NULL" 1 `
    "PERCENT_RANK() is defined as (RANK - 1) / (total_rows - 1). For the highest-ranked row (RANK = 1), (1 - 1) / (N - 1) evaluates to 0.0."

Add-Q 20 19 "Medium" "Can a single SELECT statement define multiple different window functions with different PARTITION BY clauses?" `
    "No, only one window definition is permitted per query" `
    "Yes, each window function can have its own distinct OVER(PARTITION BY ... ORDER BY ...) clause" `
    "Only if joined with UNION" `
    "Only in PostgreSQL" 1 `
    "Multiple window functions with distinct partitionings and orderings can be evaluated within the same SELECT statement."

Add-Q 20 20 "Hard" "In recursive CTEs, what prevents an infinite loop when traversing graph or organizational hierarchy data with circular cycles?" `
    "The database server automatically cuts power" `
    "Tracking a path array or visited list in the recursive query (e.g. WHERE NOT child_id = ANY(path)), or setting a MAXRECURSION limit" `
    "Using INNER JOIN instead of LEFT JOIN" `
    "Sorting by ID" 1 `
    "If parent-child relationships contain cycles (A -> B -> A), the recursive query loops indefinitely. Appending visited IDs to an array and checking for membership prevents revisiting cycles."

Add-Q 20 21 "Medium" "What does 'ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW' specify for an AVG(sales) window?" `
    "Average of all sales in the company" `
    "A 3-row moving average (current day plus the two preceding days)" `
    "Average sales of next 2 days" `
    "Average of first 2 rows of table" 1 `
    "The frame encompasses 2 preceding rows plus the current row, computing a 3-day moving average of sales."

Add-Q 20 22 "Hard" "How can you pivot rows to columns in SQL without vendor-specific PIVOT syntax?" `
    "Using CROSS JOIN" `
    "Using conditional aggregation: MAX(CASE WHEN category = 'X' THEN amount END) GROUP BY id" `
    "Using window functions with LAG" `
    "Using recursive CTEs" 1 `
    "Standard ANSI SQL pivots using CASE WHEN inside aggregate functions (e.g. SUM(CASE WHEN month = 'Jan' THEN sales ELSE 0 END)) grouped by entity."

Add-Q 20 23 "Medium" "What is the execution plan benefit of CTEs compared to temporary tables created with 'CREATE TEMPORARY TABLE'?" `
    "CTEs are written to disk logs" `
    "CTEs require no disk I/O, no metadata locks, and can be inlined directly by query optimizers" `
    "CTEs automatically create indexes" `
    "Temporary tables are always faster" 1 `
    "CTEs are memory-resident query abstractions evaluated on-the-fly, avoiding tempdb disk allocation, catalog updates, and explicit cleanup overhead."

Add-Q 20 24 "Hard" "In PostgreSQL or MySQL 8.0, what does the WINDOW clause at the end of a query do?" `
    "Opens a modal on the screen" `
    "Defines a reusable named window specification (e.g. WINDOW w AS (PARTITION BY dept ORDER BY salary DESC)) referenced by multiple OVER w functions" `
    "Sets query timeout" `
    "Controls display resolution" 1 `
    "The WINDOW clause avoids repeating identical OVER(PARTITION BY ... ORDER BY ...) definitions across multiple columns by declaring a single named window."

Add-Q 20 25 "Medium" "Which SQL clause is used to inspect the query plan and execution cost of a window function query?" `
    "INSPECT QUERY" `
    "EXPLAIN or EXPLAIN ANALYZE" `
    "SHOW PLAN DETAILS" `
    "DESCRIBE TABLE" 1 `
    "EXPLAIN (and EXPLAIN ANALYZE) outputs the database execution plan, showing scan types, hash aggregates, window sort steps, and estimated/actual costs."

Write-Output "Days 18, 19, 20 loaded."
