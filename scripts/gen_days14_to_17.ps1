# Generator for Days 14 to 17 (100 Unique Questions)

# ==================== DAY 14: Heap & Priority Queues ====================
Add-Q 14 1 "Medium" "In an array-based representation of a Complete Binary Tree (0-indexed), what are the formulas for left child, right child, and parent of index i?" `
    "left = 2i, right = 2i + 1, parent = i / 2" `
    "left = 2i + 1, right = 2i + 2, parent = (i - 1) / 2" `
    "left = i + 1, right = i + 2, parent = i - 1" `
    "left = i^2, right = i^2 + 1, parent = sqrt(i)" 1 `
    "In 0-indexed complete binary trees: parent is at (i - 1)/2, left child is at 2*i + 1, and right child is at 2*i + 2."

Add-Q 14 2 "Hard" "What is the time complexity of building a heap of N elements from an arbitrary unsorted array using the bottom-up 'heapify' procedure?" `
    "O(N log N)" `
    "O(N) linear time" `
    "O(N^2)" `
    "O(log N)" 1 `
    "While inserting N elements into an initially empty heap takes O(N log N), bottom-up heapify runs from node (N/2 - 1) down to 0. The summation of (height * number of nodes at that height) mathematically converges to O(N)."

Add-Q 14 3 "Medium" "What is the Min-Heap property?" `
    "Parent node value is greater than or equal to both children" `
    "Parent node value is less than or equal to both children (root holds the minimum element)" `
    "Left child is smaller than parent, right child is larger" `
    "All leaf nodes hold the value zero" 1 `
    "In a min-heap, the key at the root must be the minimum among all keys in the heap, and this property holds recursively for all subtrees."

Add-Q 14 4 "Hard" "In 'Find Median from Data Stream', how do two heaps maintain the running median in O(log N) insertion and O(1) query time?" `
    "A min-heap for all numbers" `
    "A Max-Heap for the lower half of numbers and a Min-Heap for the upper half, balanced such that size difference is at most 1" `
    "Two min-heaps storing odd and even numbers" `
    "Sorting the stream on every query" 1 `
    "Max-heap stores the smaller half (top is max of small half), Min-heap stores larger half (top is min of large half). If total elements is odd, median is the top of the larger heap; if even, average of both tops."

Add-Q 14 5 "Medium" "How does a Min-Heap find the Kth Largest Element in an array of size N in O(N log K) time?" `
    "Insert all elements and sort" `
    "Maintain a Min-Heap of size K: push elements, and if size > K, pop the minimum. The root at the end will be the Kth largest element" `
    "Use a max-heap of size N" `
    "Heapify in O(N) then search linearly" 1 `
    "A Min-Heap of size K discards smaller elements whenever size exceeds K. After scanning the array, the heap holds the K largest elements, with the K-th largest sitting right at the top."

Add-Q 14 6 "Hard" "In 'Merge K Sorted Lists', why is a Min-Heap of size K more efficient than merging lists two at a time sequentially?" `
    "Sequential merging takes O(K^2 * N); Min-heap achieves O(N log K) total time where N is total node count" `
    "Min-heap uses no RAM" `
    "Sequential merging causes recursion overflow" `
    "Lists cannot be merged sequentially" 0 `
    "Merging lists sequentially accumulates work quadratically. Min-heap extracts the global minimum across all K active lists in O(log K) for each of the N total nodes, yielding optimal O(N log K)."

Add-Q 14 7 "Medium" "What is the time complexity of the Heapsort algorithm in the worst, average, and best cases?" `
    "O(N^2) in all cases" `
    "O(N log N) in all cases" `
    "O(N) best case, O(N^2) worst case" `
    "O(log N)" 1 `
    "Building heap takes O(N), and extracting maximum N times each takes O(log N). Thus Heapsort is guaranteed O(N log N) in worst, average, and best cases with in-place O(1) space."

Add-Q 14 8 "Hard" "In 'Top K Frequent Elements', what is the runtime when using Bucket Sort versus a Min-Heap?" `
    "Heap takes O(N^2); Bucket sort takes O(N log N)" `
    "Heap takes O(N log K); Bucket sort takes O(N) linear time and O(N) space using frequency as bucket indices" `
    "Both take O(N log N)" `
    "Bucket sort only works for positive numbers" 1 `
    "Count frequencies in a map. Bucket sort creates N+1 buckets where bucket[f] stores elements appearing with frequency f. Scanning from highest bucket down gathers top K in strictly O(N) time."

Add-Q 14 9 "Medium" "What happens during the 'extract-min' / 'poll' operation in a Min-Heap?" `
    "Delete root, leave hole empty" `
    "Replace root with the last element in the heap, decrement size, and sift-down (bubble-down) that element to restore heap invariant" `
    "Shift all elements in array left by 1" `
    "Rebuild entire heap from scratch" 1 `
    "Moving the last leaf to the root maintains the complete binary tree shape. Then 'sift-down' compares with smaller child and swaps downward in O(log N) until heap order is restored."

Add-Q 14 10 "Hard" "In 'Task Scheduler' (cooling period N between identical tasks), why does greedy scheduling with a Max-Heap work?" `
    "Always pick the task with the lowest ID" `
    "Greedily execute the task with the highest remaining frequency to minimize idle intervals" `
    "Sort tasks alphabetically" `
    "Assign tasks randomly" 1 `
    "Tasks with highest frequency have the most cooling slots to fill. Prioritizing them via Max-Heap leaves maximum room for other tasks to occupy cooling intervals, minimizing idle CPU cycles."

Add-Q 14 11 "Medium" "Can a standard Binary Heap be used to implement a double-ended priority queue (efficient getMin and getMax)?" `
    "Yes, in O(1) for both" `
    "No, a min-heap gives O(1) min but O(N) max (since max is in one of the leaves); a Min-Max Heap or Interval Heap is required for O(1) both" `
    "Yes, root is min and last leaf is always max" `
    "Heaps cannot store numbers" 1 `
    "In a min-heap, the maximum element can reside in any of the ~N/2 leaf nodes. Finding it requires an O(N) linear scan over leaves, unless a Min-Max Heap structure is used."

Add-Q 14 12 "Hard" "In 'Reorganize String' (no two adjacent characters identical), how does a Max-Heap place characters?" `
    "Alphabetically" `
    "Pop the most frequent character, append it, then pop the second most frequent character, append it, decrement counts, and push both back into heap" `
    "Reverse the string" `
    "Group identical characters together" 1 `
    "Greedily interleaving the two most frequent characters ensures high-frequency characters are separated by distinct letters. If at any point the most frequent character has count > (N + 1)/2, it is impossible."

