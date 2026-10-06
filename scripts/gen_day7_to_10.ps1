# Generator for Days 7, 8, 9, 10 (100 Unique Questions)

# ==================== DAY 7: Sliding Window & Subarrays ====================
Add-Q 7 1 "Medium" "In 'Longest Substring Without Repeating Characters', how does the sliding window update its left boundary on encountering a duplicate character?" `
    "Resets left to 0" `
    "Advances left to max(left, last_seen_index[char] + 1)" `
    "Increments left by 1 until duplicate disappears" `
    "Both B and C are valid, with B skipping directly in O(1)" 3 `
    "Using a hash map storing the last seen index allows jumping the left boundary directly to last_seen_index[char] + 1 in O(1), ensuring each character is processed efficiently."

Add-Q 7 2 "Hard" "In 'Minimum Window Substring' (Hard), what data structures and invariant determine when a window is valid?" `
    "Two hash maps (need vs window) and a 'formed' counter tracking how many unique characters meet required frequency" `
    "A single integer sum of ASCII characters" `
    "A Trie containing all substrings" `
    "Monotonic queue of character indices" 0 `
    "A frequency map tracks target character needs. As right expands, 'formed' increments when a character's window count equals target count. Once all unique characters match, left contracts to minimize length."

Add-Q 7 3 "Medium" "In 'Best Time to Buy and Sell Stock I', what is the single-pass sliding window / greedy invariant?" `
    "Track min_price seen so far; compute potential profit price[i] - min_price; update max_profit" `
    "Find global minimum and global maximum anywhere in the array" `
    "Sort prices ascending" `
    "Compute all pairs differences in O(N^2)" 0 `
    "Iterating through prices while maintaining the minimum purchase price seen so far allows computing the maximum possible profit for selling on day i in a single O(N) pass."

Add-Q 7 4 "Hard" "In 'Sliding Window Maximum' (size K), why is a Monotonic Deque used instead of a standard PriorityQueue?" `
    "PriorityQueue cannot store integers" `
    "Monotonic Deque yields O(N) total time because each element is pushed and popped at most once; PriorityQueue takes O(N log K)" `
    "PriorityQueue uses too much stack memory" `
    "Monotonic Deque automatically sorts elements descending" 1 `
    "A double-ended queue maintaining indices of elements in monotonically decreasing order allows retrieving the maximum in O(1) from the front, achieving O(N) time compared to Heap's O(N log K)."

Add-Q 7 5 "Medium" "In 'Max Consecutive Ones III', you can flip at most K zeroes. How does the sliding window maintain this constraint?" `
    "Count zeroes in window [left, right]; if zeroes > K, shrink window from left until zeroes <= K" `
    "Replace zeroes with ones in the original array" `
    "Use recursion to explore all 2^K combinations" `
    "Sort the array to group zeroes together" 0 `
    "As the right pointer expands, count occurrences of 0. If zero count exceeds K, advance left pointer until a 0 is ejected from the window, keeping zero count <= K."

Add-Q 7 6 "Hard" "How do you count the number of subarrays with exactly K distinct integers in O(N) time?" `
    "Compute atMost(K) - atMost(K - 1) using sliding window" `
    "Use three nested loops checking every subarray" `
    "Use a segment tree" `
    "Hash all subarrays in a Bloom filter" 0 `
    "Directly tracking 'exactly K' distinct elements is tricky because shrinking left doesn't guarantee a valid window. Computing atMost(K) - atMost(K-1) neatly isolates subarrays with exactly K distinct elements in O(N)."

Add-Q 7 7 "Medium" "In 'Longest Repeating Character Replacement', what condition triggers the left window pointer to shrink?" `
    "window_length - max_character_frequency_in_window > K" `
    "window_length == K" `
    "All characters are identical" `
    "left pointer reaches right pointer" 0 `
    "If the number of characters that need to be changed (current window length minus the frequency of the most frequent character in the window) exceeds K, the window cannot be made uniform; increment left."

Add-Q 7 8 "Hard" "In 'Subarray Product Less Than K' (positive integers), how many valid subarrays ending at index 'right' does a valid window [left, right] contribute?" `
    "1" `
    "right - left + 1" `
    "K" `
    "(right - left + 1) * (right - left + 2) / 2" 1 `
    "Every contiguous subsegment ending at 'right' starting from any index between left and right has product less than K. There are exactly (right - left + 1) such subsegments."

Add-Q 7 9 "Medium" "In 'Permutation in String' (s1 and s2), what is the size of the sliding window on s2?" `
    "Length of s2" `
    "Fixed size equal to length of s1" `
    "Dynamic size between 1 and length of s1" `
    "K" 1 `
    "A permutation of s1 must have the exact same length as s1. Thus, a fixed-size sliding window of length s1.length() slides across s2, comparing character frequency counts."

Add-Q 7 10 "Hard" "In 'Longest Continuous Subarray With Absolute Diff Less Than or Equal to Limit', what data structure efficiently tracks min and max in the window?" `
    "A single integer variable" `
    "Two monotonic deques (one increasing for min, one decreasing for max)" `
    "A circular array" `
    "A hash map" 1 `
    "One decreasing deque stores potential window maximums and one increasing deque stores potential window minimums. Checking dequeMax.peek() - dequeMin.peek() <= limit takes O(1), keeping runtime O(N)."

Add-Q 7 11 "Medium" "What is the time complexity of a sliding window when both 'left' and 'right' pointers only advance forward?" `
    "O(N^2)" `
    "O(N log N)" `
    "O(N)" `
    "O(1)" 2 `
    "Even though there is a nested while loop to shrink 'left', each pointer visits each index at most once across the entire algorithm, resulting in 2N total operations = O(N) amortized time."

Add-Q 7 12 "Hard" "In 'Minimum Operations to Reduce X to Zero', you can remove elements from either the leftmost or rightmost end. How is this rephrased as a sliding window problem?" `
    "Find the shortest subarray with sum equal to X" `
    "Find the longest subarray with sum equal to total_array_sum - X" `
    "Sort the array and take the smallest X elements" `
    "Run 0/1 knapsack on remaining elements" 1 `
    "Removing elements from the ends to sum to X is equivalent to leaving behind a contiguous middle subarray whose sum equals (totalSum - X). Maximizing the middle subarray minimizes removed elements."

