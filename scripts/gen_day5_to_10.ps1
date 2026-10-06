# Day 5 to 10 Generator (150 Unique Questions)

# ==================== DAY 5: Computer Networks OSI & TCP/IP Layering ====================
Add-Q 5 1 "Medium" "Which layer of the OSI model is responsible for end-to-end process-to-process communication and port addressing?" `
    "Network Layer" `
    "Transport Layer" `
    "Data Link Layer" `
    "Session Layer" 1 `
    "The Transport Layer (Layer 4) handles host-to-host process communication using port numbers (e.g. TCP/UDP) and provides flow and error control."

Add-Q 5 2 "Hard" "In the TCP 3-way handshake, what sequence numbers are exchanged when Client connects to Server?" `
    "Client sends ACK; Server sends SYN" `
    "Client sends SYN (seq=x); Server replies SYN-ACK (seq=y, ack=x+1); Client sends ACK (ack=y+1)" `
    "Client sends DATA; Server sends FIN" `
    "Client sends RST; Server sends SYN" 1 `
    "TCP 3-way handshake initializes sequence numbers: Client sends SYN(seq=x); Server responds with SYN-ACK(seq=y, ack=x+1); Client concludes with ACK(ack=y+1)."

Add-Q 5 3 "Medium" "What is the primary difference between TCP and UDP?" `
    "UDP is connection-oriented and reliable; TCP is connectionless" `
    "TCP is connection-oriented, reliable, and byte-stream; UDP is connectionless, unreliable, and datagram-based" `
    "TCP runs on port 80; UDP cannot use ports" `
    "UDP guarantees packet delivery order" 1 `
    "TCP provides reliable, ordered, and error-checked delivery using acknowledgments and retransmissions. UDP provides low-overhead, best-effort datagram delivery without guarantees."

Add-Q 5 4 "Hard" "What is the role of the TIME_WAIT state in the TCP connection termination lifecycle?" `
    "To allow DNS to refresh cache" `
    "To ensure the final ACK is received by the remote endpoint and to prevent lingering delayed packets from colliding with a new connection on the same socket" `
    "To compress transmitted data before closing" `
    "To renegotiate TLS session tickets" 1 `
    "TIME_WAIT (usually 2 MSL - Maximum Segment Lifetime) ensures that the remote host received the final ACK. If the ACK was lost, retransmitted FINs can still be acknowledged without confusing subsequent connections."

Add-Q 5 5 "Medium" "Which protocol resolves a known IP address to a physical MAC address on a local area network?" `
    "DNS" `
    "DHCP" `
    "ARP (Address Resolution Protocol)" `
    "ICMP" 2 `
    "ARP broadcasts an inquiry on the local network segment asking 'Who has IP X?', and the device with IP X unicasts back its hardware MAC address."

Add-Q 5 6 "Hard" "In TCP congestion control, what happens when a timeout occurs (packet loss detected via RTO) in TCP Reno?" `
    "ssthresh is doubled and cwnd stays constant" `
    "ssthresh is set to cwnd/2, cwnd is reset to 1 MSS, and Slow Start begins" `
    "TCP switches to UDP mode" `
    "The connection is immediately terminated with an RST packet" 1 `
    "On retransmission timeout (severe congestion), TCP Reno sets ssthresh to half of current cwnd, resets congestion window (cwnd) back to 1 MSS, and re-enters the Slow Start phase."

Add-Q 5 7 "Medium" "What is the key advantage of HTTP/2 over HTTP/1.1?" `
    "HTTP/2 uses plain text headers" `
    "Multiplexing multiple requests/responses over a single TCP connection and HPACK header compression" `
    "HTTP/2 does not require TLS encryption" `
    "HTTP/2 replaces TCP with UDP" 1 `
    "HTTP/2 introduces binary framing and multiplexing, allowing multiple concurrent requests and responses over a single TCP connection without Head-of-Line blocking at the application layer."

Add-Q 5 8 "Hard" "How does HTTP/3 differ fundamentally from HTTP/2 in its underlying transport layer?" `
    "HTTP/3 uses WebSocket tunnels" `
    "HTTP/3 runs over QUIC on top of UDP instead of TCP, eliminating TCP-level Head-of-Line blocking" `
    "HTTP/3 eliminates TLS encryption" `
    "HTTP/3 only works on IPv6" 1 `
    "HTTP/3 is built on top of QUIC (which operates over UDP). If one packet is dropped, only that specific stream is delayed, solving TCP Head-of-Line blocking present in HTTP/2."