Add-Q 14 13 "Medium" "What is the time complexity to insert a new element into a binary heap of size N?" `
    "O(1) worst-case" `
    "O(log N) by placing at end and sifting-up" `
    "O(N)" `
    "O(N log N)" 1 `
    "The new key is placed at the next available leaf position in the complete tree (index N) and sifted up toward the root, taking time proportional to tree height: O(log N)."

Add-Q 14 14 "Hard" "In 'Meeting Rooms II' (minimum conference rooms required), what does the Min-Heap store during the sweep-line simulation?" `
    "Meeting start times" `
    "End times of currently ongoing meetings (top of heap is earliest ending meeting)" `
    "Room numbers" `
    "Attendee counts" 1 `
    "Sort meetings by start time. For each meeting, if its start time >= earliest end time (heap top), reuse that room (pop heap). Otherwise, allocate a new room. Push current meeting's end time. Heap size = rooms needed."

Add-Q 14 15 "Medium" "In Java Collections, what class implements a Priority Queue, and is it a Min-Heap or Max-Heap by default?" `
    "java.util.TreeSet; Max-Heap" `
    "java.util.PriorityQueue; Min-Heap by default" `
    "java.util.Stack; Min-Heap" `
    "java.util.LinkedList; Max-Heap" 1 `
    "PriorityQueue in Java is implemented as a binary min-heap by default, using natural ordering (Comparable) or an explicit custom Comparator."

Add-Q 14 16 "Hard" "In 'IPO' (maximizing capital by selecting up to K projects), how are two priority queues used?" `
    "One heap for negative profits, one for positive" `
    "Min-heap ordered by required capital; Max-heap ordered by profit. While capital >= min-heap top, pop and add to profit max-heap; then pick highest profit from max-heap" `
    "Sort projects by name" `
    "Dynamic programming on bitmasks" 1 `
    "Min-heap unlocks all projects affordable with current capital. Moving affordable projects into a Max-Heap allows greedily selecting the project offering maximum profit at each of the K steps."

Add-Q 14 17 "Medium" "What is a Complete Binary Tree?" `
    "A tree where every node has two children" `
    "A binary tree where every level is completely filled except possibly the last level, which is filled from left to right" `
    "A tree where all leaves have identical values" `
    "A tree of height at most 3" 1 `
    "Completeness ensures no gaps exist in the underlying contiguous array representation, making parent/child index math exact."

Add-Q 14 18 "Hard" "In 'Minimum Cost to Connect Sticks' (Huffman coding greedy principle), why do we repeatedly combine the two smallest sticks?" `
    "To minimize total stick length" `
    "Because smaller sticks combined early contribute repeatedly to subsequent sums; minimizing early additions minimizes the overall sum" `
    "It is an arbitrary choice" `
    "To make sticks equal length" 1 `
    "Connecting two sticks costs their combined length. Elements combined first will be added into subsequent combinations multiple times. Combining the smallest pair repeatedly via Min-Heap is provably optimal (Huffman's algorithm)."

Add-Q 14 19 "Medium" "What is the time complexity of building a heap with N elements by calling 'insert' N times sequentially?" `
    "O(N)" `
    "O(N log N)" `
    "O(N^2)" `
    "O(log N)" 1 `
    "Each insertion takes up to O(log k) for the k-th element. Summing log(1) + log(2) + ... + log(N) = log(N!) = O(N log N)."

Add-Q 14 20 "Hard" "In 'K Closest Points to Origin', how does a Max-Heap of size K achieve O(N log K) time?" `
    "It stores points in order of closest distance" `
    "It keeps points ordered by greatest distance from origin at the top; when size > K, eject the farthest point, leaving the K closest points in the heap" `
    "It computes square roots of all points" `
    "Max-heap cannot solve this problem" 1 `
    "A Max-Heap of size K retains the K closest points seen so far. If a new point is closer than the heap's top (the current farthest among the K), pop the top and push the new point."

Add-Q 14 21 "Medium" "In a Max-Heap with N elements, where can the smallest element be located?" `
    "Always at index 0 (the root)" `
    "In one of the leaf nodes (indices from floor(N/2) to N - 1)" `
    "At index 1 only" `
    "At index N/2 only" 1 `
    "In a max-heap, parents are greater than children. Therefore, the minimum element cannot have children and must reside in one of the leaf nodes."

Add-Q 14 22 "Hard" "In 'Smallest Range Covering Elements from K Lists', what does the Min-Heap maintain at all times?" `
    "All elements across all lists" `
    "One current element from each of the K lists, tracking min_val (heap top) and global max_val; advance min_val's list pointer until one list is exhausted" `
    "The median of each list" `
    "Prefix sums of lists" 1 `
    "The Min-Heap holds exactly K elements (one from each list). Range is [heap.top(), current_max]. At each step, record minimum range, pop heap top, and push the next element from that popped item's list."

Add-Q 14 23 "Medium" "What is the primary difference between a Fibonacci Heap and a Binary Heap regarding the 'decrease-key' operation?" `
    "Binary Heap is faster" `
    "Fibonacci Heap achieves amortized O(1) for decrease-key, whereas Binary Heap takes O(log N)" `
    "Binary Heap does not support decrease-key" `
    "Fibonacci Heap requires less memory" 1 `
    "Fibonacci heaps provide amortized O(1) decrease-key, making algorithms like Dijkstra and Prim theoretically faster (O(E + V log V)), though practical constant factors favor binary heaps."

Add-Q 14 24 "Hard" "In 'Furthest Building You Can Reach' (height differences, bricks, ladders), why should Ladders be allocated to the largest height jumps via Min-Heap?" `
    "Ladders can only be used on short jumps" `
    "A ladder covers an infinite height jump with 1 resource; assigning ladders to the largest climbs minimizes the bricks required for the remaining smaller climbs" `
    "Ladders are cheaper than bricks" `
    "Bricks cannot be used after ladders" 1 `
    "Track jumps in a Min-Heap of size L (ladders). When climbs exceed L, pop the smallest climb and pay for it with bricks. If bricks drop below zero, you cannot advance further."