Add-Q 7 13 "Medium" "In 'Fruit Into Baskets', what does the problem ask in standard algorithmic terms?" `
    "Find the minimum subarray sum" `
    "Find the length of the longest contiguous subarray containing at most 2 distinct elements" `
    "Sort the array into two halves" `
    "Find the longest common subsequence" 1 `
    "With two baskets holding one fruit type each, the task reduces directly to finding the longest subarray containing at most 2 distinct integer values."

Add-Q 7 14 "Hard" "In 'Count Number of Nice Subarrays' (subarrays with K odd numbers), how can the array be preprocessed to reuse 'Subarray Sum Equals K'?" `
    "Multiply all numbers by 2" `
    "Replace all odd numbers with 1 and even numbers with 0, then find subarrays with sum K" `
    "Sort the array descending" `
    "Divide each number by 2" 1 `
    "Mapping each odd number to 1 and each even number to 0 transforms the problem into finding contiguous subarrays whose sum equals K, solvable in O(N) via prefix sums or sliding window."

Add-Q 7 15 "Medium" "In 'Find All Anagrams in a String', what signals that the current window matches target string P?" `
    "Window sum equals sum of ASCII values in P" `
    "The 26-element character frequency array of the current window is identical to that of P" `
    "Window starts with the same character as P" `
    "Window length equals P length" 1 `
    "An anagram requires exact matching of character frequencies. Comparing the two 26-element frequency vectors takes O(26) = O(1) at each step of the fixed window."

Add-Q 7 16 "Hard" "In 'Frequency of the Most Frequent Element' (increment elements at most K times), why do we sort the array first?" `
    "To enable binary search on indices" `
    "Sorting groups close values together so we only consider incrementing elements to match nums[right] in window [left, right]" `
    "To remove negative numbers" `
    "To eliminate duplicates" 1 `
    "Sorting allows a sliding window where the cost to make all elements in [left, right] equal to nums[right] is (right - left + 1) * nums[right] - window_sum. If cost <= K, expand right; else shrink left."

Add-Q 7 17 "Medium" "What happens to the window size in a fixed sliding window algorithm?" `
    "It grows dynamically based on values" `
    "It remains strictly constant as both left and right advance in lockstep" `
    "It resets to zero on every iteration" `
    "It doubles on every step" 1 `
    "In a fixed sliding window of size K, both left and right advance by 1 simultaneously once the initial window of size K is formed."

Add-Q 7 18 "Hard" "In 'Replace the Substring for Balanced String' (length N with Q, W, E, R), how does the sliding window identify the shortest replaceable substring?" `
    "Counts characters outside the window: if all Q, W, E, R counts outside the window are <= N/4, the window is valid" `
    "Replaces characters with random letters" `
    "Sorts the string alphabetically" `
    "Finds the longest palindromic substring" 0 `
    "The characters inside the window can be replaced by any letters. Therefore, the window is valid if and only if the characters remaining OUTSIDE the window do not exceed the target frequency N/4."

Add-Q 7 19 "Medium" "What is the maximum number of times an element can be pushed into a monotonic deque during a sliding window pass over an array of size N?" `
    "Log N" `
    "1" `
    "N" `
    "K" 1 `
    "Every element in the array is pushed onto the deque exactly once and popped at most once, guaranteeing O(N) overall complexity."

Add-Q 7 20 "Hard" "In 'Sliding Window Median', what data structure efficiently supports finding the median of a sliding window of size K?" `
    "A single linked list" `
    "Two balanced multisets (or self-balancing BST / two heaps with lazy removal) maintaining lower and upper halves of size K/2" `
    "Quickselect on every window slide taking O(N*K)" `
    "A boolean bitset" 1 `
    "Two balanced trees or heaps with lazy deletion maintain the lower half and upper half of the window, supporting insertion, deletion of outgoing elements, and median query in O(log K) per step."

Add-Q 7 21 "Medium" "In 'Maximum Points You Can Obtain from Cards' (pick K cards from beginning or end), how is sliding window applied?" `
    "Pick greedily the larger card each time" `
    "Find the contiguous subarray of size (N - K) that has the MINIMUM sum, and subtract it from total card points" `
    "Sort cards in descending order" `
    "Take K/2 cards from left and K/2 from right" 1 `
    "Picking K cards from the outer ends leaves behind an unpicked contiguous window of size (N - K). Minimizing the sum of this (N - K) window maximizes the sum of the picked cards."

Add-Q 7 22 "Hard" "In 'Binary Subarrays With Sum' (binary array with target sum S), why does the standard two-pointer window struggle when S = 0?" `
    "Pointers point to null" `
    "Shrinking left when nums[left] == 0 does not change the sum, making it tricky to count all zero-combinations without prefix sums or atMost(S) - atMost(S-1)" `
    "Division by zero occurs" `
    "Bitwise overflow occurs" 1 `
    "Because adding or subtracting 0 does not change the sum, multiple left boundaries can produce identical sums. Using atMost(S) - atMost(S-1) or a prefix-sum hash map handles 0 seamlessly."

Add-Q 7 23 "Medium" "What is the space complexity of the optimal Sliding Window approach for 'Longest Substring Without Repeating Characters' over standard English ASCII?" `
    "O(N)" `
    "O(1) because the character set is bounded by 128 (or 256) ASCII characters" `
    "O(N log N)" `
    "O(2^N)" 1 `
    "Because the alphabet size is constant (e.g. 128 ASCII or 256 extended ASCII), an array or map of fixed size 128 uses O(1) auxiliary space."

Add-Q 7 24 "Hard" "In 'Substrings of Size Three with Distinct Characters', what is the most efficient verification at each step?" `
    "Sort the 3 characters" `
    "Direct comparison: s[i] != s[i+1] && s[i] != s[i+2] && s[i+1] != s[i+2]" `
    "Insert into a HashSet and check size == 3" `
    "Both B and C work, but B uses zero allocations and 3 CPU comparisons" 3 `
    "For small fixed window size 3, 3 simple inequality comparisons run in nano-seconds without hash set allocation overhead."