Add-Q 5 9 "Medium" "What is the standard port number for secure HTTPS communication?" `
    "80" `
    "21" `
    "443" `
    "8080" 2 `
    "HTTPS (HTTP over TLS/SSL) uses port 443 by default, whereas unencrypted HTTP uses port 80."

Add-Q 5 10 "Hard" "What is the Count-to-Infinity problem in Distance Vector routing algorithms like RIP?" `
    "Routers run out of memory storing routing tables" `
    "Routing loops cause metric values (hop counts) to increment indefinitely between neighboring routers when a link goes down" `
    "Routers send infinite broadcast packets" `
    "Routing tables crash at 256 entries" 1 `
    "In Distance Vector routing, slow convergence after a link failure can cause routers to continuously pass outdated distance metrics back and forth, slowly incrementing hop counts until infinity (or 16 in RIP) is reached."

Add-Q 5 11 "Medium" "Which layer of the OSI model handles data encryption, decryption, compression, and character encoding?" `
    "Session Layer" `
    "Presentation Layer (Layer 6)" `
    "Application Layer" `
    "Transport Layer" 1 `
    "The Presentation Layer formats data for the application, handling syntax translation, serialization, character sets, and cryptographic encryption/decryption."

Add-Q 5 12 "Hard" "What is the difference between Symmetric and Asymmetric encryption in SSL/TLS handshakes?" `
    "Symmetric uses one shared key for both encryption and decryption; Asymmetric uses a public-private key pair" `
    "Asymmetric is faster for transmitting large files" `
    "Symmetric does not require keys" `
    "Asymmetric only works in local networks" 0 `
    "Asymmetric cryptography (RSA/Diffie-Hellman) securely exchanges a shared session key during the handshake. Fast symmetric cryptography (AES) then encrypts bulk application data using that shared session key."

Add-Q 5 13 "Medium" "What does the TTL (Time to Live) field in an IPv4 packet header prevent?" `
    "Packet payload corruption" `
    "Packets from circulating endlessly in routing loops" `
    "Unauthorized port scanning" `
    "TCP buffer overruns" 1 `
    "Each router decrements the TTL field by 1 before forwarding. When TTL reaches 0, the packet is dropped and an ICMP Time Exceeded message is sent back, preventing infinite looping."

Add-Q 5 14 "Hard" "How does the 'traceroute' utility determine the route taken by packets across the Internet?" `
    "By querying the central ICANN DNS registry" `
    "By sending packets with incremental TTL values (starting at 1) and recording the IP addresses of routers returning ICMP Time Exceeded messages" `
    "By attaching GPS coordinates to IP headers" `
    "By decrypting BGP autonomous system tables" 1 `
    "Traceroute transmits packets with TTL=1, 2, 3... Each successive intermediate router drops the packet when TTL reaches 0 and replies with an ICMP Time Exceeded (Type 11), revealing its IP."

Add-Q 5 15 "Medium" "What is the purpose of the Subnet Mask in IPv4 networking?" `
    "To encrypt network broadcast packets" `
    "To differentiate the Network ID portion from the Host ID portion of an IP address" `
    "To assign dynamic MAC addresses" `
    "To authenticate firewall rules" 1 `
    "A subnet mask (e.g. 255.255.255.0 or /24) is a 32-bit number used by devices to determine which part of an IP address represents the network and which part represents the host."

Add-Q 5 16 "Hard" "In TCP flow control, what is the 'Silly Window Syndrome' and how is Nagle's Algorithm related to it?" `
    "A buffer overflow caused by too many small windows; Nagle's algorithm delays sending small segments until an ACK is received or MSS is accumulated" `
    "A deadlock between two DNS servers" `
    "A virus in the TCP stack" `
    "An error in IP fragmentation" 0 `
    "Silly Window Syndrome occurs when tiny chunks of data (e.g. 1 byte) are exchanged, wasting overhead. Nagle's algorithm aggregates small outgoing writes into full MSS segments before sending."

