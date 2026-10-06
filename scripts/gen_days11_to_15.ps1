# Generator for Days 11 to 15 (125 Unique Questions)

# ==================== DAY 11: Stack & Queue Data Structures ====================
Add-Q 11 1 "Medium" "In 'Valid Parentheses', what condition indicates an invalid string when encountering a closing bracket?" `
    "The stack is empty, or the popped opening bracket does not match the closing bracket type" `
    "The stack contains more than 10 elements" `
    "The character is lowercase" `
    "The string length is an even number" 0 `
    "If the stack is empty upon seeing a closer, there is no corresponding opener. If the top opener does not match (e.g. '(' with ']'), the bracket nesting is corrupt."

Add-Q 11 2 "Hard" "In 'Min Stack' (getMin() in O(1) time), how can it be implemented using a single stack without extra memory overhead?" `
    "Store encoded values: when pushing a new min, push (2 * val - current_min); decode during pop" `
    "Sort the stack after every push" `
    "Scan the stack linearly during getMin()" `
    "Recompute min using recursion" 0 `
    "Value encoding trick: if val < min, push (2*val - min) and update min = val. During pop, if top < min, the previous min is restored as 2*min - top, maintaining O(1) time and O(1) extra space."

Add-Q 11 3 "Medium" "In 'Next Greater Element' using a Monotonic Stack, what invariant is maintained by the stack?" `
    "Monotonically Decreasing Stack: elements are popped when the current element is greater than stack top" `
    "Monotonically Increasing Stack: elements are sorted ascending" `
    "Alternating positive and negative numbers" `
    "Circular FIFO order" 0 `
    "A decreasing stack retains unresolved elements. When an incoming element is larger than the stack top, it represents the 'next greater element' for all smaller popped items."

Add-Q 11 4 "Hard" "In 'Largest Rectangle in Histogram' (Hard), what determines the left and right boundary for a bar when popped from the monotonic stack?" `
    "Bar index + 1" `
    "Right boundary is the current index i; Left boundary is the new stack top after popping; width = i - stack.peek() - 1" `
    "Always width = 1" `
    "Width = total array size" 1 `
    "Because the stack maintains indices of increasing heights, for the popped bar, the current index i is the first bar shorter to its right, and the new stack top is the first bar shorter to its left."

Add-Q 11 5 "Medium" "How does 'Daily Temperatures' find how many days you have to wait until a warmer temperature?" `
    "Two nested loops in O(N^2)" `
    "Monotonic decreasing stack storing day indices; pop when temperature[i] > temperature[stack.top], recording wait time = i - stack.top" `
    "Sort temperatures ascending" `
    "Use a hash map of temperatures" 1 `
    "Store indices on a decreasing stack. When a warmer day i arrives, pop colder indices j and calculate answer[j] = i - j in O(N) total time."

Add-Q 11 6 "Hard" "How is 'Maximal Rectangle' (largest rectangle containing only 1s in a 2D binary matrix) solved using 'Largest Rectangle in Histogram'?" `
    "Count total 1s in the matrix" `
    "Treat each row as a histogram base, updating heights (heights[j] = matrix[i][j] == '1' ? heights[j] + 1 : 0), and running histogram algorithm on each row in O(R * C) time" `
    "Check all 4 corners of every sub-matrix" `
    "Run 2D prefix sums and check all areas" 1 `
    "Each row forms the baseline of a histogram where consecutive 1s represent bar heights. Running the O(C) monotonic stack histogram algorithm for each of the R rows solves the problem in O(R * C)."

Add-Q 11 7 "Medium" "How can a Queue be implemented using Two Stacks (inbox and outbox) with amortized O(1) time per operation?" `
    "Push to inbox; on pop/peek, if outbox is empty, pop all elements from inbox and push to outbox; pop from outbox" `
    "Swap stacks on every push" `
    "Pop elements recursively" `
    "Store elements in reverse order in both stacks" 0 `
    "Pushing always appends to inbox (O(1)). Pop/peek pulls from outbox. When outbox empties, transfer all elements from inbox to outbox (reversing order into FIFO). Each element is transferred once, giving amortized O(1)."

Add-Q 11 8 "Hard" "In 'Online Stock Span', what information does each element in the monotonic stack store?" `
    "Only the stock price" `
    "A pair: (price, span), where smaller preceding prices are popped and their spans are summed into the current span" `
    "Average stock price over 7 days" `
    "Opening and closing bell timestamps" 1 `
    "Storing (price, span) on a decreasing stack allows collapsing consecutive smaller prices in O(1) amortized time by popping them and accumulating their spans into the current day's span."