Add-Q 7 25 "Medium" "Which condition is required for the two-pointer sliding window technique to guarantee an optimal solution?" `
    "The input array must have negative numbers" `
    "Monotonicity: expanding the window must monotonically increase (or satisfy) the property, and shrinking must monotonically decrease it" `
    "Array elements must be sorted floating point numbers" `
    "Window size must be a power of two" 1 `
    "Sliding window requires monotonic behavior so that moving a pointer in one direction predictably affects the window property without needing to backtrack."

# ==================== DAY 8: Fast & Slow Pointers (Linked Lists) ====================
Add-Q 8 1 "Medium" "In Floyd's Cycle-Finding Algorithm (Tortoise and Hare), at what speeds do the slow and fast pointers advance?" `
    "Slow advances 1 node; Fast advances 2 nodes" `
    "Slow advances 2 nodes; Fast advances 3 nodes" `
    "Slow advances 1 node; Fast advances 3 nodes" `
    "Both advance at identical speed" 0 `
    "Slow advances 1 step and fast advances 2 steps per iteration. In a cycle of length C, the relative distance between them decreases by 1 step each iteration, guaranteeing collision."

Add-Q 8 2 "Hard" "In 'Linked List Cycle II', once slow and fast meet inside the cycle, how do you locate the exact node where the cycle begins?" `
    "Reset both pointers to head and advance both by 2 steps" `
    "Reset slow to head, keep fast at the meeting point, and advance both 1 step at a time until they collide" `
    "Reverse the linked list" `
    "Delete the meeting node" 1 `
    "Mathematically, if the distance from head to cycle entrance is L1, the distance from meeting point to cycle entrance is also congruent to L1. Advancing one pointer from head and one from the meeting point at 1 step/iteration collides exactly at the entrance."

Add-Q 8 3 "Medium" "How does the fast and slow pointer technique find the middle of a singly linked list in a single pass?" `
    "Slow moves 1 step, fast moves 2 steps. When fast reaches the end (null or fast.next is null), slow is at the middle" `
    "Fast counts total nodes, slow divides by 2" `
    "Both start from opposite ends" `
    "Slow moves backward from tail" 0 `
    "Because fast travels at twice the speed of slow, when fast reaches the end of the list, slow has traveled exactly half the distance, landing directly at the middle node."

Add-Q 8 4 "Hard" "How do you reverse a Singly Linked List iteratively in O(N) time and O(1) space?" `
    "Use three pointers: prev = null, curr = head. In a loop: next = curr.next; curr.next = prev; prev = curr; curr = next; return prev" `
    "Push all elements into an array and reconstruct" `
    "Swap values between head and tail" `
    "Use recursion with depth N" 0 `
    "The 3-pointer pattern (prev, curr, next) reverses pointer directions in-place with zero heap memory allocation and O(N) time complexity."

Add-Q 8 5 "Medium" "In 'Palindrome Linked List', how do you achieve O(N) time and O(1) auxiliary space?" `
    "Convert to string and check palindrome" `
    "Find middle using fast/slow pointers, reverse the second half of the list, compare values node by node, and optionally restore the list" `
    "Push nodes onto a stack" `
    "Compare head and tail using doubly linked pointers" 1 `
    "Finding middle takes O(N), reversing the second half in-place takes O(N) and O(1) space, and comparing first half with reversed second half takes O(N) with O(1) extra memory."

Add-Q 8 6 "Hard" "In 'Remove Nth Node From End of List', how can this be accomplished in a single pass?" `
    "Advance fast pointer N steps ahead first; then advance slow and fast together until fast reaches the end; delete slow.next" `
    "Traverse list twice: once to count length, once to delete" `
    "Reverse list, delete Nth node from start, reverse back" `
    "Use a hash map of indices" 0 `
    "By giving the fast pointer an initial lead of N nodes, the gap between slow and fast remains N. When fast reaches the last node, slow sits directly before the node to be removed."

Add-Q 8 7 "Medium" "How do you detect the intersection node of two singly linked lists in O(M + N) time and O(1) space?" `
    "Store nodes of List A in a HashSet" `
    "Initialize two pointers pA at headA and pB at headB; when each reaches the end, redirect it to the head of the OTHER list; they will meet at the intersection node (or null)" `
    "Compare values of nodes starting from heads" `
    "Reverse both linked lists" 1 `
    "Switching heads equalizes the total distance traveled: (lenA + lenB). Both pointers traverse identical lengths and align at the intersection node on their second pass."

Add-Q 8 8 "Hard" "In 'Merge K Sorted Lists', what is the time complexity when using a Min-Heap (PriorityQueue) of size K?" `
    "O(N * K)" `
    "O(N log K) where N is the total number of nodes across all lists" `
    "O(N^2)" `
    "O(K log N)" 1 `
    "The Min-Heap maintains the current head of each of the K lists. Extracting the minimum and inserting its next node takes O(log K). For N total nodes, the overall runtime is O(N log K)."

Add-Q 8 9 "Medium" "Why is a Dummy Head node used when implementing linked list operations like 'Merge Two Sorted Lists'?" `
    "To store the size of the list" `
    "To simplify edge cases by avoiding special-case checks for inserting into an empty list or modifying the head pointer" `
    "To make the list circular" `
    "To prevent garbage collection of nodes" 1 `
    "A dummy head provides a fixed predecessor node, eliminating repetitive null checks for the list head and allowing uniform pointer attachment throughout the loop."

Add-Q 8 10 "Hard" "In 'Reverse Nodes in k-Group' (Hard), what happens if the remaining nodes at the end of the list are fewer than k?" `
    "They are deleted" `
    "They remain in their original order without reversal" `
    "They are reversed anyway" `
    "A null pointer exception is thrown" 1 `
    "The problem specification dictates that if the count of remaining nodes is strictly less than k, they must be left as-is in their original sequence."

Add-Q 8 11 "Medium" "What is the time complexity of Merge Sort on a Singly Linked List?" `
    "O(N^2)" `
    "O(N log N) time and O(log N) stack space (or O(1) auxiliary heap space)" `
    "O(N)" `
    "O(N^3)" 1 `
    "Finding the middle using fast/slow pointers takes O(N), splitting and recursively sorting takes O(log N) depth, and merging two sorted linked lists takes O(N), yielding O(N log N) total time."

Add-Q 8 12 "Hard" "In 'Copy List with Random Pointer', how can deep copying be achieved in O(1) auxiliary space (without a HashMap)?" `
    "By writing nodes to disk" `
    "By interleaving cloned nodes directly next to original nodes (curr -> clone -> curr.next), copying random pointers via curr.next.random = curr.random.next, and unweaving" `
    "By setting random pointers to null" `
    "By using XOR linked list pointers" 1 `
    "Interleaving cloned nodes immediately following their original counterparts allows resolving random pointers in O(1) space: clone.random = original.random.next. A third pass then unweaves original and copy lists."

Add-Q 8 13 "Medium" "How can you delete a node in a singly linked list if you are only given access to that node (and not the head)?" `
    "It is impossible" `
    "Copy the value of node.next into the current node, then set node.next = node.next.next (cannot be applied if the target node is the tail)" `
    "Traverse backward using parent pointer" `
    "Set the node reference to null" 1 `
    "Overwrite the current node's value with its successor's value, and delete the successor node. (Note: this trick cannot delete the last node in the list)."