Add-Q 5 17 "Medium" "Which protocol automatically assigns IP addresses, default gateways, and DNS servers to client devices joining a network?" `
    "SNMP" `
    "DHCP (Dynamic Host Configuration Protocol)" `
    "ARP" `
    "NAT" 1 `
    "DHCP automates network configuration for devices using the 4-step DORA process (Discover, Offer, Request, Acknowledge)."

Add-Q 5 18 "Hard" "What is a SYN Flood attack and what mechanism is commonly used to mitigate it?" `
    "Flooding a server with HTTP GET requests; mitigated by caching" `
    "Sending a barrage of TCP SYN packets with spoofed IPs to exhaust server connection backlogs; mitigated by SYN Cookies" `
    "Flooding UDP ports with ICMP echo requests; mitigated by NAT" `
    "Flooding DNS servers with invalid TLD queries; mitigated by BIND" 1 `
    "A SYN Flood exhausts the server's half-open connection queue. SYN Cookies encode connection state into the initial sequence number (ISN), eliminating the need to allocate memory until the final ACK arrives."

Add-Q 5 19 "Medium" "What is the maximum payload size of a standard Ethernet frame (Standard MTU)?" `
    "512 bytes" `
    "1500 bytes" `
    "65535 bytes" `
    "4096 bytes" 1 `
    "The standard Maximum Transmission Unit (MTU) for Ethernet is 1500 bytes (excluding Ethernet header and trailer)."

Add-Q 5 20 "Hard" "What is the distinction between Iterative and Recursive DNS queries?" `
    "In recursive queries, the client queries each nameserver itself; in iterative, the server does all queries" `
    "In recursive queries, the contacted DNS server assumes full responsibility to resolve the domain; in iterative queries, the server returns the best referral to the next nameserver" `
    "Recursive queries use TCP; iterative queries use UDP" `
    "Iterative queries only work for .com domains" 1 `
    "In a recursive query, the local DNS resolver does the full legwork until it gets an answer. In an iterative query, queried nameservers reply with referrals ('I don't know, ask this other nameserver')."

Add-Q 5 21 "Medium" "What is Network Address Translation (NAT) and why is it essential for IPv4?" `
    "It converts IPv4 addresses into domain names" `
    "It remaps private IP addresses in a local network to a single public IP address, conserving scarce IPv4 address space" `
    "It routes packets between OSI layers 2 and 3" `
    "It provides hardware authentication for Wi-Fi routers" 1 `
    "NAT enables multiple devices with private IPv4 addresses (RFC 1918) to share one public IP address, slowing IPv4 exhaustion and providing basic boundary security."

Add-Q 5 22 "Hard" "In BGP (Border Gateway Protocol), what routing metric is used to determine paths between Autonomous Systems (AS)?" `
    "Hop count only" `
    "Path vector attributes (such as AS-Path length, Local Preference, and MED)" `
    "Bandwidth and link latency (Dijkstra algorithm)" `
    "MAC address distance" 1 `
    "BGP is a Path Vector protocol that inspects the sequence of Autonomous Systems in the AS-Path attribute, along with policy weights like Local Preference and Multi-Exit Discriminator."

Add-Q 5 23 "Medium" "Which ICMP message type is returned during a standard successful ping response?" `
    "Type 8 (Echo Request)" `
    "Type 0 (Echo Reply)" `
    "Type 3 (Destination Unreachable)" `
    "Type 11 (Time Exceeded)" 1 `
    "Ping sends an ICMP Echo Request (Type 8), and the destination responds with an ICMP Echo Reply (Type 0)."

Add-Q 5 24 "Hard" "Why is UDP used for real-time multiplayer gaming and live audio/video streaming rather than TCP?" `
    "UDP automatically corrects bit errors" `
    "UDP avoids retransmission delays and Head-of-Line blocking; fresh real-time data is more valuable than late retransmitted packets" `
    "UDP has stronger encryption capabilities" `
    "UDP packets travel over fiber optic cables only" 1 `
    "In real-time media, a late packet is useless. TCP's mandatory retransmissions and Head-of-Line blocking create unpredictable jitter, whereas UDP delivers packets with minimum latency."

Add-Q 5 25 "Medium" "What is the purpose of the 4-way handshake in WPA2 Wi-Fi security?" `
    "To assign a DHCP IP address" `
    "To derive pairwise encryption keys (PTK) without ever transmitting the pre-shared passphrase across the air" `
    "To authenticate MAC addresses with the ISP" `
    "To test signal strength between antenna arrays" 1 `
    "The 4-way handshake verifies that both client and access point possess the Pre-Shared Key (PSK) and establishes dynamic encryption keys (PTK/GTK) without exposing the secret."

# ==================== DAY 6: Arrays & Two Pointer Technique ====================
Add-Q 6 1 "Medium" "Given a sorted array, what is the time complexity of the Two-Pointer approach to find two numbers that sum to a target?" `
    "O(N^2)" `
    "O(N log N)" `
    "O(N)" `
    "O(1)" 2 `
    "With pointers at opposite ends (left=0, right=n-1), each comparison shifts either left rightward or right leftward, scanning the array in exactly O(N) time and O(1) space."