Add-Q 14 25 "Medium" "How does PriorityQueue in Java handle ties between elements with identical comparator priority?" `
    "Throws an IllegalArgumentException" `
    "Arbitrary tie-breaking order; does not guarantee FIFO stability for equal elements" `
    "Strict FIFO order" `
    "Deletes both elements" 1 `
    "Standard binary heaps do not guarantee FIFO order for elements with equal priority unless an explicit secondary sequence counter is included in the stored object."

# ==================== DAY 15: Graphs - BFS & DFS Traversals ====================
Add-Q 15 1 "Medium" "What is the space complexity of representing a graph with V vertices and E edges using an Adjacency Matrix versus an Adjacency List?" `
    "Matrix: O(V + E); List: O(V^2)" `
    "Matrix: O(V^2); List: O(V + E)" `
    "Both are O(V * E)" `
    "Both are O(V)" 1 `
    "An adjacency matrix allocates a 2D V x V array (O(V^2) memory regardless of edge density). An adjacency list stores only existing edges, requiring O(V + E) space, ideal for sparse graphs."

Add-Q 15 2 "Hard" "In 'Course Schedule' (detecting cycles in a directed graph), how does DFS detect back-edges using 3-color states?" `
    "0 (Unvisited), 1 (Visiting / In current DFS stack), 2 (Visited / Completely processed). Visiting a node with state 1 indicates a back-edge and hence a cycle" `
    "Using red and black nodes" `
    "Comparing vertex degrees" `
    "Checking node values" 0 `
    "White-Gray-Black DFS cycle detection: state 0 is unvisited; state 1 means active in current recursion branch. Encountering an adjacent neighbor in state 1 confirms a cycle (back-edge)."

Add-Q 15 3 "Medium" "In 'Number of Islands' on an M x N grid, what is the standard technique to avoid revisiting land cells ('1')?" `
    "Allocate a new grid on each step" `
    "Sink the island: set grid[r][c] = '0' (or mark visited) during DFS/BFS traversal before exploring 4 neighboring directions" `
    "Sort the grid coordinates" `
    "Count rows containing '1'" 1 `
    "When a '1' is encountered, increment island count and trigger DFS/BFS to visit all connected land cells, flipping each to '0' in-place so they are never re-counted."

Add-Q 15 4 "Hard" "What is Kahn's Algorithm for Topological Sorting of a Directed Acyclic Graph (DAG)?" `
    "A greedy algorithm using Dijkstra's priority queue" `
    "Compute in-degrees for all nodes; enqueue nodes with in-degree 0; in BFS: pop node, append to order, decrement in-degree of neighbors, enqueue if in-degree becomes 0; check if result length == V" `
    "DFS traversal printing nodes in preorder" `
    "Prim's algorithm on directed edges" 1 `
    "Kahn's BFS algorithm repeatedly strips vertices that have zero prerequisites (in-degree 0). If the final topological list contains fewer than V vertices, the graph contains at least one cycle."

Add-Q 15 5 "Medium" "Why does Breadth-First Search (BFS) guarantee finding the Shortest Path in an unweighted graph?" `
    "Because it uses recursion" `
    "Because it visits vertices in strictly increasing order of their distance (number of edges) from the source node" `
    "Because it sorts edge weights" `
    "BFS does not find shortest paths" 1 `
    "In an unweighted graph, all edges have equal weight 1. BFS expands level by level, ensuring that the first time a target vertex is dequeued, it is reached via the minimum number of edges."

Add-Q 15 6 "Hard" "In 'Word Ladder' (shortest transformation sequence from beginWord to endWord), how does bidirectional BFS optimize execution time?" `
    "It sorts the dictionary alphabetically" `
    "It expands BFS simultaneously from both beginWord and endWord, terminating when the two search frontiers intersect, reducing search space from O(b^d) to O(b^(d/2))" `
    "It uses a single shared stack" `
    "It replaces BFS with binary search" 1 `
    "Bidirectional BFS drastically prunes the exponential branching tree: meeting in the middle reduces depth from d to d/2, speeding up runtime by orders of magnitude on large word graphs."

Add-Q 15 7 "Medium" "In 'Rotting Oranges' (multi-source BFS), how is the BFS queue initialized?" `
    "Enqueue only the top-left orange" `
    "Enqueue all originally rotten oranges (value 2) at time 0 simultaneously" `
    "Enqueue fresh oranges" `
    "Enqueue oranges randomly" 1 `
    "Multi-source BFS seeds the queue with all rotten oranges at minute 0. The BFS expands rot to neighboring fresh oranges in parallel, tracking elapsed minutes level by level."

Add-Q 15 8 "Hard" "In 'Clone Graph' (deep copy of an undirected graph), what prevents infinite loops in cyclic graphs?" `
    "Limiting recursion to depth 10" `
    "A HashMap mapping original Node references to newly created cloned Node references" `
    "Sorting node values" `
    "Setting node neighbors to null" 1 `
    "A visited HashMap (originalNode -> clonedNode) ensures each node is instantiated once. If an adjacent neighbor is already in the map, attach the existing clone without re-cloning."

Add-Q 15 9 "Medium" "What condition must a graph satisfy to be a Valid Tree?" `
    "It must have at least 1 cycle" `
    "It must be fully connected and contain exactly V - 1 edges (or connected and acyclic)" `
    "It must be directed" `
    "It must have an even number of vertices" 1 `
    "A graph of V vertices is a tree if and only if it is connected and has exactly V - 1 edges (or equivalently, connected and contains no cycles)."

Add-Q 15 10 "Hard" "In 'Alien Dictionary' (reconstructing alphabet order from sorted word list), how is the directed graph constructed?" `
    "By hashing all words" `
    "Compare adjacent words in the list: find the first differing character pair (c1, c2), creating a directed edge c1 -> c2; then run topological sort" `
    "Sort characters by ASCII values" `
    "Count character frequencies across all words" 1 `
    "Lexicographical ordering dictates that when word1 precedes word2, the first character where they differ establishes that c1 comes before c2. Adding directed edges c1 -> c2 models dependencies for topological sort."

Add-Q 15 11 "Medium" "How do you detect a cycle in an Undirected Graph using BFS or DFS?" `
    "If any vertex has degree > 2" `
    "If an adjacent neighbor is already visited and is NOT the parent of the current node in the traversal tree" `
    "If the graph has negative weights" `
    "If BFS queue size exceeds V" 1 `
    "In an undirected graph, traversing back to the immediate parent is normal. Reaching an already visited neighbor that is NOT the parent confirms an alternative path, which constitutes a cycle."

Add-Q 15 12 "Hard" "In '01 Matrix' (find distance of nearest 0 for each cell), why do we start BFS from all 0s rather than from each 1?" `
    "0s have smaller values" `
    "Starting BFS from every 1 takes O((M*N)^2); starting a single multi-source BFS from all 0s visits each cell once in O(M*N)" `
    "1s cannot be enqueued" `
    "BFS cannot find distances" 1 `
    "Multi-source BFS outward from all zero cells computes the shortest distance to every cell in a single pass of O(M*N) time, whereas running BFS from each 1 causes catastrophic O((M*N)^2) timeouts."

Add-Q 15 13 "Medium" "What is the time complexity of Breadth-First Search on a graph with V vertices and E edges represented as an adjacency list?" `
    "O(V * E)" `
    "O(V + E)" `
    "O(V^2)" `
    "O(E log V)" 1 `
    "Every vertex is enqueued and dequeued once (O(V)), and every edge adjacency list is scanned once across all vertex visits (O(E)), giving O(V + E)."