Add-Q 8 14 "Hard" "In 'Reorder List' (L0 -> Ln -> L1 -> Ln-1 -> L2...), what are the 3 sequential steps of the optimal solution?" `
    "1. Find middle node (fast/slow pointers), 2. Reverse the second half of the list, 3. Merge the two halves alternately" `
    "1. Sort the list, 2. Split in half, 3. Concatenate" `
    "1. Convert to binary tree, 2. Perform inorder traversal" `
    "1. Push nodes to queue, 2. Reverse queue" 0 `
    "Finding middle takes O(N), in-place reversal of the second half takes O(N), and alternating pairwise splicing of the two halves takes O(N), all in O(1) extra space."

Add-Q 8 15 "Medium" "What is the primary architectural disadvantage of a Singly Linked List compared to an Array?" `
    "Linked list cannot store strings" `
    "Poor CPU cache locality (nodes scattered across heap) and lack of O(1) random index access" `
    "Insertion at the head takes O(N) time" `
    "Linked lists have fixed capacity" 1 `
    "Arrays store elements contiguously in memory, leveraging CPU hardware prefetching and cache lines. Linked list nodes are scattered across the heap and require pointer traversal rather than index arithmetic."

Add-Q 8 16 "Hard" "In the design of an LRU (Least Recently Used) Cache, why is a Doubly Linked List paired with a Hash Map?" `
    "Hash map provides O(1) key lookup, and Doubly Linked List allows O(1) removal and insertion of nodes at the head/tail" `
    "Singly linked list cannot store integers" `
    "Doubly linked list automatically sorts keys alphabetically" `
    "To avoid using RAM memory" 0 `
    "The HashMap maps keys to Doubly Linked List nodes for O(1) access. The Doubly Linked List allows removing a node in O(1) (since node.prev and node.next are accessible) and moving it to the front as most recently used."

Add-Q 8 17 "Medium" "In 'Odd Even Linked List', how are odd and even indexed nodes grouped together in-place?" `
    "Swap values of adjacent nodes" `
    "Maintain two pointers 'odd' and 'even', rewiring odd.next = even.next and even.next = even.next.next, then connect odd list tail to even list head" `
    "Create two new linked lists and copy all values" `
    "Reverse the entire list twice" 1 `
    "Maintain odd and even pointers along with a pointer to evenHead. Rewire connections in a single pass in O(N) time and O(1) space, finally setting odd.next = evenHead."

Add-Q 8 18 "Hard" "What is an XOR Linked List (Memory Efficient Doubly Linked List)?" `
    "A linked list encrypted with AES" `
    "A doubly linked list where each node stores the bitwise XOR of the memory addresses of its previous and next nodes in a single pointer field" `
    "A list that only stores boolean values" `
    "A circular singly linked list" 1 `
    "Instead of storing two separate pointers (prev and next), an XOR linked list stores (prev XOR next). Traversal maintains the previous node address to compute the next node address via XOR arithmetic."

Add-Q 8 19 "Medium" "In 'Add Two Numbers' (digits stored in reverse order in two linked lists), how is addition handled?" `
    "Convert both lists to 64-bit integers, add them, and convert back" `
    "Traverse both lists simultaneously, adding digit values plus carry, creating new nodes with (sum % 10), and propagating carry = sum / 10" `
    "Reverse both lists, subtract, and reverse back" `
    "Use bitwise AND operations" 1 `
    "Because digits are in reverse order (least significant digit first), simulate standard elementary addition from left to right, handling digit sums and carry propagation across nodes until both lists and carry are exhausted."

Add-Q 8 20 "Hard" "In 'Flatten a Multilevel Doubly Linked List', how do you handle child pointers to produce a single-level doubly linked list?" `
    "DFS traversal using a stack or iterative pointer splicing: connect curr to child, find child's tail, and connect tail to curr.next" `
    "Sort nodes by child level" `
    "Delete all child pointers" `
    "Convert all children to circular lists" 0 `
    "Iteratively traversing: whenever a node has a child, splice the child sub-list between curr and curr.next, updating prev and next pointers and clearing child = null."

Add-Q 8 21 "Medium" "What does 'Rotate List' by K places to the right require when K is larger than list length N?" `
    "Throw an OutOfBounds exception" `
    "Compute K = K % N to avoid redundant full rotations" `
    "Reverse the list K times" `
    "Create K empty dummy nodes" 1 `
    "Rotating a list of length N by N positions returns the identical list. Taking K % N eliminates unnecessary full cycles."

Add-Q 8 22 "Hard" "In 'Partition List' around value X (preserving relative order), how is this accomplished cleanly?" `
    "Two dummy heads: 'lessHead' and 'greaterHead'; append nodes to respective lists, then link less list tail to greaterHead.next" `
    "Quicksort partition swapping values in-place" `
    "Bubble sort nodes" `
    "Reverse nodes smaller than X" 0 `
    "Creating two independent dummy chains ('less' and 'greaterOrEqual') preserves original relative order. Splicing them together at the end produces the partitioned list in O(N) time and O(1) space."

Add-Q 8 23 "Medium" "What is the time complexity to insert a new node at the head of a Singly Linked List?" `
    "O(N)" `
    "O(1)" `
    "O(log N)" `
    "O(N^2)" 1 `
    "Inserting at the head simply requires newNode.next = head; head = newNode, requiring constant time O(1)."

Add-Q 8 24 "Hard" "In 'Remove Duplicates from Sorted List II' (removing all occurrences of duplicated numbers), how do you handle duplicate head elements?" `
    "Use a dummy head pointing to head, and check if curr.next.val == curr.next.next.val in a while loop" `
    "Delete the head node unconditionally" `
    "Convert list to array" `
    "Set duplicate values to zero" 0 `
    "A dummy head placed before head allows deleting consecutive duplicates even if they start from the very first node: when duplicates are detected, bypass all nodes with that value."

Add-Q 8 25 "Medium" "How do you detect if a linked list is circular (tail points to head)?" `
    "Check if head is null" `
    "Traverse with slow and fast pointers; if fast or fast.next reaches null it is acyclic; if fast meets slow it contains a cycle" `
    "Count nodes until integer overflow" `
    "Compare head address to memory limit" 1 `
    "Floyd's algorithm: if fast reaches null, the list terminates linearly; if fast encounters slow, a cycle is confirmed."