Add-Q 6 2 "Hard" "What algorithmic invariant does Kadane's Algorithm maintain to find the Maximum Subarray Sum in O(N) time?" `
    "current_sum = max(nums[i], current_sum + nums[i]); max_so_far = max(max_so_far, current_sum)" `
    "current_sum = current_sum * nums[i]" `
    "current_sum = sum(nums[0..i]) - min(nums[0..i])" `
    "Two nested loops comparing prefix sums" 0 `
    "At each index i, we decide whether to add nums[i] to the existing running subarray or start a fresh subarray at nums[i], updating global max_so_far in O(N) time."

Add-Q 6 3 "Medium" "In the Dutch National Flag algorithm (Sort Colors: 0s, 1s, and 2s), how many pointers are used and what is the time complexity?" `
    "2 pointers, O(N log N)" `
    "3 pointers (low, mid, high), O(N) single pass and O(1) space" `
    "4 pointers, O(N^2)" `
    "1 pointer, O(N)" 1 `
    "Dijkstra's Dutch National Flag algorithm uses 3 pointers: low tracks the boundary of 0s, mid explores the array, and high tracks the boundary of 2s in a single O(N) pass."

Add-Q 6 4 "Hard" "In the 'Container With Most Water' problem, why do we move the pointer pointing to the shorter vertical line inward?" `
    "Because the width decreases, so only a taller line can potentially yield a larger area" `
    "Because shorter lines cannot hold water" `
    "To sort the array as we iterate" `
    "It is an arbitrary heuristic with 50% probability" 0 `
    "Area is limited by min(height[l], height[r]) * (r - l). Moving the taller pointer only shrinks the width while guaranteeing the height cannot exceed the current shorter line, so area could never increase."

Add-Q 6 5 "Medium" "What is the Boyer-Moore Voting Algorithm used for, and what are its complexities?" `
    "Sorting arrays in O(N log N)" `
    "Finding the Majority Element (appearing > N/2 times) in O(N) time and O(1) auxiliary space" `
    "Finding primes in O(N)" `
    "Reversing arrays in O(1) space" 1 `
    "Boyer-Moore tracks a candidate and a counter. When counter reaches 0, the current element becomes the candidate. It identifies the majority element in O(N) time and O(1) space."

Add-Q 6 6 "Hard" "In the 'Trapping Rain Water' problem, how does the Two-Pointer approach achieve O(N) time and O(1) auxiliary space?" `
    "By maintaining left_max and right_max, processing the side with the smaller max inward" `
    "By sorting the heights ascending" `
    "By running dynamic programming on prefix differences" `
    "By checking every column against every other column" 0 `
    "Because water trapped at position i is min(left_max, right_max) - height[i], if left_max < right_max, water trapped at the left pointer is strictly bounded by left_max regardless of taller walls to the right."

Add-Q 6 7 "Medium" "What is the optimal in-place algorithm to rotate an array of size N to the right by K steps?" `
    "Use a hash map to map indices" `
    "Reverse the entire array, then reverse the first K elements, then reverse the remaining N-K elements" `
    "Bubble sort elements K times" `
    "Allocate a new array of size K" 1 `
    "The 3-reverse technique achieves in-place rotation in O(N) time and O(1) space: reverse(0, n-1), reverse(0, k-1), and reverse(k, n-1) with k = k % n."

Add-Q 6 8 "Hard" "How do you solve 'Product of Array Except Self' in O(N) time WITHOUT using the division operator?" `
    "Calculate prefix products in a first pass, then multiply with suffix products in a reverse pass" `
    "Bitwise shift all array elements" `
    "Use binary search over logarithms" `
    "Divide using logarithmic approximations" 0 `
    "Pass 1 builds prefix products: ans[i] = product of all nums[0..i-1]. Pass 2 traverses backward maintaining a running suffix product and multiplying it into ans[i] in O(1) auxiliary space."

Add-Q 6 9 "Medium" "How does 'Move Zeroes' move all 0s to the end while maintaining relative order of non-zero elements in-place?" `
    "Counting sort on 0 and 1" `
    "Two pointers: a slow pointer writes non-zero elements forward; remaining slots are filled with 0s" `
    "Nested loop shifting all elements on encountering 0" `
    "Reverse the array twice" 1 `
    "A slow pointer tracks where the next non-zero should land. Iterate fast pointer through the array; whenever nums[fast] != 0, write to nums[slow++] and finally fill remaining indices with 0."