Add-Q 11 9 "Medium" "In 'Evaluate Reverse Polish Notation' (Postfix notation like ['2', '1', '+', '3', '*']), what role does the stack play?" `
    "Store operators and apply them to variables" `
    "Push operands (numbers); when an operator is encountered, pop two operands, apply the operator, and push the result back" `
    "Reverse the tokens list" `
    "Convert numbers to hexadecimal" 1 `
    "Postfix notation places operators after operands. A stack collects operands. Each operator consumes the top two numbers, performs the operation, and pushes the result back onto the stack."

Add-Q 11 10 "Hard" "In 'Basic Calculator' (evaluating expressions with '+', '-', '(', ')'), how do parentheses and signs interact with the stack?" `
    "Parentheses multiply the numbers by 10" `
    "When '(' is encountered, push current running result and sign onto stack; when ')' is reached, pop sign and previous result, combining with inner expression value" `
    "Remove all parentheses before evaluation" `
    "Evaluate operators from right to left" 1 `
    "A stack maintains context before nested sub-expressions: on '(', push result and sign, resetting result = 0 and sign = 1. On ')', pop sign and previous result to resume the outer calculation."

Add-Q 11 11 "Medium" "What is the primary condition for a Circular Queue to be considered full when using an array of capacity C with head and tail pointers?" `
    "(tail + 1) % C == head" `
    "tail == head" `
    "tail == C - 1" `
    "head == 0" 0 `
    "In a fixed circular buffer of size C, reserving one slot or using a size counter differentiates empty from full. With one reserved slot, (tail + 1) % C == head indicates the buffer is full."

Add-Q 11 12 "Hard" "In 'Decode String' (e.g. '3[a2[c]]' -> 'accaccacc'), what two stacks are commonly utilized?" `
    "A character stack and an integer stack (countStack for repeat multipliers, strStack for partial string buffers)" `
    "A stack of regex patterns" `
    "A priority queue and a deque" `
    "Two stacks of ASCII values" 0 `
    "Nested brackets require maintaining context: countStack pushes repeat counts k, while strStack pushes the accumulated prefix string before '[', popping and repeating when ']' is reached."

Add-Q 11 13 "Medium" "What is the time complexity of pushing and popping elements from an ArrayDeque in Java / C++ std::deque?" `
    "O(N)" `
    "Amortized O(1) for both push and pop at both ends" `
    "O(log N)" `
    "O(N^2)" 1 `
    "ArrayDeque uses a resizable circular array, providing amortized O(1) time complexity for additions and removals at both ends without linked list node allocation overhead."

Add-Q 11 14 "Hard" "In 'Remove Duplicate Letters' (smallest lexicographical order without duplicates), what three mechanisms guide the monotonic stack?" `
    "Sorting the string descending" `
    "A monotonic increasing stack, a last-occurrence index map (to ensure characters aren't discarded permanently), and a visited boolean set (to skip already present characters)" `
    "A Trie of unique substrings" `
    "Bitwise rotation of ASCII codes" 1 `
    "Characters are pushed to an increasing stack. If current char < stack top, we pop stack top ONLY IF stack top appears again later in the string (verified by last-index map), keeping result lexicographically smallest."

Add-Q 11 15 "Medium" "What is the data structure invariant of a Monotonic Increasing Stack?" `
    "Elements in the stack are strictly increasing from bottom to top" `
    "Elements in the stack are strictly decreasing from bottom to top" `
    "Elements can be in any random order" `
    "Only even numbers are allowed" 0 `
    "In a monotonic increasing stack, each newly pushed element must be strictly greater than the element below it; any element violating this property is popped first."

Add-Q 11 16 "Hard" "In '132 Pattern' (nums[i] < nums[k] < nums[j] with i < j < k), how does traversing backward with a stack find the pattern in O(N) time?" `
    "Track running minimum from left" `
    "Traverse from right: maintain 'nums[k]' as the largest popped candidate from a monotonic decreasing stack (representing 'nums[j]'); if current nums[i] < nums[k], pattern is found" `
    "Sort the array and take first three elements" `
    "Use three nested loops in O(N^3)" 1 `
    "Scanning from right to left: a decreasing stack holds candidate 'nums[j]' values. When a larger number arrives, popped items become candidate 'nums[k]' (the 2 in 132). Any subsequent number < nums[k] immediately confirms 132."

Add-Q 11 17 "Medium" "In 'Simplify Path' (Unix-style canonical path like '/a/./b/../../c/'), what does the '..' token trigger in the stack?" `
    "Push '..' onto stack" `
    "Pop the top directory from the stack (if non-empty) to navigate up one level" `
    "Clear the entire stack" `
    "Throw a FileNotFound exception" 1 `
    "Splitting path by '/' gives tokens. '.' and empty tokens are ignored. '..' pops the last directory name from the stack if present, navigating back up the directory tree."

Add-Q 11 18 "Hard" "In 'Asteroid Collision' (positive moves right, negative moves left), when does collision occur?" `
    "When a positive asteroid follows a negative asteroid" `
    "When a negative asteroid is moving left while stack top has a positive asteroid moving right (top > 0 && curr < 0)" `
    "When two asteroids have identical masses" `
    "Whenever any two asteroids are adjacent" 1 `
    "Asteroids moving in opposite directions only collide if the left one moves right (positive) and the right one moves left (negative). If stack top is negative and curr is positive, they move apart without colliding."