Add-Q 15 14 "Hard" "In 'Surrounded Regions' (capture 'O's surrounded by 'X'), what cells must NOT be captured?" `
    "Cells in the center of the grid" `
    "Any 'O' connected directly or indirectly to the boundary of the board; find these by running DFS from boundary 'O's first" `
    "All 'O's are captured unconditionally" `
    "Cells with odd row indices" 1 `
    "Any 'O' on the board border cannot be surrounded. Running DFS from boundary 'O's marks all escape-connected cells with a temporary marker (e.g. '#'). Remaining 'O's are surrounded and flipped to 'X'."

Add-Q 15 15 "Medium" "What is a Connected Component in an undirected graph?" `
    "A vertex with maximum degree" `
    "A maximal subgraph in which any two vertices are connected to each other by paths, and which is connected to no additional vertices in the supergraph" `
    "A cycle of length 3" `
    "An edge connecting two different graphs" 1 `
    "A connected component is an equivalence class of vertices under the reachability relation: every vertex in the component can reach every other vertex in that component."

Add-Q 15 16 "Hard" "In 'Pacific Atlantic Water Flow', how do you find cells that can flow to BOTH oceans without redundant searches?" `
    "Run DFS from every cell to both oceans in O((M*N)^2)" `
    "Run reverse DFS uphill: one starting from Pacific ocean edges, one from Atlantic ocean edges; the intersection of both visited matrices yields the answer in O(M*N)" `
    "Sort matrix cells by height" `
    "Use binary search on grid heights" 1 `
    "Instead of simulating water flowing downhill from all cells, simulate water rising uphill (neighbor >= current) from ocean borders. Cells marked visited in both ocean searches reach both oceans in O(M*N)."

Add-Q 15 17 "Medium" "What is the maximum number of edges in a simple undirected graph with V vertices?" `
    "V * (V - 1)" `
    "V * (V - 1) / 2" `
    "V^2" `
    "2^V" 1 `
    "Each of the V vertices can connect to at most (V - 1) other vertices. Dividing by 2 accounts for undirected edge symmetry: V*(V - 1)/2."

Add-Q 15 18 "Hard" "In 'Minimum Height Trees' (find roots that minimize tree height), what peeling technique solves this in O(V) time?" `
    "Run BFS from every single node in O(V^2)" `
    "Repeatedly trim leaf nodes (nodes with degree 1) layer by layer until 1 or 2 centroid nodes remain" `
    "Pick the node with the highest degree" `
    "Construct a minimum spanning tree" 1 `
    "A tree has at most two centroids that minimize height. Trimming degree-1 leaves inward level-by-level (like peeling an onion) isolates the center 1 or 2 nodes in O(V) time."

Add-Q 15 19 "Medium" "Which data structure is fundamentally used to implement Breadth-First Search?" `
    "Stack" `
    "Queue (FIFO)" `
    "PriorityQueue" `
    "Binary Search Tree" 1 `
    "BFS requires visiting nodes in FIFO order of discovery, which is implemented using a Queue."

Add-Q 15 20 "Hard" "In 'Course Schedule II' (return valid order of courses), what indicates that no valid ordering exists?" `
    "Courses have different credit values" `
    "The dependency graph contains a directed cycle, detected when topological sort result size < total courses numCourses" `
    "Course 0 has no prerequisites" `
    "The graph is disconnected" 1 `
    "A topological ordering exists if and only if the graph is a Directed Acyclic Graph (DAG). If a cycle exists, mutual dependency deadlocks courses, preventing all courses from being scheduled."

Add-Q 15 21 "Medium" "What is an in-degree of a vertex in a directed graph?" `
    "The number of edges directed away from the vertex" `
    "The number of edges directed into the vertex" `
    "The weight of the vertex" `
    "The length of the shortest path from root" 1 `
    "In-degree is the count of incoming directed edges arriving at that node; out-degree is the count of outgoing directed edges leaving it."

Add-Q 15 22 "Hard" "In 'Shortest Path in Binary Matrix' (8-direction grid movement from top-left to bottom-right), why must 8 directions be checked?" `
    "Because diagonal steps are permitted in addition to horizontal and vertical steps" `
    "Because grid dimensions must be 8x8" `
    "Because 8 bits form a byte" `
    "To simulate knight moves in chess" 0 `
    "The problem explicitly permits diagonal movement: (-1,-1), (-1,0), (-1,1), (0,-1), (0,1), (1,-1), (1,0), (1,1). BFS over 8 directions finds the minimum steps in O(N^2)."

Add-Q 15 23 "Medium" "What is the Bipartite Graph property?" `
    "Every node has degree 2" `
    "A graph whose vertices can be divided into two disjoint sets U and V such that every edge connects a vertex in U to one in V (2-colorable with no odd cycles)" `
    "A graph with two disconnected components" `
    "A graph containing only directed edges" 1 `
    "A graph is bipartite if it can be colored using 2 colors such that no two adjacent vertices share the same color. A graph is bipartite if and only if it contains NO odd-length cycles."

Add-Q 15 24 "Hard" "In 'Graph Valid Tree', how can Disjoint Set Union (DSU) verify the tree properties in a single pass?" `
    "Count node colors" `
    "Check if E == V - 1, and for each edge (u, v), if find(u) == find(v) a cycle is detected; otherwise union(u, v)" `
    "Sort edges by weight" `
    "Verify node 0 connects to all nodes" 1 `
    "A valid tree must have exactly V - 1 edges. Using DSU: if union(u, v) returns false (both already have the same root), an internal cycle exists. If all V-1 edges union successfully, it is guaranteed to be an acyclic connected tree."

Add-Q 15 25 "Medium" "What happens if you run DFS on an unweighted cyclic graph without a 'visited' array or set?" `
    "The algorithm runs faster" `
    "It gets stuck in infinite recursion and throws a StackOverflowError" `
    "It converts cycles into trees" `
    "It prints vertices in sorted order" 1 `
    "Without tracking visited states, recursive DFS will endlessly cycle back and forth across cyclic edges until call stack memory is exhausted."