Add-Q 6 10 "Hard" "What is the next lexicographical permutation algorithm (Next Permutation)?" `
    "Sort the array descending" `
    "Find largest index i where a[i] < a[i+1]; find largest j > i where a[j] > a[i]; swap(a[i], a[j]); reverse from i+1 to end" `
    "Swap the first and last elements" `
    "Randomly shuffle until a larger permutation is encountered" 1 `
    "Classic algorithm: scan from right to find first dip (a[i] < a[i+1]), find smallest element to its right larger than a[i], swap them, and reverse the remaining suffix to make it minimally ascending."

Add-Q 6 11 "Medium" "In '3Sum' (finding all unique triplets that sum to 0), what preprocessing step enables the two-pointer technique?" `
    "Hashing all elements in a Bloom filter" `
    "Sorting the array in O(N log N) time" `
    "Converting all integers to positive values" `
    "Computing prefix sum array" 1 `
    "Sorting allows fixing the first element nums[i] and using two converging pointers (left and right) for the remaining pair in O(N), giving O(N^2) total time while easily skipping duplicates."

Add-Q 6 12 "Hard" "How can you find duplicate numbers in an array of size N+1 containing integers from 1 to N without modifying the array and in O(1) space?" `
    "Kadane's algorithm" `
    "Floyd's Tortoise and Hare Cycle Detection treating array values as pointers (nums[i] -> next index)" `
    "Bitwise XOR of all elements" `
    "Binary search on floating point values" 1 `
    "Because each value is between 1 and N, the array can be viewed as a functional graph with edges i -> nums[i]. By Dirichlet's box principle, a cycle exists. Floyd's cycle finding identifies the entrance in O(N) time and O(1) space."

Add-Q 6 13 "Medium" "What is the time complexity of finding the Longest Consecutive Sequence in an unsorted array using a HashSet?" `
    "O(N log N)" `
    "O(N^2)" `
    "O(N)" `
    "O(2^N)" 2 `
    "Add all elements to a HashSet. For each element x, only start expanding a streak if x-1 is NOT in the set (ensuring each streak is explored only from its root), resulting in O(N) overall time."

Add-Q 6 14 "Hard" "In 'Subarray Sum Equals K', why is a simple Two-Pointer sliding window insufficient when the array contains negative numbers?" `
    "Because the window sum is no longer monotonically increasing when expanding the right boundary" `
    "Because negative numbers crash the integer accumulator" `
    "Two pointers only work on strings" `
    "Pointers cannot move leftward" 0 `
    "Two pointers rely on monotonic growth (expanding right increases sum; shrinking left decreases sum). Negative numbers violate this monotonicity, necessitating a Prefix Sum + Hash Map approach in O(N)."

Add-Q 6 15 "Medium" "How does 'Merge Sorted Array' merge nums2 into nums1 (which has enough buffer at the end) in-place without overwriting?" `
    "Merge starting from the smallest elements at index 0" `
    "Merge from the back (largest elements to end of nums1)" `
    "Use Quicksort on the combined array" `
    "Insert each nums2 element using binary search" 1 `
    "Starting comparison from the end (index m-1 and n-1) and placing the larger element at index m+n-1 guarantees you never overwrite unprocessed elements in nums1."

Add-Q 6 16 "Hard" "In 'Maximum Product Subarray', why must we maintain both the maximum product and the minimum product at each step?" `
    "To handle floating point precision" `
    "Because multiplying a negative number with the minimum (most negative) product can yield a new maximum product" `
    "To calculate standard deviation" `
    "Because arrays can have duplicate zeroes" 1 `
    "A negative number flips signs: min_prod * negative becomes a large positive value. Thus, tracking both max_prod and min_prod at each position is required."

Add-Q 6 17 "Medium" "What is the optimal technique to rotate an N x N 2D matrix clockwise by 90 degrees in-place?" `
    "Transpose the matrix (swap matrix[i][j] with matrix[j][i]), then reverse each row" `
    "Reverse columns, then transpose" `
    "Invert bits of each cell" `
    "Shift every row right by N steps" 0 `
    "Clockwise 90-degree rotation is mathematically equivalent to transposing the matrix across its main diagonal followed by reversing each row horizontally."