Add-Q 11 19 "Medium" "What is the output of popping all elements from a stack where elements 1, 2, 3, 4 were pushed in that order?" `
    "1, 2, 3, 4" `
    "4, 3, 2, 1" `
    "2, 1, 4, 3" `
    "Random order" 1 `
    "A stack is a Last-In, First-Out (LIFO) structure. The last element pushed (4) is the first element popped, followed by 3, 2, and 1."

Add-Q 11 20 "Hard" "In 'Car Fleet' (target distance, positions, and speeds), how does sorting positions descending simplify the problem?" `
    "Allows cars to overtake each other" `
    "Cars closer to target are processed first: compute time to target (target - pos) / speed. If a car behind arrives earlier or at the same time as the fleet ahead, it joins that fleet without creating a new fleet" `
    "Cars sort by speed" `
    "Reduces the problem to binary search" 1 `
    "Sorting by position descending processes leading cars first. If car i takes less or equal time than the fleet in front, it is blocked and merges into that fleet. A monotonic stack counts distinct fleet arrival times."

Add-Q 11 21 "Medium" "Which operation on a standard Stack is considered undefined or causes an error when the stack contains zero elements?" `
    "Push" `
    "Pop or Peek / Top" `
    "isEmpty" `
    "Size" 1 `
    "Calling pop() or peek() on an empty stack results in a Stack Underflow error or EmptyStackException."

Add-Q 11 22 "Hard" "In 'Sum of Subarray Minimums' (Medium-Hard), how does monotonic stack compute the total contribution of each element nums[i] in O(N)?" `
    "By sorting the array" `
    "By finding the distance to previous smaller element (ple) and next smaller element (nle); contribution = nums[i] * ple * nle" `
    "By evaluating all subarrays in O(N^2)" `
    "By dynamic programming table" 1 `
    "Each element nums[i] acts as the minimum for all subarrays spanning between its Previous Less Element and Next Less Element. Multiplying (i - ple) * (nle - i) * nums[i] sums all contributions in O(N)."

Add-Q 11 23 "Medium" "What is the amortized cost of pushing an element onto a dynamically resizing stack (doubling array strategy)?" `
    "O(N)" `
    "O(1)" `
    "O(log N)" `
    "O(N^2)" 1 `
    "Although resizing copies N elements when capacity is exceeded, resizing occurs infrequently (powers of 2). Spreading the cost across all insertions gives an amortized O(1) push time."

Add-Q 11 24 "Hard" "In 'Remove All Adjacent Duplicates in String II' (remove k duplicate adjacent characters), what does the stack store?" `
    "Only the characters" `
    "Pairs of (character, current_consecutive_count); when count reaches k, pop the element" `
    "Indices of all duplicates" `
    "A hash set of k-grams" 1 `
    "Storing (char, count) allows tracking consecutive runs in O(N). If incoming char matches top, increment count; if count == k, pop the pair in O(1)."

Add-Q 11 25 "Medium" "Which real-world computing mechanism relies directly on a Call Stack?" `
    "Routing network packets across routers" `
    "Managing function invocation activation records, return addresses, and local variables" `
    "Disk sector defragmentation" `
    "GPU graphics rendering pipelines" 1 `
    "The CPU call stack manages function execution, storing the instruction return address, caller-saved registers, and local stack variables for each nested function invocation."

# ==================== DAY 12: Trees & Traversals (DFS / BFS) ====================
Add-Q 12 1 "Medium" "Which binary tree traversal visits nodes in the order: Left Subtree -> Root -> Right Subtree?" `
    "Preorder Traversal" `
    "Inorder Traversal" `
    "Postorder Traversal" `
    "Level Order Traversal" 1 `
    "Inorder traversal visits Left, then Root, then Right. For a Binary Search Tree (BST), inorder traversal produces values in strictly sorted ascending order."

Add-Q 12 2 "Hard" "In 'Lowest Common Ancestor of a Binary Tree' (general binary tree, not BST), what is the recursive postorder logic?" `
    "If current root is null or p or q, return root. Recurse left and right. If both left and right return non-null, root is the LCA; otherwise return the non-null child" `
    "Compare values of p and q with root.val" `
    "Find depth of p and depth of q" `
    "Traverse tree using BFS and take first common node" 0 `
    "Postorder recursion bubbles matches up: if one target is found in the left subtree and the other in the right subtree, the current node is their lowest split point (LCA)."

Add-Q 12 3 "Medium" "How does Level Order Traversal (BFS) of a binary tree track nodes level by level?" `
    "Using a Stack" `
    "Using a Queue (enqueue root; in while loop: size = queue.size(); process 'size' nodes; enqueue their left and right children)" `
    "Using recursion without data structures" `
    "Using a PriorityQueue sorted by node value" 1 `
    "BFS uses a Queue. Recording queue.size() at the start of each level processes all nodes at the current depth in a batch before moving to the next level."