# ==================== DAY 16: Graphs - Shortest Path & MST ====================
Add-Q 16 1 "Medium" "What is the primary constraint on edge weights for Dijkstra's Algorithm to guarantee correct shortest paths?" `
    "All edge weights must be negative" `
    "All edge weights must be non-negative (weight >= 0)" `
    "Edge weights must be distinct integers" `
    "Graph must be acyclic" 1 `
    "Dijkstra relies on a greedy invariant: once a vertex is settled, its shortest distance cannot be improved. Negative edge weights violate this invariant, causing Dijkstra to produce incorrect results."

Add-Q 16 2 "Hard" "What is the time complexity of Dijkstra's Algorithm implemented with an Adjacency List and a Min-Heap (Binary Heap)?" `
    "O(V^2)" `
    "O((V + E) log V) or O(E log V)" `
    "O(V * E)" `
    "O(V^3)" 1 `
    "Each vertex is extracted from the heap once (V log V), and each edge relaxation updates or pushes to the heap at most once (E log V), yielding O((V + E) log V)."

Add-Q 16 3 "Medium" "Which shortest path algorithm can handle graphs with Negative Edge Weights and detect Negative Cycles?" `
    "Dijkstra's Algorithm" `
    "Bellman-Ford Algorithm" `
    "Prim's Algorithm" `
    "Kruskal's Algorithm" 1 `
    "Bellman-Ford relaxes all E edges (V - 1) times. It works with negative edge weights and identifies negative weight cycles on a V-th relaxation iteration."

Add-Q 16 4 "Hard" "How does Bellman-Ford detect that a graph contains a Negative Weight Cycle reachable from the source?" `
    "If the sum of all edge weights is negative" `
    "If any distance can still be minimized (relaxed) during the V-th iteration after completing V - 1 relaxation passes" `
    "If the graph contains odd number of vertices" `
    "If distance array contains null" 1 `
    "In a graph without negative cycles, the shortest path contains at most V - 1 edges. If any edge can still be relaxed on the V-th pass, a negative cycle must exist that reduces path length indefinitely."

Add-Q 16 5 "Medium" "What is the time complexity of the Bellman-Ford algorithm on a graph with V vertices and E edges?" `
    "O(V + E)" `
    "O(V * E)" `
    "O(E log V)" `
    "O(V^3)" 1 `
    "Bellman-Ford iterates (V - 1) times and examines all E edges in each pass, yielding O(V * E) time complexity."

Add-Q 16 6 "Hard" "What is the Floyd-Warshall Algorithm used for, and what is its time and space complexity?" `
    "Single-source shortest path in O(V + E)" `
    "All-Pairs Shortest Path using Dynamic Programming with O(V^3) time and O(V^2) space" `
    "Minimum spanning tree in O(E log E)" `
    "Topological sorting in O(V^2)" 1 `
    "Floyd-Warshall computes shortest distances between all pairs of vertices by considering each vertex k as an intermediate hop: dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j]) in O(V^3)."

Add-Q 16 7 "Medium" "What is a Minimum Spanning Tree (MST) of a connected, weighted, undirected graph?" `
    "A tree containing all vertices with maximum total edge weight" `
    "A subset of edges that connects all V vertices together without cycles, with the minimum possible total edge weight (having exactly V - 1 edges)" `
    "The shortest path between source and destination" `
    "A spanning tree where all edges have identical weight" 1 `
    "An MST spans all V vertices using exactly V - 1 edges without cycles while minimizing the sum of edge weights."

Add-Q 16 8 "Hard" "In Kruskal's Algorithm for MST, what data structure is used to detect and prevent cycles when adding edges?" `
    "Binary Search Tree" `
    "Disjoint Set Union (DSU / Union-Find) with Union by Rank and Path Compression" `
    "Adjacency Matrix" `
    "PriorityQueue of vertices" 1 `
    "Kruskal sorts all edges by weight ascending. For each edge (u, v), DSU checks find(u) != find(v). If roots differ, the edge does not form a cycle; it is added to the MST and union(u, v) is called."

Add-Q 16 9 "Medium" "What is the time complexity of Kruskal's Algorithm on a graph with V vertices and E edges?" `
    "O(V^2)" `
    "O(E log E) or O(E log V) dominated by sorting the edges" `
    "O(V * E)" `
    "O(V^3)" 1 `
    "Sorting E edges takes O(E log E). The nearly O(1) DSU operations take O(E * alpha(V)). Because E <= V^2, log E is O(log V), making the overall runtime O(E log E)."

Add-Q 16 10 "Hard" "How does Prim's Algorithm differ from Kruskal's Algorithm in building a Minimum Spanning Tree?" `
    "Prim's algorithm works only on directed graphs" `
    "Prim's grows a single tree outward from an initial vertex by greedily adding the minimum weight cut edge; Kruskal's builds a forest across independent edges globally" `
    "Kruskal's uses priority queue of vertices; Prim's uses DSU" `
    "Prim's cannot handle weighted edges" 1 `
    "Prim's starts at a single vertex and continually attaches the cheapest edge connecting the growing tree to an unvisited vertex. Kruskal's greedily adds edges globally across the entire graph."

Add-Q 16 11 "Medium" "Which MST algorithm is generally faster for Dense Graphs where E is close to V^2?" `
    "Kruskal's Algorithm" `
    "Prim's Algorithm using an Adjacency Matrix (O(V^2) time)" `
    "Bellman-Ford Algorithm" `
    "Dijkstra's Algorithm" 1 `
    "For dense graphs (E ~ V^2), Prim's implemented with an adjacency matrix runs in O(V^2), outperforming Kruskal's O(V^2 log V) sorting overhead."

Add-Q 16 12 "Hard" "In 'Cheapest Flights Within K Stops', why does standard Dijkstra fail without tracking stop counts?" `
    "Dijkstra terminates on first visit" `
    "A cheaper path that uses MORE than K stops could settle a node early and prevent a slightly more expensive path that satisfies the <= K stops constraint from being explored" `
    "Dijkstra cannot handle flight prices" `
    "Flight graphs are directed acyclic graphs" 1 `
    "A node cannot be pruned solely on cost because a costlier arrival with fewer stops might be the only route able to reach destination within K stops. A modified Bellman-Ford (running K+1 relaxation rounds) or state-expanded Dijkstra solves this."