# ==================== DAY 9: Binary Search & Search Space ====================
Add-Q 9 1 "Medium" "Why should binary search midpoint be calculated as 'low + (high - low) / 2' instead of '(low + high) / 2'?" `
    "It compiles to faster assembly instructions" `
    "To prevent 32-bit signed integer overflow when (low + high) exceeds 2,147,483,647" `
    "Because (low + high) / 2 rounds toward negative infinity" `
    "To handle floating point values" 1 `
    "If low and high are large positive integers (e.g. near 2^31 - 1), their sum can overflow into negative values, resulting in ArrayIndexOutOfBoundsException. 'low + (high - low) / 2' avoids overflow."

Add-Q 9 2 "Hard" "In 'Search in Rotated Sorted Array' (distinct values), how do you determine which half to search in each step?" `
    "Randomly pick left or right half" `
    "Check if nums[low] <= nums[mid]; if so, the left half is sorted, otherwise the right half is sorted; then check if target lies within the sorted half's range" `
    "Rotate the array back to sorted order first in O(N)" `
    "Perform linear search" 1 `
    "In any rotated sorted array, dividing at mid leaves at least one half strictly sorted. Identifying the sorted half and checking if target falls within its bounds directs the binary search in O(log N)."

Add-Q 9 3 "Medium" "What is the time complexity of searching for a target in an M x N matrix where each row is sorted and the first element of each row is greater than the last element of the previous row?" `
    "O(M * N)" `
    "O(M + N)" `
    "O(log(M * N)) by treating the matrix as a 1D virtual sorted array of size M*N" `
    "O(log M * log N)" 2 `
    "Because all elements are in strictly increasing order row by row, map index mid in range [0, M*N - 1] to matrix[mid / N][mid % N] to perform standard binary search in O(log(M * N)) time."

Add-Q 9 4 "Hard" "In 'Search in Rotated Sorted Array II' (with duplicate elements), what is the worst-case time complexity?" `
    "O(log N)" `
    "O(N) when nums[low] == nums[mid] == nums[high]" `
    "O(N log N)" `
    "O(1)" 1 `
    "When nums[low] == nums[mid] == nums[high], it is impossible to determine which half is sorted. Both low++ and high-- must be incremented, degenerating the search to O(N) in the worst case (e.g. [1, 1, 1, 1, 2, 1, 1])."

Add-Q 9 5 "Medium" "In 'Find Peak Element', an element is a peak if it is strictly greater than its neighbors. Why does binary search work on an unsorted array here?" `
    "It does not work; linear search is mandatory" `
    "If nums[mid] < nums[mid + 1], a peak is guaranteed to exist to the right (following the rising slope); otherwise a peak exists to the left" `
    "Because the array is secretly sorted" `
    "Peak elements only occur at index 0" 1 `
    "Because boundary conditions specify nums[-1] = nums[n] = -infinity, walking in the direction of an upward slope (nums[mid] < nums[mid+1]) guarantees encountering at least one local peak."

Add-Q 9 6 "Hard" "In 'Koko Eating Bananas' (Binary Search on Answer), what are the low and high boundaries of the search space?" `
    "low = 0, high = piles.length" `
    "low = 1 (minimum possible speed), high = max(piles) (eating the largest pile in 1 hour)" `
    "low = sum(piles), high = infinity" `
    "low = 1, high = H" 1 `
    "Eating speed k must be between 1 and the maximum pile size. Binary searching k in range [1, max(piles)] and testing feasibility takes O(N log(max(piles))) time."

Add-Q 9 7 "Medium" "What is the lower bound of an element X in a sorted array?" `
    "The first index where element is strictly greater than X" `
    "The first index where element is greater than or equal to X (element >= X)" `
    "The last index where element equals X" `
    "Index 0" 1 `
    "Lower bound returns the iterator/index pointing to the first element that does not satisfy element < X (i.e. element >= X)."

Add-Q 9 8 "Hard" "In 'Median of Two Sorted Arrays' (Hard), what is the optimal time complexity achieved by binary search partitioning?" `
    "O(M + N)" `
    "O(log(min(M, N)))" `
    "O((M + N) log(M + N))" `
    "O(log M * log N)" 1 `
    "Binary searching the partition cut on the smaller array of size min(M, N) balances both halves such that left_max <= right_min in O(log(min(M, N))) time and O(1) space."

Add-Q 9 9 "Medium" "What does 'Capacity To Ship Packages Within D Days' binary search over?" `
    "Number of days" `
    "Ship weight capacity, bounded between max(weights) and sum(weights)" `
    "Number of packages" `
    "Package volume" 1 `
    "The minimum ship capacity must be at least max(weights) (to carry the heaviest package) and at most sum(weights) (shipping everything in 1 day). Binary search the answer within this range."

Add-Q 9 10 "Hard" "In 'Split Array Largest Sum' (split nums into K non-empty subarrays to minimize the largest subarray sum), what problem category does this represent?" `
    "Dynamic programming on strings" `
    "Minimax Binary Search on Answer Space with greedy validation" `
    "Graph shortest path" `
    "Trie prefix matching" 1 `
    "The search space for the largest subarray sum ranges from max(nums) to sum(nums). Binary search candidate sum S; greedily count if subarrays required <= K."

Add-Q 9 11 "Medium" "In 'Find Minimum in Rotated Sorted Array' (distinct elements), how do you decide whether the minimum lies in the left or right half?" `
    "Compare nums[mid] with nums[high]: if nums[mid] > nums[high], minimum is strictly in the right half (low = mid + 1); otherwise it is in the left half including mid (high = mid)" `
    "Compare nums[mid] with 0" `
    "Compare nums[low] with nums[mid]" `
    "Check if mid is even or odd" 0 `
    "If nums[mid] > nums[high], the rotation inflection point (and thus the minimum) must lie to the right of mid. Otherwise, the right half is sorted and the inflection is at mid or to its left."

Add-Q 9 12 "Hard" "In 'Aggressive Cows' / 'Magnetic Force Between Two Balls', why must the coordinates array be sorted first?" `
    "To enable binary search on cow IDs" `
    "Sorting allows greedily placing cows at the first available stall with distance >= candidate_dist" `
    "To eliminate duplicate coordinates" `
    "Sorting is optional" 1 `
    "Sorting coordinates in O(N log N) allows testing if a given minimum distance D is feasible in a single greedy O(N) pass, placing each subsequent cow as soon as stall[i] - last_stall >= D."