Add-Q 12 4 "Hard" "In 'Binary Tree Maximum Path Sum' (Hard), why can a node return at most 'node.val + max(0, max(leftGain, rightGain))' to its parent?" `
    "Because path values cannot exceed 1000" `
    "Because a valid path cannot branch twice; the parent can only extend the path through one child subtree" `
    "Because negative numbers are prohibited" `
    "To prevent stack overflow" 1 `
    "While the path sum through the current node can combine (node.val + left + right) to update the global max, the value returned to the parent must be a single unbranched ray: node.val + max(left, right)."

Add-Q 12 5 "Medium" "What is the Maximum Depth (Height) of a binary tree with a single root node?" `
    "0 or 1 depending on convention (LeetCode convention is 1)" `
    "2" `
    "-1" `
    "Infinite" 0 `
    "Under standard node-counting height convention, a single node has depth 1 (under edge-counting convention, depth 0). A null tree has depth 0."

Add-Q 12 6 "Hard" "Can a unique Binary Tree be reconstructed given only its Preorder and Postorder traversals?" `
    "Yes, always" `
    "No, not in general, unless every internal node has strictly two children (Full Binary Tree)" `
    "Yes, if all node values are unique" `
    "Yes, by using a hash map" 1 `
    "If a node has only one child, preorder and postorder traversals cannot distinguish whether that child is a left child or a right child. A unique reconstruction requires Inorder + Preorder or Inorder + Postorder."

Add-Q 12 7 "Medium" "What condition defines a Balanced Binary Tree (AVL height balance)?" `
    "Every node has two children" `
    "For every node in the tree, the height difference between its left and right subtrees is at most 1" `
    "All leaf nodes are at the exact same depth" `
    "Left child value is smaller than right child value" 1 `
    "Height balance requires that for every node, |height(left) - height(right)| <= 1, guaranteeing O(log N) search height."

Add-Q 12 8 "Hard" "In 'Construct Binary Tree from Preorder and Inorder Traversal', how do you find the root and divide subtrees in O(N) time?" `
    "Root is the first element of Preorder; look up its index in Inorder using a HashMap to determine left and right subtree sizes" `
    "Root is the middle element of Inorder" `
    "Root is the last element of Preorder" `
    "Sort both arrays first" 0 `
    "Preorder gives the root as preorder[preStart]. A precomputed HashMap locates root in inorder in O(1). Nodes to its left belong to the left subtree, and nodes to its right belong to the right subtree."

Add-Q 12 9 "Medium" "What is the Diameter of a Binary Tree?" `
    "The number of leaf nodes in the tree" `
    "The length of the longest path between any two nodes in the tree (which may or may not pass through the root)" `
    "The width of the widest level in BFS" `
    "The maximum depth of the left subtree" 1 `
    "The diameter is the maximum distance (number of edges or nodes) between any two arbitrary nodes in the tree, computed during postorder traversal as max(left_height + right_height)."

Add-Q 12 10 "Hard" "In 'Morris Inorder Traversal', how is O(1) auxiliary space achieved without recursion or a stack?" `
    "By modifying node values" `
    "By creating temporary threaded links from the rightmost node of the left subtree (inorder predecessor) to the current root, and removing them upon return" `
    "By storing pointers in an array" `
    "By compressing the tree into a heap" 1 `
    "Morris traversal threads the binary tree by pointing the inorder predecessor's right child to the current node. On the second visit, the thread is removed and the node is visited, achieving O(1) space."

Add-Q 12 11 "Medium" "In 'Symmetric Tree' (mirror reflection check), what two conditions must hold for nodes t1 and t2?" `
    "t1.val == t2.val, and isMirror(t1.left, t2.right) && isMirror(t1.right, t2.left)" `
    "t1.val == t2.val, and isMirror(t1.left, t2.left)" `
    "t1 and t2 must both be leaf nodes" `
    "t1 must be parent of t2" 0 `
    "Symmetry requires mirror reflection: outer subtrees must mirror each other (t1.left with t2.right) and inner subtrees must mirror each other (t1.right with t2.left)."