Add-Q 16 13 "Medium" "What is the Cut Property in Minimum Spanning Tree theory?" `
    "Cutting an edge creates two trees" `
    "For any cut partition of vertices into two subsets, the minimum-weight edge crossing the cut must belong to the Minimum Spanning Tree" `
    "Edges crossing cuts have negative weights" `
    "Trees cannot be partitioned" 1 `
    "The Cut Property proves the correctness of both Prim's and Kruskal's algorithms: the cheapest edge bridging any cut partition is guaranteed to be part of some MST."

Add-Q 16 14 "Hard" "In 'Network Delay Time' (signal sent from node K), what does the answer represent after running Dijkstra?" `
    "The minimum distance to any node" `
    "The maximum of the shortest distances from K to all other nodes (max(dist[1..N])); if any node is unreachable (dist == infinity), return -1" `
    "The sum of all edge weights" `
    "The number of vertices in graph" 1 `
    "The signal propagates concurrently across all paths. The total time for all nodes to receive the signal is the time taken for the last (farthest) node to be reached: max(dist[i])."

Add-Q 16 15 "Medium" "What is an Eulerian Path in a graph?" `
    "A path that visits every vertex exactly once" `
    "A trail in a finite graph that visits every EDGE exactly once" `
    "A cycle with minimum weight" `
    "A tree with no branches" 1 `
    "An Eulerian Path visits every edge in the graph exactly once. An Eulerian Circuit is an Eulerian path that starts and ends at the same vertex."

Add-Q 16 16 "Hard" "What condition guarantees the existence of an Eulerian Circuit in a connected undirected graph?" `
    "All vertices must have even degree" `
    "Exactly two vertices must have odd degree" `
    "All edges must have positive weights" `
    "The graph must be a complete bipartite graph" 0 `
    "In a connected undirected graph, an Eulerian Circuit exists if and only if every vertex has an EVEN degree (so every entry into a vertex has a corresponding exit)."

Add-Q 16 17 "Medium" "What is a Hamiltonian Path in graph theory?" `
    "A path that visits every edge exactly once" `
    "A path that visits every VERTEX exactly once" `
    "The shortest path between two vertices" `
    "A path with alternating edge signs" 1 `
    "A Hamiltonian Path visits every vertex in the graph exactly once (determining if one exists is NP-complete, unlike Eulerian paths which run in linear time)."

Add-Q 16 18 "Hard" "What are Bridges and Articulation Points in an undirected graph, and which algorithm finds them in O(V + E) time?" `
    "Edges/vertices whose removal disconnects the graph; found using Tarjan's DFS Algorithm using discovery times tin[u] and lowest reachable times low[u]" `
    "Dijkstra's algorithm" `
    "Floyd-Warshall algorithm" `
    "Kruskal's algorithm" 0 `
    "A bridge is an edge whose removal increases the number of connected components. Tarjan's DFS tracks discovery time tin and lowest reachable ancestor low. If low[v] > tin[u], edge (u, v) is a bridge."

Add-Q 16 19 "Medium" "In 'Path With Minimum Effort' (2D grid of heights), what defines the effort of a path?" `
    "The sum of all cell heights" `
    "The maximum absolute difference in heights between two consecutive cells along the path" `
    "The number of steps from start to finish" `
    "The product of elevation changes" 1 `
    "Effort is defined as the maximum absolute jump between adjacent cells on the route. Dijkstra or Binary Search + BFS finds the path that minimizes this peak jump."

Add-Q 16 20 "Hard" "What is Kosaraju's Algorithm used for in directed graphs?" `
    "Finding shortest paths" `
    "Finding all Strongly Connected Components (SCCs) in O(V + E) using two DFS passes and graph transposition (reversing edge directions)" `
    "Computing MST" `
    "Topological sorting of graphs with cycles" 1 `
    "Kosaraju's algorithm performs DFS to push nodes to a stack by finish time, transposes the graph (reverses all edges), and pops nodes from the stack to launch DFS discovering each SCC in O(V + E)."

Add-Q 16 21 "Medium" "Can a Minimum Spanning Tree have more than one valid configuration for a given graph?" `
    "Never; MST is always strictly unique" `
    "Yes, if multiple edges have identical weights, multiple different spanning trees can achieve the same minimum total weight" `
    "Only if the graph has negative weights" `
    "Only if the graph has an odd number of vertices" 1 `
    "If edge weights are not strictly distinct, different choices of equal-weight edges can form different spanning trees with identical minimum cost."

Add-Q 16 22 "Hard" "In 'Swim in Rising Water' (grid with elevation T), why can Dijkstra be used to find the minimum time to reach bottom-right?" `
    "Elevations are prime numbers" `
    "Dijkstra's priority queue can track min time to reach each cell, where cost to step to neighbor is max(current_time, grid[r][c])" `
    "Because water flows downhill" `
    "Dijkstra cannot be used" 1 `
    "The problem can be modeled as finding a path minimizing the maximum edge weight. Dijkstra with priority queue prioritizing min elevation ensures the earliest reachable path is found in O(N^2 log N)."

Add-Q 16 23 "Medium" "What is the inverse Ackermann function alpha(V) associated with Disjoint Set Union operations?" `
    "An exponentially growing function" `
    "An extremely slowly growing function that is practically <= 4 for any realistic universe size V <= 10^80" `
    "A function equal to log V" `
    "A constant value 10" 1 `
    "With union by rank and path compression, DSU operations run in O(alpha(V)) time per operation, which is effectively constant (alpha(V) < 5 for any conceivable input size)."

Add-Q 16 24 "Hard" "In 'Find the City With the Smallest Number of Neighbors at a Threshold Distance', which algorithm is ideal for computing pairwise distances when N <= 100?" `
    "Bellman-Ford run N times" `
    "Floyd-Warshall Algorithm (O(N^3))" `
    "Topological sort" `
    "BFS from node 0" 1 `
    "For N <= 100, Floyd-Warshall executes 100^3 = 1,000,000 operations, which runs in ~5ms. It computes all-pairs shortest paths, making it trivial to count reachable neighbors for each city."

Add-Q 16 25 "Medium" "If a connected graph has V vertices and V - 1 edges, can it contain any cycles?" `
    "Yes, always" `
    "No, a connected graph with V vertices and V - 1 edges is mathematically proven to be an acyclic tree" `
    "Only if weights are negative" `
    "Only if directed" 1 `
    "By definition in graph theory, any connected undirected graph with V vertices and V - 1 edges contains no cycles and is a tree."

# ==================== DAY 17: Dynamic Programming - 1D DP ====================
Add-Q 17 1 "Medium" "What two core properties must a problem exhibit to be solvable via Dynamic Programming?" `
    "Greedy choice and linear sorting" `
    "Overlapping Subproblems and Optimal Substructure" `
    "Divide and conquer with independent subproblems" `
    "Recursion with binary trees" 1 `
    "Dynamic Programming requires: 1. Optimal Substructure (optimal solution contains optimal solutions to subproblems), and 2. Overlapping Subproblems (same subproblems are solved repeatedly)."