Add-Q 6 18 "Hard" "How can 'Set Matrix Zeroes' achieve O(1) auxiliary space when modifying an M x N matrix in-place?" `
    "By using first row and first column of the matrix itself as state flags" `
    "By negating all values in the matrix" `
    "By using recursion stack memory" `
    "By converting integers to strings" 0 `
    "Instead of allocating extra boolean arrays of size M and N, use matrix[i][0] and matrix[0][j] as markers, tracking whether the first row and first column originally contained zeroes with two boolean flags."

Add-Q 6 19 "Medium" "What is the time complexity of merging overlapping intervals after sorting them by start time?" `
    "O(N^2)" `
    "O(N log N) dominated by the initial sort" `
    "O(N) with no sorting" `
    "O(2^N)" 1 `
    "Sorting intervals by their starting boundary takes O(N log N). A single linear O(N) pass then compares each interval's start with the previous interval's end to merge overlaps."

Add-Q 6 20 "Hard" "In the 'Wiggle Sort II' problem (nums[0] < nums[1] > nums[2] < nums[3]...), what theoretical technique achieves O(N) time and O(1) space?" `
    "Bubble sort adjacent pairs" `
    "Three-way partitioning (Dutch National Flag) around the median combined with virtual index mapping" `
    "Bucket sort using 1000 buckets" `
    "Bitwise manipulation on indices" 1 `
    "Find the median in O(N) using Quickselect, then perform 3-way partitioning using virtual index mapping (1 + 2*i) % (n | 1) to arrange elements around the median in O(N) time and O(1) space."

Add-Q 6 21 "Medium" "What does the 'Two Sum' hash map approach store as keys and values?" `
    "Key: index; Value: number" `
    "Key: number; Value: its index in the array" `
    "Key: target; Value: number" `
    "Key: prefix sum; Value: count" 1 `
    "The hash map stores each previously visited number as the key and its index as the value. For each element x, we check if target - x already exists in the map."

Add-Q 6 22 "Hard" "In an array of positive integers, how do you find the minimum length subarray with sum >= S in O(N) time?" `
    "Sorting the array" `
    "Sliding window: expand right pointer until sum >= S, then shrink left pointer while updating min_len" `
    "Nested loops checking all subarrays" `
    "Kadane's algorithm with subtraction" 1 `
    "Because all numbers are positive, the window sum is monotonic. Expand right to reach or exceed S, then contract left as much as possible while maintaining sum >= S in O(N) total pointer moves."

Add-Q 6 23 "Medium" "How do you find the single missing number in an array containing N distinct numbers taken from 0, 1, 2, ..., N?" `
    "Sort the array and scan" `
    "Compute expected sum N*(N+1)/2 and subtract the actual array sum (or XOR all numbers with 0..N)" `
    "Binary search on unsorted array" `
    "Hash map of size 2*N" 1 `
    "The sum formula N*(N+1)/2 computes the total in O(N) time and O(1) space. Alternatively, XORing all array elements with all integers from 0 to N yields the missing number without integer overflow."

Add-Q 6 24 "Hard" "In 'Candy' (LeetCode Hard), children with higher ratings get more candies than neighbors. How is this solved in O(N) time?" `
    "Priority Queue sorting ratings" `
    "Two passes: Left-to-right pass satisfying left neighbor condition, followed by Right-to-left pass satisfying right neighbor condition" `
    "Greedy randomized assignments" `
    "Bellman-Ford algorithm on rating graph" 1 `
    "Initialize candies with 1. First pass (left to right): if rating[i] > rating[i-1], candies[i] = candies[i-1] + 1. Second pass (right to left): if rating[i] > rating[i+1], candies[i] = max(candies[i], candies[i+1] + 1)."

Add-Q 6 25 "Medium" "What is the time complexity to remove duplicates from a sorted array in-place?" `
    "O(N^2)" `
    "O(N) time and O(1) space" `
    "O(N log N)" `
    "O(log N)" 1 `
    "Using two pointers: one pointer iterates through the array while the write pointer advances only when a new distinct value is encountered, modifying the array in O(N) time and O(1) space."

Write-Output "Days 5 and 6 loaded."