Add-Q 12 12 "Hard" "In 'Serialize and Deserialize Binary Tree', how are null children represented in Preorder serialization?" `
    "They are omitted completely" `
    "They are recorded with a sentinel marker (like '#', 'null', or 'X') separated by delimiters" `
    "They are assigned value 0" `
    "They are assigned negative infinity" 1 `
    "Recording sentinel null tokens (e.g. '1,2,#,#,3,4,#,#,5,#,#') preserves full structural information, allowing preorder reconstruction using a queue without needing an inorder traversal."

Add-Q 12 13 "Medium" "What does the 'Binary Tree Right Side View' represent?" `
    "The right child of the root node only" `
    "The last node visible at each level when the tree is viewed from the right side" `
    "All nodes whose values are positive" `
    "Nodes in the right subtree only" 1 `
    "Right side view consists of the rightmost node at each depth level, easily captured as the last element visited in each BFS queue level or via DFS prioritizing right children first."

Add-Q 12 14 "Hard" "In 'Count Complete Tree Nodes' in O((log N)^2) time, how is the complete tree property exploited?" `
    "By counting nodes one by one in O(N)" `
    "Compare left height and right height: if left height == right height, left subtree is a full tree of size 2^h - 1; otherwise right subtree is full of size 2^(h-1) - 1" `
    "Use binary search on node values" `
    "Convert to linked list" 1 `
    "In a complete binary tree, at least one of the two subtrees at each node is guaranteed to be a perfect binary tree, whose size is 2^height - 1 in O(log N). Recursing on the other subtree gives O(log^2 N)."

Add-Q 12 15 "Medium" "In 'Binary Tree Zigzag Level Order Traversal', how does node processing alternate between levels?" `
    "Odd levels are skipped" `
    "Even levels are read left-to-right, odd levels right-to-left (alternating traversal direction at each level)" `
    "Nodes are sorted numerically at each level" `
    "Traverse diagonal paths" 1 `
    "Zigzag traversal alternates output order: level 0 left-to-right, level 1 right-to-left, level 2 left-to-right, implemented using a deque or by reversing list entries on alternating levels."

Add-Q 12 16 "Hard" "In 'All Nodes Distance K in Binary Tree', what step converts the tree into a structure where upward traversal is possible?" `
    "Convert node values to coordinates" `
    "Construct parent pointers using a HashMap (or treat tree as an undirected graph), then perform BFS starting from the target node up to distance K" `
    "Invert the binary tree" `
    "Calculate LCA of all nodes" 1 `
    "Because binary tree nodes lack parent references, building a child-to-parent mapping converts the tree into an undirected graph, allowing standard BFS outward from target node up to radius K."

Add-Q 12 17 "Medium" "In 'Invert / Flip Binary Tree', what is the operation performed at each node?" `
    "Negate node.val" `
    "Swap the left and right child pointers: TreeNode temp = root.left; root.left = root.right; root.right = temp; recurse" `
    "Rotate the tree 90 degrees" `
    "Delete leaf nodes" 1 `
    "Inverting a binary tree swaps the left and right child subtrees of every node recursively."

Add-Q 12 18 "Hard" "In 'Maximum Width of Binary Tree' (including null nodes between endpoints), how are node indices assigned to prevent 32-bit integer overflow?" `
    "Random hashing" `
    "Standard heap indexing (root = 0, left = 2*i + 1, right = 2*i + 2) normalized by subtracting the level's minimum index at the start of each level" `
    "Modulo 10^9 + 7 on all operations" `
    "Ignoring null nodes completely" 1 `
    "Full binary tree indexing doubles at each depth, causing integer overflow. Subtracting the first node's index at the current level keeps relative offsets small, avoiding overflow while computing width = (last_idx - first_idx + 1)."

Add-Q 12 19 "Medium" "What is the maximum number of nodes in a Binary Tree of height H (root at height 1)?" `
    "2^H" `
    "2^H - 1" `
    "H^2" `
    "2 * H" 1 `
    "A perfect binary tree of height H has sum_{i=0}^{H-1} 2^i = 2^H - 1 nodes."

Add-Q 12 20 "Hard" "In 'Flatten Binary Tree to Linked List' in-place (preorder order as right-skewed linked list), how does Morris-like rewiring work?" `
    "Save nodes in an ArrayList and reconnect" `
    "For node curr: if it has a left child, find the rightmost node of left subtree, attach curr.right to its right, set curr.right = curr.left, set curr.left = null, advance curr = curr.right" `
    "Invert the tree first" `
    "Use recursion stack of size N" 1 `
    "Connecting curr.right to the predecessor of curr.left preserves the right subtree until the entire left subtree is traversed, flattening the tree in O(N) time and O(1) space."

Add-Q 12 21 "Medium" "In a Full Binary Tree, how many children does every internal node have?" `
    "At most 1 child" `
    "Exactly 2 children (no node has only 1 child)" `
    "At least 3 children" `
    "Children count is arbitrary" 1 `
    "A Full Binary Tree is a tree in which every node other than leaves has strictly two children."