Add-Q 9 13 "Medium" "What is the upper bound of an element X in a sorted array?" `
    "The first index where element is strictly greater than X (element > X)" `
    "The first index where element equals X" `
    "The last index of the array" `
    "The index where element is less than X" 0 `
    "Upper bound finds the first position where the element is strictly greater than target X (used with lower bound to find ranges [first, last])."

Add-Q 9 14 "Hard" "In 'Single Element in a Sorted Array' (every element appears twice except one), how does binary search check which half contains the single element?" `
    "Check if nums[mid] is negative" `
    "In the undisturbed first half, identical pairs start at even indices (even, odd). If mid is even and nums[mid] == nums[mid+1], the single element is to the right; else left" `
    "XOR all elements in O(N)" `
    "Compare nums[mid] with nums[0]" 1 `
    "Before the single element, pairs have the pattern (even index, odd index). After the single element, the pairing pattern shifts to (odd index, even index). This index-parity invariant allows O(log N) binary search."

Add-Q 9 15 "Medium" "What is the time complexity of searching a target in an M x N matrix where each row is sorted left-to-right and each column is sorted top-to-bottom (Search a 2D Matrix II)?" `
    "O(M * N)" `
    "O(M + N) by starting at top-right or bottom-left corner" `
    "O(log(M * N))" `
    "O(1)" 1 `
    "Starting at top-right (r=0, c=N-1): if matrix[r][c] > target, decrement column; if < target, increment row. Each step prunes one entire row or column in O(M + N) time."

Add-Q 9 16 "Hard" "In 'Find the Smallest Divisor Given a Threshold', what is the monotonicity property of the division sum?" `
    "As divisor increases, sum of division results monotonically decreases" `
    "As divisor increases, sum monotonically increases" `
    "Sum remains constant" `
    "Sum oscillates randomly" 0 `
    "Dividing numbers by a larger divisor yields smaller (or equal) quotients. This monotonic decreasing behavior guarantees binary search on divisor range [1, max(nums)] is valid."

Add-Q 9 17 "Medium" "What is the result of binary search if target is not present in an array using 'low <= high' loop?" `
    "Low index exceeds high index (low > high), where low represents the insertion index" `
    "Low and high both become 0" `
    "Infinite loop" `
    "High becomes negative infinity" 0 `
    "When target is absent, the search terminates with low > high, and low points precisely to where target should be inserted to keep the array sorted."

Add-Q 9 18 "Hard" "In 'Painter's Partition Problem', K painters paint N contiguous boards. How is this mapped to binary search?" `
    "Binary search on number of painters" `
    "Binary search on the maximum time/length allocated to any single painter in range [max(boards), sum(boards)]" `
    "Assign boards randomly" `
    "Sort boards descending" 1 `
    "Identical to 'Split Array Largest Sum': search space is maximum board length to total sum. Test feasibility greedily in O(N)."

Add-Q 9 19 "Medium" "How many comparisons does standard binary search perform on an array of size 1,000,000 in the worst case?" `
    "1,000,000" `
    "~20 (since 2^20 = 1,048,576)" `
    "500,000" `
    "100" 1 `
    "Binary search eliminates half the search space at each comparison. Log2(1,000,000) is approximately 19.93, requiring at most 20 comparisons."

Add-Q 9 20 "Hard" "In 'Minimum Number of Days to Make m Bouquets', what is the predicate function checked at each candidate day D?" `
    "Count how many adjacent groups of k bloomed flowers exist on day D; check if count >= m" `
    "Sort bloom days" `
    "Count total bloomed flowers" `
    "Check if day D is prime" 0 `
    "Flowers can only be picked if bloomDay[i] <= D. Scan linearly to greedily count contiguous bloomed segments of size k. If total bouquets >= m, day D is feasible."

Add-Q 9 21 "Medium" "What is the square root of non-negative integer X rounded down to nearest integer using binary search?" `
    "Search range [0, X]; check if mid * mid <= X" `
    "Search range [X, X^2]" `
    "Divide X by 2 iteratively" `
    "Square root cannot be computed using binary search" 0 `
    "Because f(m) = m*m is monotonically increasing for non-negative integers, binary search the range [0, x] for the largest integer mid where mid * mid <= x (watching for integer overflow using mid <= x / mid)."

Add-Q 9 22 "Hard" "In 'H-Index II' (citations sorted ascending), what does binary search look for?" `
    "Find citations[mid] == mid" `
    "First index mid where citations[mid] >= n - mid, giving h-index = n - mid" `
    "Largest element in array" `
    "Average citation count" 1 `
    "If citations[mid] >= n - mid, there are at least (n - mid) papers with at least citations[mid] citations. We move left to find an even larger valid h-index, achieving O(log N)."

Add-Q 9 23 "Medium" "Why must the input array be sorted (or possess a monotonic predicate) for binary search to work?" `
    "Because CPU cache requires sorted data" `
    "Because binary search relies on the invariant that comparing with midpoint eliminates an entire half of remaining possibilities" `
    "To prevent division by zero" `
    "Because arrays cannot store unsorted numbers" 1 `
    "The core logic of binary search discards half the search space based on a single comparison. Without sorting or monotonicity, discarding half could discard the target."

Add-Q 9 24 "Hard" "In 'Maximum Candies Allocated to K Children' (piles of candies), what is the feasibility check for candy allocation size C?" `
    "sum(piles[i] / C) >= K" `
    "sum(piles) / K >= C" `
    "max(piles) >= C * K" `
    "C <= K" 0 `
    "Each child must get C candies from a single pile. A pile of size piles[i] can provide floor(piles[i] / C) allocations. If total allocations >= K, candidate size C is valid."

Add-Q 9 25 "Medium" "What is the space complexity of iterative binary search?" `
    "O(log N)" `
    "O(1)" `
    "O(N)" `
    "O(N log N)" 1 `
    "Iterative binary search uses only two pointer variables (low and high) and a midpoint variable, requiring O(1) auxiliary space."

# ==================== DAY 10: Recursion & Backtracking Sprint ====================
Add-Q 10 1 "Medium" "What is the essential component of any recursive function to prevent infinite recursion and StackOverflowError?" `
    "A global variable" `
    "A Base Case / Base Condition" `
    "A while loop" `
    "A try-catch block" 1 `
    "A base case defines the condition under which the function terminates recursion without making further recursive calls, returning directly up the call stack."