Add-Q 17 2 "Hard" "In 'Climbing Stairs' (can climb 1 or 2 steps), what recurrence relation describes the number of distinct ways to reach step n?" `
    "dp[n] = dp[n - 1] * dp[n - 2]" `
    "dp[n] = dp[n - 1] + dp[n - 2] (Fibonacci sequence with base cases dp[1] = 1, dp[2] = 2)" `
    "dp[n] = 2^n" `
    "dp[n] = dp[n - 1] + 1" 1 `
    "To reach step n, you must arrive either from step n-1 (taking a 1-step hop) or from step n-2 (taking a 2-step hop). Thus total ways is the sum: dp[n] = dp[n-1] + dp[n-2]."

Add-Q 17 3 "Medium" "What is the difference between Memoization and Tabulation in Dynamic Programming?" `
    "Memoization is bottom-up iterative; Tabulation is top-down recursive" `
    "Memoization is top-down recursive caching results; Tabulation is bottom-up iterative filling a table starting from base cases" `
    "Memoization uses more time than tabulation" `
    "Tabulation cannot optimize space" 1 `
    "Top-down Memoization starts at the goal and recurses downward, storing solved subproblem results. Bottom-up Tabulation starts from initial base cases and builds solutions iteratively."

Add-Q 17 4 "Hard" "In 'Coin Change I' (fewest coins to make amount A), what is the DP state transition relation?" `
    "dp[a] = dp[a - 1] + 1" `
    "dp[a] = min(dp[a], dp[a - coin] + 1) for every coin <= a, with base case dp[0] = 0 and all other dp initialized to infinity" `
    "dp[a] = a / max(coins)" `
    "Greedily pick the largest coin" 1 `
    "At amount 'a', trying each available coin yields candidate subproblems of size (a - coin). The minimum coins needed is 1 + min(dp[a - coin]), solved in O(A * len(coins)) time."

Add-Q 17 5 "Medium" "In 'House Robber I' (cannot rob adjacent houses), what is the DP recurrence for house i?" `
    "dp[i] = dp[i - 1] + nums[i]" `
    "dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])" `
    "dp[i] = max(nums[i], nums[i - 1])" `
    "dp[i] = dp[i - 2]" 1 `
    "At house i, the robber either skips house i (retaining max loot from house i-1) or robs house i (adding nums[i] to max loot from house i-2). Taking max of both choices optimizes loot."

Add-Q 17 6 "Hard" "In 'House Robber II' (houses arranged in a circle where house 0 is adjacent to house N-1), how is this solved using 'House Robber I'?" `
    "Rob all even houses" `
    "Run House Robber I twice: once for houses [0 to N-2] and once for houses [1 to N-1]; the answer is max of both runs" `
    "Divide loot by 2" `
    "Circular houses cannot be solved with DP" 1 `
    "Because houses 0 and N-1 are adjacent, you can never rob both. The optimal strategy either excludes house N-1 (range [0..N-2]) or excludes house 0 (range [1..N-1]), taking max of both linear DP passes."

Add-Q 17 7 "Medium" "How can space complexity of 'Climbing Stairs' or 'House Robber' be reduced from O(N) to O(1)?" `
    "By using bitwise shift operators" `
    "By maintaining only the last two computed state variables (prev1 and prev2) instead of an entire array of size N" `
    "By running binary search" `
    "By compressing the numbers" 1 `
    "Because computing dp[i] only depends on dp[i-1] and dp[i-2], storing just two running variables (prev1, prev2) reduces auxiliary space to O(1)."

Add-Q 17 8 "Hard" "In 'Longest Increasing Subsequence' (LIS), what are the time complexities of the standard DP approach versus the Patience Sorting / Binary Search approach?" `
    "Standard DP: O(N); Binary Search: O(1)" `
    "Standard DP: O(N^2); Binary Search with tails array: O(N log N)" `
    "Standard DP: O(2^N); Binary Search: O(N^2)" `
    "Both are O(N log N)" 1 `
    "Standard DP compares every pair (i, j) with j < i in O(N^2). Maintaining a 'tails' array where tails[len] holds the smallest tail element of an increasing subsequence of that length achieves O(N log N) via binary search."

Add-Q 17 9 "Medium" "In 'Word Break I' (can string s be segmented into dictionary words?), what is the DP state definition?" `
    "dp[i] is true if the prefix s[0..i] can be segmented into valid dictionary words" `
    "dp[i] counts the number of letters in word i" `
    "dp[i] stores the ASCII hash of word i" `
    "dp[i] is true if word i contains vowels" 0 `
    "dp[i] = true if there exists some index j < i such that dp[j] == true and dictionary contains substring s[j..i], running in O(N^2) time."

Add-Q 17 10 "Hard" "In 'Decode Ways' (mapping '1'->'A' to '26'->'Z'), why does a character '0' require special handling?" `
    "'0' by itself does not map to any letter; it is only valid when preceded by '1' or '2' (as '10' or '20')" `
    "'0' converts to character '@'" `
    "'0' terminates the string immediately" `
    "'0' can be decoded as 'Z'" 0 `
    "There is no mapping for '0' alone. If s[i] == '0', single-digit decoding contributes 0. If paired with previous digit as '10' or '20', it decodes as a valid 2-digit number; otherwise the string is invalid."

Add-Q 17 11 "Medium" "In 'Coin Change II' (count total number of combinations that make up amount A), how do the loops prevent counting duplicate permutations?" `
    "Iterate through amounts in outer loop, coins in inner loop" `
    "Iterate through coins in the OUTER loop and amounts in the INNER loop (ensuring each coin type is considered in a fixed order)" `
    "Sort the coins descending" `
    "Divide final count by number of coins" 1 `
    "Looping over coins in the outer loop ensures coin denominations are processed in fixed order, counting unique combinations rather than order-dependent permutations."

Add-Q 17 12 "Hard" "In 'Partition Equal Subset Sum' (can array be partitioned into two subsets with equal sum), what classical problem is this reduced to?" `
    "Longest Common Subsequence" `
    "0/1 Knapsack Problem with target capacity = sum(nums) / 2" `
    "Maximum Flow in graph" `
    "Shortest Path Dijkstra" 1 `
    "If total array sum is odd, equal partition is impossible. If even, the task reduces to finding whether any subset sums to target = total_sum / 2, solvable using boolean 1D DP in O(N * target) time."

Add-Q 17 13 "Medium" "In 'Jump Game I' (can you reach the last index), what is the greedy invariant that replaces DP in O(N) time and O(1) space?" `
    "Jump by 1 at every step" `
    "Track max_reachable_index = max(max_reachable_index, i + nums[i]); if i > max_reachable, return false" `
    "Always make the maximum jump" `
    "Sort the jump lengths" 1 `
    "Iterating through the array, if the current index i is within max_reachable, update max_reachable = max(max_reachable, i + nums[i]). If max_reachable >= n - 1, the end is reachable."