Add-Q 12 22 "Hard" "In 'Vertical Order Traversal of a Binary Tree', how are nodes grouped and sorted?" `
    "By node values only" `
    "By horizontal column coordinate x (root x=0, left x-1, right x+1), row y, and node value for ties" `
    "By level order indices" `
    "By in-degree" 1 `
    "Each node is assigned coordinates (row, col). Group by column col ascending; within the same column, order by row ascending, and break ties by node value ascending."

Add-Q 12 23 "Medium" "What is the time complexity of traversing a binary tree with N nodes using DFS or BFS?" `
    "O(log N)" `
    "O(N) because every node is visited exactly once" `
    "O(N^2)" `
    "O(N log N)" 1 `
    "Every node and every edge is traversed once, yielding O(N) time complexity."

Add-Q 12 24 "Hard" "In 'Path Sum III' (path does not need to start at root or end at leaf), how is O(N) time achieved?" `
    "Run DFS from every single node in O(N^2)" `
    "Use Prefix Sum HashMap during DFS tracking count of running sums from root to current node" `
    "Sort tree nodes" `
    "Convert tree to BST" 1 `
    "Similar to 'Subarray Sum Equals K': maintain prefix sums in a HashMap during DFS. At node with running sum curSum, look up (curSum - targetSum) in map in O(1). Backtrack map state on exit for O(N) runtime."

Add-Q 12 25 "Medium" "Which traversal of a binary tree visits all nodes at depth d before visiting any nodes at depth d+1?" `
    "Preorder" `
    "Breadth-First Search (Level Order Traversal)" `
    "Postorder" `
    "Inorder" 1 `
    "Breadth-First Search explores nodes layer by layer in strictly increasing order of distance from the root."

# ==================== DAY 13: Binary Search Trees (BST) ====================
Add-Q 13 1 "Medium" "What is the core structural property of a Binary Search Tree (BST)?" `
    "Every node has two children" `
    "For every node X, all values in its left subtree are strictly less than X.val, and all values in its right subtree are strictly greater than X.val" `
    "Root is always the largest element" `
    "Height is strictly log N" 1 `
    "The BST property enforces that for any node X: all nodes in LeftSubtree(X) < X.val and all nodes in RightSubtree(X) > X.val."

Add-Q 13 2 "Hard" "In 'Validate Binary Search Tree', why is checking 'node.left.val < node.val && node.right.val > node.val' locally INSUFFICIENT?" `
    "It only checks immediate children; it fails to verify that ALL descendants in the left subtree are smaller than ancestor nodes" `
    "It causes null pointer exception" `
    "Node values can be strings" `
    "BST allows duplicate values" 0 `
    "A node in a left subtree could be greater than an ancestor root higher up (e.g. root 10, left 5, right child of left is 15 - valid locally but violates root 10). Passing valid range (min, max) bounds solves this."

Add-Q 13 3 "Medium" "What is the result of performing an Inorder Traversal on a valid Binary Search Tree?" `
    "Nodes in random order" `
    "Nodes in strictly sorted ascending order" `
    "Nodes sorted descending" `
    "Root node followed by leaves" 1 `
    "Because Inorder processes Left -> Root -> Right, in a BST it visits smaller values, current value, then larger values, yielding a strictly sorted sequence."

Add-Q 13 4 "Hard" "In 'Lowest Common Ancestor of a BST', how do you prune traversal using BST properties?" `
    "Explore both subtrees recursively" `
    "If both p.val and q.val are less than root.val, LCA is in left subtree; if both are greater, LCA is in right subtree; otherwise current root is the LCA" `
    "Check node depths" `
    "Convert BST to array" 1 `
    "If p and q both lie on one side of root, the split point must be deeper in that subtree. The first node where p and q split to opposite sides (or one equals root) is the LCA in O(H) time."

Add-Q 13 5 "Medium" "How do you find the Kth Smallest Element in a Binary Search Tree in O(H + K) time?" `
    "Postorder traversal" `
    "Inorder traversal with an iteration counter; return the node when counter reaches K" `
    "BFS traversal storing all nodes in a min-heap" `
    "Search root.left K times" 1 `
    "Since inorder traversal yields elements in ascending order, the K-th node visited during inorder traversal is guaranteed to be the K-th smallest element."

Add-Q 13 6 "Hard" "In 'Delete Node in a BST', what are the three structural cases when deleting target node Z?" `
    "Always delete root" `
    "1. Z is a leaf: remove it. 2. Z has one child: replace Z with its child. 3. Z has two children: replace Z's value with its inorder successor (min of right subtree) and delete that successor" `
    "Swap Z with root and delete" `
    "Reconstruct entire BST" 1 `
    "If Z has two children, its inorder successor (smallest element in right subtree) has at most one child and can safely replace Z while maintaining all BST invariants."