Add-Q 10 2 "Hard" "In the 'Subsets' (Power Set) problem for an array of size N distinct elements, how many subsets exist and what is the time complexity?" `
    "N! subsets, O(N!)" `
    "2^N subsets, O(N * 2^N) time complexity" `
    "N^2 subsets, O(N^2)" `
    "2N subsets, O(N)" 1 `
    "Each element has 2 choices (include or exclude), yielding 2^N subsets. Copying each subset of average length N/2 takes O(N), giving O(N * 2^N) total time."

Add-Q 10 3 "Medium" "In backtracking, what does the 'Backtrack' step specifically refer to?" `
    "Printing the recursion stack" `
    "Undoing the change made before the recursive call (restoring state) so alternative branches can be explored" `
    "Throwing an exception to jump out of recursion" `
    "Calling the function with reversed arguments" 1 `
    "Backtracking explores solution candidates by making a choice, making a recursive call, and then undoing that choice (e.g. path.pop_back() or visited[r][c] = false) to restore state."

Add-Q 10 4 "Hard" "In 'Subsets II' (array contains duplicate numbers), how do you prevent generating duplicate subsets?" `
    "Store all subsets in a HashSet" `
    "Sort the array first; inside the loop, skip identical elements when i > start && nums[i] == nums[i-1]" `
    "Remove duplicates from input array" `
    "Reverse array after each step" 1 `
    "Sorting groups duplicates. In the backtracking loop, if nums[i] == nums[i-1] and i > start, it means nums[i] was already used as a choice at this current decision depth, so skipping it prevents duplicate branches."

Add-Q 10 5 "Medium" "In 'Permutations' of N distinct numbers, how many total permutations exist and what is the branching factor at depth d?" `
    "2^N permutations" `
    "N! permutations, with branching factor (N - d)" `
    "N^2 permutations" `
    "N permutations" 1 `
    "The first choice has N options, second has N-1, and so forth, producing N * (N-1) * ... * 1 = N! total leaf nodes in the recursion tree."

Add-Q 10 6 "Hard" "In 'Combination Sum' (unbounded reuse of elements to reach target sum), why does the recursive call pass 'i' rather than 'i + 1'?" `
    "To create an infinite loop" `
    "To allow the current candidate element to be chosen repeatedly in subsequent recursive calls" `
    "Because array indices are 0-based" `
    "To skip the next element" 1 `
    "Passing 'i' allows the same element at index i to be selected again. Passing 'i + 1' would enforce single-use (as in Combination Sum II)."

Add-Q 10 7 "Medium" "In the N-Queens problem on an N x N chessboard, what three sets / boolean arrays allow O(1) conflict validation for placing a queen at (row, col)?" `
    "columns, main_diagonals (row - col), and anti_diagonals (row + col)" `
    "rows, squares, knights" `
    "even columns, odd rows" `
    "file headers, ranks, borders" 0 `
    "Because we place one queen per row, conflicts only occur across columns (col), main diagonals (row - col is constant), and anti-diagonals (row + col is constant). Tracking these in sets yields O(1) checks."

Add-Q 10 8 "Hard" "In 'Word Search' (finding a word in a 2D board of characters), how do you prevent revisiting the same cell in the current path in-place?" `
    "Delete the cell from the board" `
    "Temporarily mark board[r][c] = '#' (or visited flag), recurse, and restore board[r][c] = original_char upon backtracking" `
    "Create a new board copy at each step" `
    "Throw a catchable exception" 1 `
    "Mutating the cell in-place to an unmatchable sentinel '#' avoids allocating an auxiliary visited matrix. Restoring it back to original_char during backtrack rollback guarantees O(1) auxiliary space."

Add-Q 10 9 "Medium" "In 'Generate Parentheses', what two invariants must hold when placing '(' and ')' to ensure valid parentheses strings of length 2N?" `
    "open_count < N to add '(', and close_count < open_count to add ')'" `
    "open_count == close_count always" `
    "close_count > N" `
    "open_count + close_count == N" 0 `
    "You can place an open parenthesis '(' whenever open_count < N. You can only place a closing parenthesis ')' when close_count < open_count, guaranteeing that every prefix has at least as many '(' as ')'."

Add-Q 10 10 "Hard" "In 'Sudoku Solver', what are the three constraints checked before placing a digit '1'-'9' in cell (row, col)?" `
    "The digit must not appear in the same row, same column, or same 3x3 sub-grid (box_row = row/3*3, box_col = col/3*3)" `
    "The sum of the row must equal 45" `
    "The digit must be greater than previous cell" `
    "The diagonal must contain distinct numbers" 0 `
    "Valid placement requires that the digit does not already exist in the current row, current column, or the 3x3 box containing (row, col)."

Add-Q 10 11 "Medium" "In 'Letter Combinations of a Phone Number', what determines the recursion depth?" `
    "Total characters in alphabet (26)" `
    "The length of the input digits string" `
    "Fixed depth 4" `
    "Number of buttons on phone" 1 `
    "Each digit corresponds to one decision step. The recursion tree reaches depth equal to the length of the digits string, where each leaf represents a complete letter combination."

Add-Q 10 12 "Hard" "In 'Palindrome Partitioning' (partition string s such that every substring is a palindrome), what optimization avoids redundant palindrome checks?" `
    "Precomputing a 2D boolean table isPalindrome[i][j] using Dynamic Programming" `
    "Sorting the string" `
    "Using binary search on string length" `
    "Converting string to lowercase" 0 `
    "Checking palindrome on-the-fly takes O(L) time. Precomputing dp[i][j] = (s[i] == s[j]) && (j - i <= 2 || dp[i+1][j-1]) allows O(1) palindrome verification during backtracking."

Add-Q 10 13 "Medium" "In 'Restore IP Addresses', what conditions define a valid IPv4 octet segment?" `
    "Length between 1 and 3, value between 0 and 255, and no leading zeroes for numbers > 0 (e.g. '01' is invalid)" `
    "Length must be exactly 3" `
    "Value must be even" `
    "Must contain letters" 0 `
    "An IPv4 octet must be 1 to 3 digits long, convert to an integer between 0 and 255, and must not have leading zeroes (i.e. '0' is valid, but '01' or '055' is invalid)."