Add-Q 17 14 "Hard" "In 'Jump Game II' (minimum jumps to reach last index), how do we track jump boundaries greedily in O(N) time?" `
    "Run BFS on all indices in O(N^2)" `
    "Maintain 'current_jump_end' and 'farthest_reach'; when index i reaches current_jump_end, increment jumps and update current_jump_end = farthest_reach" `
    "Use binary search on jump lengths" `
    "Jump only from indices with even values" 1 `
    "Every step explores candidate destinations. When index i reaches the boundary of the current jump, a jump is committed, advancing current_jump_end to the farthest reach found so far."

Add-Q 17 15 "Medium" "In 'Maximum Subarray' (Kadane's Algorithm viewed as 1D DP), what is the recurrence relation?" `
    "dp[i] = nums[i] + dp[i - 1]" `
    "dp[i] = max(nums[i], nums[i] + dp[i - 1]) where dp[i] is max subarray sum ending at index i" `
    "dp[i] = max(dp[i - 1], dp[i - 2])" `
    "dp[i] = sum(nums[0..i])" 1 `
    "dp[i] represents the maximum subarray sum ending at index i. Either extend the previous subarray (dp[i-1] + nums[i]) or start fresh at nums[i]."

Add-Q 17 16 "Hard" "In 'Russian Doll Envelopes' (envelopes [w, h]), how does sorting reduce the problem to Longest Increasing Subsequence (LIS)?" `
    "Sort width ascending, and sort height DESCENDING for identical widths; then find LIS on heights" `
    "Sort both width and height ascending" `
    "Sort width descending, height descending" `
    "Sort by envelope area" 0 `
    "Sorting width ascending ensures width increases. Sorting height descending for matching widths ensures that two envelopes with the same width cannot nest inside one another when running LIS on heights."

Add-Q 17 17 "Medium" "In 'Integer Break' (break positive integer n into sum of at least two positive integers to maximize product), what mathematical number should factors predominantly be?" `
    "2" `
    "3" `
    "5" `
    "n / 2" 1 `
    "Mathematically (since e approx 2.718 maximizes x^(1/x)), breaking n into as many factors of 3 as possible (with remaining 2s or 4s) maximizes the product."

Add-Q 17 18 "Hard" "In 'Perfect Squares' (least number of perfect square numbers summing to n), what theorem bounds the answer to at most 4?" `
    "Euler's Totient Theorem" `
    "Lagrange's Four-Square Theorem" `
    "Fermat's Last Theorem" `
    "Pythagorean Theorem" 1 `
    "Lagrange's Four-Square Theorem states that every natural number can be represented as the sum of four integer squares. Legendre proved that answer is 4 if and only if n is of the form 4^k * (8m + 7)."

Add-Q 17 19 "Medium" "What is the time complexity of the DP solution to find the N-th Fibonacci number?" `
    "O(2^N) naive recursive" `
    "O(N) time and O(1) space with tabulation / memoization" `
    "O(N^2)" `
    "O(N!)" 1 `
    "Iteratively computing fib[i] = fib[i-1] + fib[i-2] takes O(N) time and O(1) memory, compared to exponential O(2^N) for naive recursion."

Add-Q 17 20 "Hard" "In 'Combination Sum IV' (order matters: [1, 2] is different from [2, 1]), what is the DP recurrence?" `
    "dp[target] = sum(dp[target - num]) for all num <= target, with base case dp[0] = 1" `
    "dp[target] = max(dp[target - num])" `
    "dp[target] = target * len(nums)" `
    "Identical to Coin Change II" 0 `
    "Because permutations are counted as distinct, target is placed in the outer loop. Any permutation summing to 'target' ends with some number 'num', giving dp[target] = sum(dp[target - num])."

Add-Q 17 21 "Medium" "What is the base case in dynamic programming?" `
    "The most complex subproblem" `
    "The simplest, smallest subproblem that can be solved directly without further recursive division or state transitions" `
    "The size of the input array" `
    "A condition that triggers memory allocation" 1 `
    "Base cases provide fixed starting values (e.g. dp[0] = 0 or dp[0] = 1) from which all subsequent state transitions build."

Add-Q 17 22 "Hard" "In 'Number of Longest Increasing Subsequence', what two arrays are maintained in O(N^2) time?" `
    "lengths[i] (length of LIS ending at i) and counts[i] (number of LIS of that length ending at i)" `
    "indices[i] and values[i]" `
    "sums[i] and products[i]" `
    "prefix[i] and suffix[i]" 0 `
    "lengths[i] stores the max LIS length ending at i. counts[i] sums counts[j] for all j < i with nums[j] < nums[i] that match lengths[j] == lengths[i] - 1."

Add-Q 17 23 "Medium" "What does 'optimal substructure' mean?" `
    "The problem can be solved in O(1) time" `
    "An optimal solution to the overall problem can be constructed from optimal solutions to its constituent subproblems" `
    "The code structure is cleanly formatted" `
    "All variables are declared globally" 1 `
    "Optimal substructure implies that optimizing smaller sub-problems guarantees the optimal composite solution (e.g. shortest path from A to C via B requires shortest path from A to B)."

Add-Q 17 24 "Hard" "In 'Palindromic Substrings' (count all palindromic substrings), what is the time and space complexity of the 'Expand Around Center' approach?" `
    "O(N^3) time and O(N) space" `
    "O(N^2) time and O(1) auxiliary space (expanding from 2N - 1 possible centers)" `
    "O(N log N) time and O(N^2) space" `
    "O(N) time using Manacher's algorithm" 1 `
    "Every palindrome has a center: N odd centers (single letters) and N-1 even centers (between adjacent letters). Expanding outward from each of the 2N-1 centers checks all palindromes in O(N^2) time and O(1) space."

Add-Q 17 25 "Medium" "What is the primary risk of using top-down memoization without tail recursion in languages with limited stack size?" `
    "Heap fragmentation" `
    "StackOverflowError on large input depths" `
    "Loss of data precision" `
    "CPU throttling" 1 `
    "Deep recursion pushes thousands of activation records onto the call stack, risking StackOverflowError when recursion depth exceeds thread stack limits (whereas bottom-up iteration uses heap/array storage safely)."

Write-Output "Days 14, 15, 16, 17 loaded."