Add-Q 13 7 "Medium" "What is the worst-case time complexity of searching an element in an unbalance BST with N nodes?" `
    "O(1)" `
    "O(log N)" `
    "O(N) when the tree degenerates into a skewed linked list" `
    "O(N log N)" 2 `
    "If elements are inserted in sorted order (e.g. 1, 2, 3, 4, 5), the BST degenerates into a single long branch of height N, making search take linear O(N) time."

Add-Q 13 8 "Hard" "In 'Construct BST from Preorder Traversal' in O(N) time, what technique avoids repeatedly searching the split point?" `
    "Sort the preorder array" `
    "Maintain an upper bound constraint: pass 'bound' to recursive helper; consume next element if preorder[i] < bound, recursing for left (bound = curr) and right (bound = parent_bound)" `
    "Binary search on preorder" `
    "Build tree using BFS" 1 `
    "Passing an upper bound allows constructing each node in O(1) during a single forward pass over preorder array, completing the entire tree construction in strictly O(N) time."

Add-Q 13 9 "Medium" "In 'Convert Sorted Array to Binary Search Tree', how do you ensure the resulting BST is height-balanced?" `
    "Insert elements sequentially" `
    "Pick the middle element of the current range as root, and recursively construct left subtree from left half and right subtree from right half" `
    "Pick the first element as root" `
    "Shuffle the array randomly" 1 `
    "Choosing the median array element as root divides remaining elements equally between left and right subtrees, guaranteeing height balance |height(left) - height(right)| <= 1."

Add-Q 13 10 "Hard" "In 'Recover Binary Search Tree' (two nodes swapped by mistake), how do you detect the two swapped nodes during inorder traversal?" `
    "Check node colors" `
    "Find violations where prev.val > curr.val: first swapped node is 'prev' of the first violation; second swapped node is 'curr' of the last violation" `
    "Compare root with left and right children" `
    "Run BFS level by level" 1 `
    "In an inorder traversal, swapping two nodes creates one or two violations of prev.val > curr.val. Identifying these points allows swapping their values back in O(1) space using Morris traversal."

Add-Q 13 11 "Medium" "What is the Inorder Successor of a node in a BST?" `
    "The node's parent" `
    "The node with the smallest value strictly greater than the current node's value" `
    "The node's right child always" `
    "The largest leaf node" 1 `
    "The inorder successor is the next element in sorted sequence: if right subtree exists, it is the leftmost node in that right subtree; otherwise, it is the lowest ancestor whose left child is also an ancestor of the node."

Add-Q 13 12 "Hard" "In 'BST Iterator' (implementing next() and hasNext()), how is amortized O(1) time and O(H) space achieved?" `
    "Flatten entire tree into an array of size N" `
    "Use a Stack: push the node and all its left descendants down to the leftmost leaf; on next(), pop node and push all left descendants of its right child" `
    "Perform BFS on each call" `
    "Re-run Morris traversal on each next()" 1 `
    "The stack stores at most H nodes representing the current path. While an individual next() call may push multiple nodes, each node is pushed and popped at most once across all N calls, giving amortized O(1) time."

Add-Q 13 13 "Medium" "In 'Range Sum of BST', how do you prune search branches outside range [low, high]?" `
    "Visit all nodes unconditionally" `
    "If root.val < low, skip left subtree completely; if root.val > high, skip right subtree completely; if in range, include root.val and explore both" `
    "Delete nodes outside range" `
    "Sort node values" 1 `
    "Because left subtree nodes are strictly smaller than root, if root.val < low, all left subtree nodes are guaranteed < low and can be safely pruned, and vice versa."

Add-Q 13 14 "Hard" "How many structurally unique BSTs can be formed with N distinct keys (Unique Binary Search Trees I)?" `
    "2^N" `
    "Catalan Number C_n = (2n)! / ((n+1)! * n!)" `
    "N!" `
    "N^2" 1 `
    "Each choice of root i in 1..N leaves (i-1) keys for left subtree and (N-i) keys for right subtree. The total count follows the Catalan recurrence C_n = sum(C_{i-1} * C_{n-i})."

Add-Q 13 15 "Medium" "In 'Two Sum IV - Input is a BST', what is an efficient way to find two nodes summing to target K?" `
    "Quadratic search on all node pairs" `
    "Two BST Iterators (one forward yielding ascending values, one reverse yielding descending values), converging like two pointers on a sorted array in O(N) time and O(H) space" `
    "Negate all node values" `
    "Reconstruct BST as a heap" 1 `
    "Simulating the two-pointer technique using two BST iterators (normal inorder and reverse inorder) finds if two values sum to K in O(N) time and O(H) space without allocating an O(N) array."

Add-Q 13 16 "Hard" "What is the balance factor of a node in an AVL Tree and what values are permitted?" `
    "height(left) * height(right); must be positive" `
    "height(left) - height(right); must be in {-1, 0, 1}" `
    "depth(left) + depth(right); must be < 5" `
    "number of nodes in left subtree minus right subtree" 1 `
    "An AVL tree maintains the invariant that for every node, the height difference between left and right subtrees is at most 1 (balance factor in {-1, 0, 1}), restoring balance via tree rotations."