Add-Q 10 14 "Hard" "What is the difference between Depth-First Search (DFS) and Backtracking?" `
    "They are completely unrelated" `
    "DFS explores an entire explicit or implicit graph to completion; Backtracking is a DFS variant that prunes branches early when partial candidates cannot lead to a valid solution" `
    "DFS uses a queue; backtracking uses a stack" `
    "Backtracking only works on arrays" 1 `
    "Backtracking is essentially DFS applied to state-space trees with early pruning (bounding functions). When a partial candidate violates constraints, backtracking abandons the entire subtree immediately."

Add-Q 10 15 "Medium" "In 'Combinations' (return all combinations of k numbers chosen from 1 to n), how can the loop boundary be pruned?" `
    "i <= n" `
    "i <= n - (k - path.size()) + 1" `
    "i <= k" `
    "i <= n / 2" 1 `
    "If the remaining available numbers (n - i + 1) are fewer than the numbers still needed to complete size k (k - path.size()), exploring further is futile; pruning the loop boundary saves massive execution time."

Add-Q 10 16 "Hard" "In 'Word Break II' (return all sentence reconstructions), why is pure backtracking susceptible to Time Limit Exceeded without memoization?" `
    "Stack overflow on 32-bit systems" `
    "Strings like 'aaaaaa...' with dictionary ['a', 'aa', 'aaa'] have exponentially many overlapping subproblem calls that recompute identical suffixes" `
    "String concatenation is not thread safe" `
    "Regular expressions are slow" 1 `
    "Without memoization, overlapping suffixes are solved repeatedly, causing O(2^N) time. Storing the list of valid sentences for suffix s[start..] in a memoization map avoids redundant branches."

Add-Q 10 17 "Medium" "What happens to variables allocated on the call stack when a recursive function returns?" `
    "They remain on the heap forever" `
    "The stack frame is popped, freeing local variables automatically" `
    "Garbage collector must sweep them" `
    "They cause memory leaks" 1 `
    "Local variables exist within the active stack frame. Returning from a function pops the frame from the call stack, immediately deallocating its local memory."

Add-Q 10 18 "Hard" "In 'N-Queens II', how do bitwise operations optimize the conflict checking?" `
    "Using bitmasks for columns, diag1, and diag2 allows checking and setting conflicts with bitwise OR, AND, and shifts (diag1 << 1, diag2 >> 1) in single CPU cycles" `
    "Bitwise operations encrypt the board" `
    "Bitwise operations double board size" `
    "Bitwise operations allow queens to move like knights" 0 `
    "Bitwise N-Queens uses integer bitmasks where each bit represents an occupied column or diagonal. Shifting masks left and right tracks diagonal constraints at CPU speed with zero memory allocations."

Add-Q 10 19 "Medium" "In 'Rat in a Maze', what prevents the rat from running in infinite loops between adjacent cells?" `
    "The rat has limited lives" `
    "Marking the current cell as visited before recursing into 4 directions, and unmarking it during backtrack" `
    "Restricting movement to right only" `
    "Randomizing movements" 1 `
    "Marking visited[r][c] = true prevents the recursive search from jumping back to the calling neighbor cell, avoiding circular recursion."

Add-Q 10 20 "Hard" "In 'Permutations II' (containing duplicate numbers), how do you skip duplicate branches?" `
    "Sort the array; skip when i > 0 && nums[i] == nums[i-1] && !used[i-1]" `
    "Use a hash map of permutations" `
    "Shuffle the array randomly" `
    "Skip all odd numbers" 0 `
    "Sorting groups duplicates. When nums[i] == nums[i-1], if nums[i-1] is NOT marked used, it means nums[i-1] was already used in the same position in a previous branch and backtracked, so using nums[i] would create an identical permutation."

Add-Q 10 21 "Medium" "What is the maximum recursion depth permitted before a Java application throws StackOverflowError (default thread stack size ~1MB)?" `
    "Exactly 100 calls" `
    "Typically between 5,000 and 15,000 stack frames depending on frame size" `
    "Infinite depth" `
    "2^31 - 1" 1 `
    "With default stack size (-Xss1m), a lightweight function can recurse roughly 10,000 times before exhausting thread stack space and throwing StackOverflowError."

Add-Q 10 22 "Hard" "In 'Matchsticks to Square' (partitioning array into 4 subsets with equal sum), why should the matchsticks be sorted descending before backtracking?" `
    "Descending order makes the square smaller" `
    "Larger matchsticks fail early if they exceed side_length, drastically pruning invalid branches at the shallowest tree levels" `
    "To make subset sum odd" `
    "Backtracking requires sorted arrays" 1 `
    "Greedy heuristic in backtracking: placing large elements first fills bucket capacity faster and triggers failure cuts much higher up in the recursion tree, turning exponential timeouts into sub-millisecond runs."

Add-Q 10 23 "Medium" "In recursive tree traversals (e.g. Inorder, Preorder, Postorder), what is the space complexity in terms of tree height H?" `
    "O(1)" `
    "O(H) representing maximum call stack depth" `
    "O(H^2)" `
    "O(2^H)" 1 `
    "At any given moment, the call stack holds frames along the path from the root down to the currently visited node, requiring O(H) auxiliary stack space."

Add-Q 10 24 "Hard" "In 'Split a String Into the Max Number of Unique Substrings', what data structure verifies uniqueness during backtracking?" `
    "HashSet of substrings added before recursive descent and removed during backtrack" `
    "Array of character counts" `
    "Bloom filter" `
    "Queue of words" 0 `
    "A HashSet stores distinct partitioned substrings. If set.add(sub) succeeds, recurse for remainder; on backtrack, set.remove(sub) restores state to test alternative cuts."

Add-Q 10 25 "Medium" "What is Tail Call Optimization (TCO)?" `
    "Compressing strings at the end of a file" `
    "A compiler optimization where a recursive call in the tail position reuses the current stack frame instead of allocating a new one" `
    "Terminating recursion early" `
    "Sorting call stack frames by size" 1 `
    "When the recursive call is the final statement executed in a function, tail call elimination reuses the current activation record, converting recursion into iteration with O(1) stack space (supported in C/C++/Scala, though not in standard JVM bytecode)."

Write-Output "Days 7, 8, 9, 10 loaded."