Add-Q 13 17 "Medium" "Which rotation restores balance in an AVL tree after an insertion into the left subtree of the left child (LL imbalance)?" `
    "Left Rotation" `
    "Right Rotation" `
    "Left-Right Double Rotation" `
    "Right-Left Double Rotation" 1 `
    "An LL imbalance occurs when a node's left child becomes too heavy due to left insertion; a single Right Rotation about the unbalanced node restores balance."

Add-Q 13 18 "Hard" "What is the primary architectural reason B-Trees and B+ Trees are preferred over Red-Black BSTs for database storage engines?" `
    "Red-Black trees cannot store strings" `
    "B-Trees have very high branching factor (fan-out), minimizing disk block reads (I/O operations) needed to locate a record" `
    "BSTs use too much RAM" `
    "B-Trees do not require balancing" 1 `
    "Disk I/O is orders of magnitude slower than RAM access. A B-Tree with fan-out 1000 can store billions of records with height 3-4, requiring only 3-4 disk block fetches, whereas a binary tree would require ~30 disk fetches."

Add-Q 13 19 "Medium" "What is the time complexity to insert a key into a balanced Red-Black Tree or AVL Tree?" `
    "O(1)" `
    "O(log N)" `
    "O(N)" `
    "O(N log N)" 1 `
    "Because the tree height is strictly maintained at O(log N), search, insertion, and deletion (including rotations) all complete in O(log N) time."

Add-Q 13 20 "Hard" "In a Red-Black Tree, which of the following is a mandatory structural invariant?" `
    "The root must be red" `
    "Every path from a node to any of its descendant null leaves must contain the exact same number of black nodes (Black-Height invariant)" `
    "A red node must have at least one red child" `
    "Leaves store user data" 1 `
    "The Black-Height invariant, combined with the rule that no two red nodes can appear consecutively, guarantees that the longest path from root to leaf is at most twice the shortest path."

Add-Q 13 21 "Medium" "In 'Floor and Ceil in BST', what does 'Floor of X' represent?" `
    "The minimum element in BST" `
    "The greatest value in the BST that is less than or equal to X (val <= X)" `
    "The smallest value in the BST greater than X" `
    "X divided by 2" 1 `
    "Floor(X) is the largest key in the BST that is <= X. Ceil(X) is the smallest key in the BST that is >= X."

Add-Q 13 22 "Hard" "In 'Trim a Binary Search Tree' (trim nodes outside [low, high]), what is the recursive action when root.val < low?" `
    "Delete root and return null" `
    "Discard root and its entire left subtree; return trimBST(root.right, low, high)" `
    "Set root.val = low" `
    "Swap root with leaf" 1 `
    "Since root.val < low, all nodes in its left subtree are also < low and must be trimmed. The valid trimmed tree must lie exclusively within its right subtree."

Add-Q 13 23 "Medium" "What is the Inorder Predecessor of a node in a BST?" `
    "The node's parent" `
    "The largest value in the BST strictly less than the current node's value (rightmost node in left subtree if left child exists)" `
    "The root of the tree" `
    "The leftmost leaf node in the right subtree" 1 `
    "The inorder predecessor is the preceding element in sorted order: the maximum value smaller than current node."

Add-Q 13 24 "Hard" "In a Splay Tree, what is the self-balancing mechanism called and what is its goal?" `
    "Rotations to keep height exactly log N" `
    "Splaying (a sequence of rotations moving a accessed element to the root), optimizing amortized access time for frequently accessed keys (Locality of Reference)" `
    "Coloring nodes red and black" `
    "Rebalancing once every 24 hours" 1 `
    "Splay trees do not enforce strict height balance, but 'splay' recently accessed nodes to the root, guaranteeing amortized O(log N) time and exploiting temporal locality."

Add-Q 13 25 "Medium" "Can a Binary Search Tree contain duplicate elements?" `
    "Never under any circumstances" `
    "Standard strict BSTs disallow duplicates, but variants permit duplicates by storing frequency counts at each node or placing duplicates consistently in left/right subtree" `
    "Duplicates convert the tree into a graph" `
    "Duplicates cause memory leaks" 1 `
    "Standard mathematical definitions require strict inequalities (< and >). Practical implementations store a frequency counter in each node or place <= consistently on one side."

Write-Output "Days 11, 12, 13 loaded."
