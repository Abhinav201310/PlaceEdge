# Generator for Days 23 to 25 (75 Unique Questions)

# ==================== DAY 23: Computer Networks Protocols & DNS ====================
Add-Q 23 1 "Medium" "In the DNS hierarchy, what is the Top-Level Domain (TLD) for the domain 'example.com'?" `
    "example" `
    ".com" `
    "The root dot (.)" `
    "http" 1 `
    "In DNS hierarchy: root is '.', TLD is '.com', authoritative second-level domain is 'example', and hostname/subdomain might be 'www'."

Add-Q 23 2 "Hard" "What is the 4-step DHCP exchange known as DORA?" `
    "Dial, Open, Read, Accept" `
    "Discover (broadcast), Offer (unicast/broadcast), Request (broadcast), Acknowledge (unicast)" `
    "Detect, Observe, Resolve, Allocate" `
    "Direct, Overwrite, Route, Authenticate" 1 `
    "DHCP DORA workflow: Client broadcasts DHCPDISCOVER -> Server offers DHCPOFFER -> Client broadcasts DHCPREQUEST -> Server confirms with DHCPACK containing IP lease parameters."

Add-Q 23 3 "Medium" "Which DNS record type maps a domain name to an IPv4 address?" `
    "AAAA Record" `
    "A Record" `
    "CNAME Record" `
    "MX Record" 1 `
    "An 'A' (Address) record maps a hostname to an IPv4 address. An 'AAAA' record maps a hostname to an IPv6 address."

Add-Q 23 4 "Hard" "What is the difference between a CNAME (Canonical Name) record and an A record in DNS?" `
    "CNAME maps to an IP address directly" `
    "An A record maps a hostname to an IP address; a CNAME record maps an alias hostname to another canonical hostname (requiring another lookup to resolve to an IP)" `
    "CNAME is only for email servers" `
    "A records can only be queried over TCP" 1 `
    "A CNAME points one domain alias to another domain name (e.g. app.placeedge.com -> placeedge.com). The DNS resolver follows the alias chain until an A record resolves the physical IP."

Add-Q 23 5 "Medium" "What does the ARP (Address Resolution Protocol) cache store?" `
    "Mapping of IP addresses to MAC (Media Access Control) hardware addresses on the local network segment" `
    "Mapping of domain names to IP addresses" `
    "Port numbers of active web servers" `
    "Router routing tables" 0 `
    "The ARP table caches IP-to-MAC address pairs, allowing the network interface to encapsulate IP packets into Ethernet frames without broadcasting an ARP request for every packet."

Add-Q 23 6 "Hard" "What is ARP Poisoning / ARP Spoofing and what security risk does it pose?" `
    "Deleting the ARP cache" `
    "An attacker broadcasts forged Gratuitous ARP messages associating their own MAC address with the default gateway's IP, intercepting local LAN traffic (Man-in-the-Middle)" `
    "Injecting malware into DNS records" `
    "Overheating network switches" 1 `
    "Because ARP has no authentication, forged ARP replies deceive victims into sending traffic destined for the router to the attacker's MAC address, facilitating packet eavesdropping and modification."

Add-Q 23 7 "Medium" "Which protocol is used by the 'ping' utility to test host reachability?" `
    "TCP" `
    "ICMP (Internet Control Message Protocol)" `
    "UDP" `
    "SNMP" 1 `
    "Ping uses ICMP (running directly on top of IP at Layer 3) sending Echo Request (Type 8) and expecting Echo Reply (Type 0)."

Add-Q 23 8 "Hard" "In TLS 1.3, how many round trips (RTT) are required to complete the handshake and begin sending application data compared to TLS 1.2?" `
    "TLS 1.3 requires 2 RTT; TLS 1.2 requires 3 RTT" `
    "TLS 1.3 requires only 1 RTT (and supports 0-RTT resumption), whereas TLS 1.2 required 2 RTT" `
    "Both require 5 RTT" `
    "TLS 1.3 uses UDP and zero round trips" 1 `
    "TLS 1.3 combines key exchange (Diffie-Hellman parameters) and cipher negotiation into the ClientHello, reducing handshake latency from 2 RTT to 1 RTT (with 0-RTT for resumed sessions)."

Add-Q 23 9 "Medium" "Which port does DNS primarily use, and which transport protocol does standard query resolution employ?" `
    "Port 80 over TCP" `
    "Port 53 over UDP (with TCP used for large responses > 512 bytes or zone transfers)" `
    "Port 443 over UDP" `
    "Port 25 over TCP" 1 `
    "DNS operates on port 53. Fast standard queries use UDP for low latency; TCP is used when response size exceeds 512 bytes (or EDNS0 limits) or during DNS zone transfers."

Add-Q 23 10 "Hard" "What is Server-Sent Events (SSE) and how does it compare to WebSockets?" `
    "SSE provides bidirectional communication over UDP" `
    "SSE is a unidirectional server-to-client streaming protocol over standard HTTP; WebSockets is bidirectional full-duplex over a dedicated TCP connection" `
    "WebSockets only work for text; SSE works for binary only" `
    "SSE requires third-party browser plugins" 1 `
    "SSE uses standard HTTP (Content-Type: text/event-stream) allowing servers to push updates to clients with automatic reconnects. WebSockets is needed when clients must also send frequent low-latency data back."

Add-Q 23 11 "Medium" "What is an MX record in DNS?" `
    "A record that points to mobile websites" `
    "Mail Exchange record that specifies the mail server responsible for accepting email messages on behalf of a domain" `
    "Master XML configuration record" `
    "Multi-cast IP routing record" 1 `
    "An MX record directs email delivery (SMTP) to the authoritative mail servers for the domain, with priority weights indicating fallback order."

Add-Q 23 12 "Hard" "What is Cross-Origin Resource Sharing (CORS) and why does a browser send an HTTP OPTIONS Preflight request?" `
    "A firewall that blocks foreign IP addresses" `
    "A browser security mechanism that restricts cross-origin HTTP requests; preflight OPTIONS checks if the target server permits the method and headers before sending non-simple requests" `
    "A technique for sharing cookies between all websites" `
    "An encryption algorithm for web fonts" 1 `
    "CORS prevents malicious websites from issuing unauthorized requests to third-party APIs using ambient credentials. For non-simple requests (e.g. PUT/DELETE or custom headers), browsers send an OPTIONS preflight to verify server consent."

Add-Q 23 13 "Medium" "What is an APIPA (Automatic Private IP Addressing) address range assigned by Windows when DHCP server fails?" `
    "192.168.1.x" `
    "169.254.x.x (169.254.0.1 to 169.254.255.254)" `
    "10.0.0.x" `
    "127.0.0.1" 1 `
    "When a device fails to acquire an IP from a DHCP server, Windows automatically self-assigns an address in the link-local range 169.254.0.0/16 (APIPA)."

Add-Q 23 14 "Hard" "In DNS resolution, what is DNS Cache Poisoning (DNS Spoofing) and how does DNSSEC prevent it?" `
    "Clearing browser cookies" `
    "Injecting false IP mappings into a recursive DNS resolver's cache so users visiting a domain are redirected to an attacker's server; DNSSEC uses cryptographic digital signatures to verify authenticity" `
    "A DDoS attack on root DNS servers" `
    "Corrupting the local hosts file" 1 `
    "Attackers forge DNS replies with matching transaction IDs to poison cached records. DNSSEC signs DNS zones cryptographically, enabling resolvers to verify signature chains from the root down to target records."

Add-Q 23 15 "Medium" "Which protocol is used for secure remote command-line login across networks?" `
    "Telnet" `
    "SSH (Secure Shell) on port 22" `
    "FTP on port 21" `
    "RDP on port 80" 1 `
    "SSH provides encrypted communications, public-key authentication, and secure shell access on port 22, completely replacing insecure plaintext Telnet."

Add-Q 23 16 "Hard" "What is the difference between IMAP and POP3 email protocols?" `
    "POP3 synchronizes folders across multiple devices; IMAP downloads and deletes from server" `
    "POP3 downloads emails to local client and deletes from server; IMAP keeps emails on the server and synchronizes folder states across multiple devices" `
    "IMAP is used to send emails; POP3 is used to receive" `
    "IMAP runs on port 25; POP3 on port 80" 1 `
    "POP3 is a legacy protocol that typically pulls mail onto a single machine. IMAP manages mail directly on the mail server, keeping inboxes, sent items, and read states synchronized across all client devices."

Add-Q 23 17 "Medium" "What is the loopback IPv4 address used to refer to the local computer?" `
    "0.0.0.0" `
    "127.0.0.1 (localhost)" `
    "255.255.255.255" `
    "192.168.0.1" 1 `
    "127.0.0.1 is the standard loopback address, routing network requests directly back into the local machine without transmitting packets onto physical network interfaces."

Add-Q 23 18 "Hard" "What is HTTP Strict Transport Security (HSTS)?" `
    "A password hashing protocol" `
    "A web security policy header that forces browsers to interact with the domain ONLY over secure HTTPS connections, preventing SSL-stripping man-in-the-middle attacks" `
    "A firewall for HTTP proxy servers" `
    "A tool for blocking web trackers" 1 `
    "The Strict-Transport-Security header instructs compliant browsers that the domain must never be contacted via plaintext HTTP, automatically upgrading all attempts to HTTPS before requests leave the client."

Add-Q 23 19 "Medium" "Which protocol is responsible for sending outgoing email from a mail client to an email server?" `
    "HTTP" `
    "SMTP (Simple Mail Transfer Protocol)" `
    "POP3" `
    "IMAP" 1 `
    "SMTP (default ports 25, 587 with STARTTLS) is used to send and relay outgoing email messages. IMAP and POP3 are used exclusively to retrieve emails from the mailbox."

Add-Q 23 20 "Hard" "What is Anycast routing and how is it used in Global DNS Root Servers and CDNs?" `
    "Broadcasting packets to every device on earth" `
    "Announcing the exact same IP address from multiple geographic locations via BGP, routing users to the topologically nearest server automatically" `
    "Routing all traffic through a single supercomputer" `
    "Encrypting IP packets with GPS data" 1 `
    "Anycast advertises identical IP prefixes from dozens of global data centers. BGP routing naturally directs each client to the nearest network node, reducing latency and absorbing DDoS attacks."

Add-Q 23 21 "Medium" "What is the primary function of the ICMP protocol in IP networking?" `
    "To transfer web files" `
    "To communicate diagnostic network status and error messages between routers and hosts (e.g. Destination Unreachable, Time Exceeded)" `
    "To encrypt email payloads" `
    "To manage virtual memory" 1 `
    "ICMP is a network-layer management protocol used by network devices to send error reports (e.g. router buffer full, TTL expired) and test connectivity (echo ping)."

Add-Q 23 22 "Hard" "In IPv6, why is ARP no longer used, and what protocol replaces it?" `
    "IPv6 devices do not have MAC addresses" `
    "Neighbor Discovery Protocol (NDP) running over ICMPv6 replaces ARP using multicast rather than broadcast" `
    "DNS resolves MAC addresses directly in IPv6" `
    "DHCPv6 is mandatory for all lookups" 1 `
    "IPv6 eliminates broadcast traffic entirely. The Neighbor Discovery Protocol (NDP) uses ICMPv6 Neighbor Solicitation and Advertisement multicast packets to map IPv6 addresses to MAC addresses."

Add-Q 23 23 "Medium" "What does the 'robots.txt' file in the root of a web server instruct?" `
    "It installs security software on client laptops" `
    "It instructs web crawlers and search engine indexing bots which URL paths they are allowed or disallowed to scrape" `
    "It controls server CPU clock rate" `
    "It defines database schemas" 1 `
    "robots.txt provides scraping directives for compliant search engine bots (like Googlebot), specifying which directory paths are disallowed from indexing."

Add-Q 23 24 "Hard" "What is a TLS Session Ticket and how does it optimize SSL connection resumption?" `
    "A paper receipt printed by servers" `
    "An encrypted bundle containing TLS session state created by the server and stored on the client; presented by the client on reconnect to resume encryption without server-side memory storage" `
    "A password stored in plain text" `
    "A token that disables encryption" 1 `
    "Session Tickets (RFC 5077) offload state from the server to the client. The client returns the encrypted ticket in ClientHello, allowing the server to decrypt and resume the session in 0-1 RTT without maintaining a large server session cache."

Add-Q 23 25 "Medium" "What is the maximum number of usable IP addresses in a /24 subnet (e.g. 192.168.1.0/24)?" `
    "256" `
    "254 (256 minus network address .0 and broadcast address .255)" `
    "255" `
    "128" 1 `
    "A /24 subnet has 8 host bits = 2^8 = 256 total addresses. The lowest address (.0) is reserved as the Network ID and the highest (.255) is the Broadcast address, leaving 254 usable host addresses."

# ==================== DAY 24: Bit Manipulation & Math Tricks ====================
Add-Q 24 1 "Medium" "What does the expression '(n & (n - 1)) == 0' test for a positive integer n > 0?" `
    "Whether n is an odd number" `
    "Whether n is a Power of Two" `
    "Whether n is divisible by 3" `
    "Whether n is a negative number" 1 `
    "A power of two in binary has exactly one set bit (e.g. 8 is 1000). Subtracting 1 flips that bit and sets all lower bits (7 is 0111). Performing bitwise AND yields 0."

Add-Q 24 2 "Hard" "What is Brian Kernighan's Algorithm and what is its time complexity to count set bits in an integer n?" `
    "It checks all 32 bits sequentially in O(32)" `
    "It repeatedly clears the lowest set bit using n = n & (n - 1); loops exactly K times where K is the number of set bits (O(K))" `
    "It converts n to a string" `
    "It runs in O(log(log n)) using division" 1 `
    "Brian Kernighan's algorithm directly jumps between set bits. Each operation n = n & (n - 1) extinguishes the lowest set bit, terminating in time proportional to the count of 1-bits."

Add-Q 24 3 "Medium" "In 'Single Number I' (every element appears twice except one), how do you find the unique element in O(N) time and O(1) space?" `
    "Sort the array and scan adjacent pairs" `
    "Compute the bitwise XOR (^) of all elements in the array; duplicate pairs cancel out (x ^ x = 0), leaving only the single element" `
    "Use a hash map of frequencies" `
    "Sum all elements and divide by 2" 1 `
    "XOR is commutative and associative: x ^ x = 0 and x ^ 0 = x. XORing all elements together cancels out all duplicated pairs, isolating the single unique element."

Add-Q 24 4 "Hard" "In 'Single Number II' (every element appears three times except one), how can this be solved using bitwise counters?" `
    "Sort array descending" `
    "Count set bits at each of the 32 bit positions modulo 3; bits with sum % 3 != 0 belong to the unique element (or use two bitmask registers 'ones' and 'twos')" `
    "XOR all elements" `
    "Sum elements and multiply by 3" 1 `
    "Because duplicate numbers appear 3 times, their set bits contribute multiples of 3 at each bit index. Summing bit counts modulo 3 cancels out all tripled numbers and reconstructs the unique element."

Add-Q 24 5 "Medium" "What bitwise operation toggles the k-th bit of an integer n (flips 0 to 1, or 1 to 0)?" `
    "n & (1 << k)" `
    "n ^ (1 << k)" `
    "n | (1 << k)" `
    "n >> k" 1 `
    "XOR with 1 inverts a bit (0 ^ 1 = 1, 1 ^ 1 = 0), and XOR with 0 preserves the bit. Thus n ^ (1 << k) toggles bit k."

Add-Q 24 6 "Hard" "How do you isolate the lowest set bit (rightmost 1-bit) of an integer n in two's complement representation?" `
    "n & (n - 1)" `
    "n & (-n)" `
    "n ^ (n + 1)" `
    "~n" 1 `
    "In two's complement, -n = ~n + 1. Performing n & (-n) isolates the rightmost set bit (e.g. for 12 = 1100_2, -12 = ...0100_2, and 12 & -12 = 0100_2 = 4)."

Add-Q 24 7 "Medium" "What does the expression 'n >> 1' compute for a non-negative integer n?" `
    "n multiplied by 2" `
    "Integer division: floor(n / 2)" `
    "n squared" `
    "Negation of n" 1 `
    "Right-shifting bits by 1 position drops the least significant bit, which is mathematically equivalent to integer division by 2."

Add-Q 24 8 "Hard" "In 'Counting Bits' (return count of 1-bits for all numbers from 0 to N), what 1D DP transition computes each dp[i] in O(1)?" `
    "dp[i] = dp[i - 1] + 1" `
    "dp[i] = dp[i >> 1] + (i & 1)" `
    "dp[i] = dp[i / 3]" `
    "dp[i] = i % 2" 1 `
    "The binary representation of i is simply (i >> 1) shifted left by 1 with (i & 1) appended as the last bit. Thus dp[i] = dp[i >> 1] + (i & 1) solves the entire array up to N in strictly O(N) time."

Add-Q 24 9 "Medium" "How can you check if an integer n is even or odd using bit manipulation?" `
    "(n & 1) == 0 is even, (n & 1) == 1 is odd" `
    "(n | 1) == 0 is even" `
    "(n ^ 1) == 0 is odd" `
    "Check if n is positive" 0 `
    "The least significant bit (LSB) indicates the parity: in binary, all even numbers end in 0 and all odd numbers end in 1. Masking with & 1 tests this in a single CPU cycle."

Add-Q 24 10 "Hard" "In 'Reverse Bits' of a 32-bit unsigned integer, how can divide-and-conquer bitmask swapping optimize the reversal?" `
    "Shift bits one by one in 32 loops" `
    "Swap adjacent 16-bit blocks, then 8-bit blocks, then 4-bit blocks, then 2-bit, then 1-bit using masks (0x55555555, 0x33333333, etc.) in 5 operations" `
    "Convert to string and reverse" `
    "Multiply by -1" 1 `
    "Parallel bitmask swapping: swap 16-bit halves, then bytes (mask 0x00FF00FF), nibbles (0x0F0F0F0F), pairs (0x33333333), and single bits (0x55555555) in O(1) without loops."

Add-Q 24 11 "Medium" "How can you swap two integer variables a and b in-place without using a temporary variable?" `
    "a = a * b; b = a / b; a = a / b;" `
    "a = a ^ b; b = a ^ b; a = a ^ b;" `
    "a = b; b = a;" `
    "a = ~b; b = ~a;" 1 `
    "The 3-XOR swap: step 1 sets a = a ^ b; step 2 sets b = (a ^ b) ^ b = a; step 3 sets a = (a ^ b) ^ a = b, swapping variables without extra memory."

Add-Q 24 12 "Hard" "In 'Single Number III' (exactly two numbers appear once, all others appear twice), how do you partition numbers into two groups?" `
    "Sort the array and divide in half" `
    "Compute total XOR (diff = x ^ y); find any set bit in diff (e.g. diff & -diff); partition array into two subsets based on that bit and XOR each subset independently" `
    "Split into even and odd indices" `
    "Compute sum of squares" 1 `
    "Because x and y are distinct, x ^ y has at least one bit set to 1. Using that bit to partition the array splits x and y into different buckets while pairs land in the same bucket, isolating both numbers."

Add-Q 24 13 "Medium" "What does the bitwise NOT operator (~) do to a signed integer in two's complement representation?" `
    "Multiplies by -1" `
    "Inverts all bits, yielding ~x = -(x + 1)" `
    "Sets all bits to 1" `
    "Calculates absolute value" 1 `
    "Bitwise NOT flips all 0s to 1s and 1s to 0s. In two's complement arithmetic, ~x is mathematically equal to -(x + 1)."

Add-Q 24 14 "Hard" "What is the Euclidean Algorithm for finding the Greatest Common Divisor (GCD) of integers a and b?" `
    "gcd(a, b) = a * b / 2" `
    "gcd(a, b) = b == 0 ? a : gcd(b, a % b) with logarithmic time complexity O(log(min(a, b)))" `
    "Factorize both numbers into primes" `
    "Subtract 1 until both are equal" 1 `
    "The Euclidean algorithm states that gcd(a, b) = gcd(b, a % b). By Lamé's Theorem, the number of division steps is at most 5 times the number of digits in min(a, b)."

Add-Q 24 15 "Medium" "What does the expression '1 << k' produce?" `
    "Integer k" `
    "A number with only the k-th bit set to 1 (equal to 2^k)" `
    "k divided by 2" `
    "A bitmask of all ones" 1 `
    "Left-shifting 1 by k places positions the bit at index k, which evaluates mathematically to 2^k."

Add-Q 24 16 "Hard" "What is Fast Exponentiation (Binary Exponentiation) to compute (x^n) % M in O(log n) time?" `
    "Multiply x by itself n times in a loop" `
    "Iteratively square x (x = (x * x) % M) and halve n (n = n / 2); when n is odd, multiply result by current x (res = (res * x) % M)" `
    "Use logarithm tables" `
    "Run binary search on base x" 1 `
    "Binary exponentiation expresses the exponent n as a sum of powers of 2 (binary representation), squaring the base at each step to compute x^n in O(log n) multiplications."

Add-Q 24 17 "Medium" "What is the Hamming Distance between two integers x and y?" `
    "The difference |x - y|" `
    "The number of bit positions at which the corresponding bits are different (equal to number of set bits in x ^ y)" `
    "The ratio x / y" `
    "The number of zeroes in x" 1 `
    "XORing x and y sets bits to 1 wherever the bits differ. Counting the set bits in (x ^ y) calculates the Hamming distance."

Add-Q 24 18 "Hard" "What is the Sieve of Eratosthenes and what is its time complexity to find all prime numbers up to N?" `
    "O(N^2) trial division" `
    "Mark multiples of each prime starting from p^2 as composite; runs in O(N log(log N)) time" `
    "O(N) randomized algorithm" `
    "O(2^N)" 1 `
    "The Sieve creates a boolean array up to N. Starting from prime p, it marks p*p, p*p+p... as composite. The harmonic sum of primes converges to O(N log(log N))."

Add-Q 24 19 "Medium" "What does the unsigned right shift operator (>>> in Java) do differently from the signed right shift (>>)?" `
    "It multiplies by 2" `
    ">>> shifts in 0s into the most significant bits regardless of the number's sign, whereas >> preserves the sign bit (sign extension)" `
    ">>> works only on floats" `
    "There is no difference" 1 `
    "The signed right shift (>>) copies the sign bit to preserve negative signs. The unsigned right shift (>>>) always shifts in zeroes, treating the bits as an unsigned integer."

Add-Q 24 20 "Hard" "According to Fermat's Little Theorem, how do you compute the Modular Multiplicative Inverse of a modulo a prime P?" `
    "inverse = 1 / a" `
    "inverse = a^(P - 2) % P" `
    "inverse = P % a" `
    "inverse = (a + P) / 2" 1 `
    "Fermat's Little Theorem states that a^(P-1) = 1 (mod P) for prime P and gcd(a, P)=1. Multiplying both sides by a^(-1) gives a^(-1) = a^(P-2) (mod P), computable in O(log P) via binary exponentiation."

Add-Q 24 21 "Medium" "What is the result of setting the k-th bit of integer n?" `
    "n = n & ~(1 << k)" `
    "n = n | (1 << k)" `
    "n = n ^ (1 << k)" `
    "n = n >> k" 1 `
    "Bitwise OR with (1 << k) ensures the k-th bit is set to 1 while leaving all other bits unaffected."

Add-Q 24 22 "Hard" "In 'Bitwise AND of Numbers Range [m, n]', why does the result equal the common prefix of m and n followed by zeroes?" `
    "Because all numbers in the range are even" `
    "Because whenever bits change between m and n, all lower bit positions will contain at least one 0 in the range, zeroing them out during bitwise AND" `
    "Because range is sorted" `
    "Bitwise AND cannot be simplified" 1 `
    "As numbers increment from m to n, lower bits toggle between 0 and 1. Any bit position that toggles will encounter a 0 in the range, zeroing out that column. Only the unchanged common binary prefix survives."

Add-Q 24 23 "Medium" "What is the result of clearing the k-th bit of integer n?" `
    "n & ~(1 << k)" `
    "n | (1 << k)" `
    "n ^ (1 << k)" `
    "n + (1 << k)" 0 `
    "The mask ~(1 << k) has 0 at position k and 1 everywhere else. Bitwise AND with this mask forces bit k to 0 while preserving all other bits."

Add-Q 24 24 "Hard" "What is the Russian Peasant Multiplication algorithm?" `
    "A method for sorting numbers" `
    "Multiplication by repeatedly doubling one operand and halving the other (using bit shifts), adding the doubled value whenever the halved operand is odd" `
    "Dividing numbers using matrix multiplication" `
    "A formula for calculating Fibonacci numbers" 1 `
    "Russian peasant algorithm multiplies a * b: while b > 0: if b is odd, add a to result; shift a left (a <<= 1) and shift b right (b >>= 1). Performs multiplication in O(log b) additions and bit shifts."

Add-Q 24 25 "Medium" "How many distinct states can be represented using an 8-bit byte?" `
    "128" `
    "256 (from 0 to 255 unsigned, or -128 to 127 signed)" `
    "512" `
    "64" 1 `
    "An 8-bit byte has 2^8 = 256 unique bit combinations."

# ==================== DAY 25: Trie & Advanced Data Structures ====================
Add-Q 25 1 "Medium" "What is the primary motivation for using a Trie (Prefix Tree) over a standard Hash Table for strings?" `
    "Trie uses less memory than hash table for any input" `
    "Trie supports prefix matching (e.g. startsWith, autocomplete) and lexicographical ordering in O(L) time where L is word length" `
    "Trie allows searching without keys" `
    "Hash tables cannot store strings" 1 `
    "While a HashMap provides O(L) exact lookups, it cannot efficiently find all words sharing a common prefix. A Trie shares common prefixes among words, supporting prefix queries in O(L) time."

Add-Q 25 2 "Hard" "In 'Design Add and Search Words Data Structure', how does the search function handle the '.' wildcard character?" `
    "Converts '.' to empty string" `
    "Recursively branches DFS to check ALL non-null children of the current Trie node (trying all 26 possible letters)" `
    "Replaces '.' with 'a'" `
    "Throws a PatternMismatch exception" 1 `
    "When encountering '.', the search cannot pick a deterministic branch. It iterates over all existing child nodes at the current level, returning true if any branch successfully matches the remaining suffix."

Add-Q 25 3 "Medium" "What is the time complexity to insert a word of length L into a Trie with alphabet size 26?" `
    "O(26 * L)" `
    "O(L) linear in word length" `
    "O(L log 26)" `
    "O(26^L)" 1 `
    "Inserting a word traverses L nodes (one for each character), creating new nodes if absent in O(1) per step, taking O(L) time."

Add-Q 25 4 "Hard" "In 'Maximum XOR of Two Numbers in an Array', how does a Bitwise Trie achieve O(N * 32) time?" `
    "Stores all numbers in a 2D array" `
    "Inserts 32-bit binary representations into a 0/1 Trie; for each number, greedily traverses opposite bit (1 - bit) if present to maximize XOR contribution from most significant bit down" `
    "Calculates XOR of all pairs in O(N^2)" `
    "Sorts the array descending" 1 `
    "A binary Trie (branching 0 or 1) processes numbers from bit 31 down to 0. For each bit, picking the inverted bit (if child exists) maximizes the XOR value at that power of 2, finding the optimal pairing in O(32) per element."

Add-Q 25 5 "Medium" "What fields are typically stored inside a standard TrieNode class for lowercase English letters?" `
    "String word, int length" `
    "TrieNode[] children = new TrieNode[26], and a boolean isEndOfWord" `
    "int value, TrieNode parent" `
    "Queue<Character> letters" 1 `
    "Each TrieNode contains an array or map of child links indexed by character offset (char - 'a') and a boolean flag indicating if a complete word terminates at this node."

Add-Q 25 6 "Hard" "In 'Word Search II' (find all dictionary words on a 2D board of characters), why is a Trie combined with 2D Grid Backtracking?" `
    "To count characters on the board" `
    "Building a Trie of dictionary words allows pruning invalid grid paths immediately when the current prefix is not present in the Trie, avoiding dead-end exponential searches" `
    "Trie replaces DFS" `
    "To sort the board characters" 1 `
    "Running DFS for each word takes exponential time. Inserting all words into a Trie and traversing the board with DFS allows pruning any search branch as soon as trieNode.children[board[r][c]] is null."

Add-Q 25 7 "Medium" "What is a Segment Tree used for in algorithmic competitive programming?" `
    "Sorting arrays in O(N)" `
    "Performing range queries (e.g. range sum, range minimum) and point updates over an array in O(log N) time" `
    "Balancing binary search trees" `
    "Compressing image files" 1 `
    "A Segment Tree precomputes intervals in a binary tree structure of size 4N, supporting arbitrary range queries and element updates in O(log N) time."

Add-Q 25 8 "Hard" "What is Lazy Propagation in a Segment Tree and when is it required?" `
    "Updating nodes only when user clicks" `
    "Postponing updates to child nodes until they are actually queried, allowing RANGE updates (e.g. adding X to range [L, R]) to complete in O(log N) rather than O(N)" `
    "Deleting inactive memory pages" `
    "Sorting segments lazily" 1 `
    "Without lazy propagation, updating a range [L, R] would require updating all descendant leaves in O(N). Lazy propagation records pending values in a lazy tree node and pushes them down on-demand."

Add-Q 25 9 "Medium" "What is a Binary Indexed Tree (Fenwick Tree) and what operations does it support in O(log N)?" `
    "A balanced binary search tree" `
    "A compact array-based tree that supports prefix sum queries and point updates in O(log N) time using lowest set bit manipulation (i & -i)" `
    "A tree that stores binary numbers" `
    "A tree used for Huffman coding" 1 `
    "A Fenwick Tree stores partial sums across power-of-2 intervals using index math (i += i & -i for updates, i -= i & -i for queries), using only O(N) memory."

Add-Q 25 10 "Hard" "In Disjoint Set Union (DSU / Union-Find), what are the two essential optimizations that yield nearly O(1) amortized operations?" `
    "Sorting and hashing" `
    "Path Compression (flattening tree during find) and Union by Rank / Size (attaching smaller tree under root of larger tree)" `
    "Binary search and heapify" `
    "Coloring nodes red and black" 1 `
    "Union by Rank prevents tree height from growing linearly. Path Compression points visited nodes directly to the root during find(), flattening the structure to inverse Ackermann alpha(N) amortized time."

Add-Q 25 11 "Medium" "In 'Replace Words' (replace words in sentence with shortest root in dictionary), how does a Trie optimize replacement?" `
    "Sort dictionary by length" `
    "Insert roots into a Trie; for each word in sentence, traverse Trie character-by-character and stop at the first node with isEndOfWord == true" `
    "Compare strings using regex" `
    "Hash all substrings" 1 `
    "Traversing the Trie with the word prefix stops immediately at the first root termination flag, finding the shortest prefix root in O(prefix_length) without scanning other dictionary words."

Add-Q 25 12 "Hard" "What is a Sparse Table and what problem does it solve in O(1) query time?" `
    "Storing sparse matrices" `
    "Static Range Minimum Query (RMQ) on immutable arrays: preprocesses ranges in O(N log N) using powers of two; answers queries in O(1) by overlapping two power-of-2 intervals" `
    "Dynamic range sum with updates" `
    "Sorting arrays in O(N log N)" 1 `
    "Sparse table precomputes answers for intervals of length 2^k. For idempotent functions like min/max/gcd, query(L, R) = min(ST[k][L], ST[k][R - 2^k + 1]) where 2^k is largest power of two <= range length, answering in O(1)."

Add-Q 25 13 "Medium" "What is the space complexity of building a standard Segment Tree for an array of size N?" `
    "O(N^2)" `
    "O(4N)" `
    "O(log N)" `
    "O(N log N)" 1 `
    "A complete binary tree holding N leaves can have up to 2 * 2^(ceil(log2 N) + 1) nodes, which is bounded by 4N elements."

Add-Q 25 14 "Hard" "In 'Stream of Characters' (queries return true if any suffix of stream forms a word in words list), why should words be inserted into the Trie REVERSED?" `
    "Tries cannot read forward strings" `
    "Storing words reversed allows matching the stream's recent suffix by traversing backward from the most recent stream character toward earlier characters without backtracking" `
    "Reversing strings compresses memory" `
    "To sort words alphabetically" 1 `
    "Searching recent history forward requires checking every possible start point. Storing words reversed in the Trie means the incoming stream character is always the first character looked up; we step backward until isEndOfWord is hit."

Add-Q 25 15 "Medium" "What does the 'startsWith(prefix)' operation in a Trie return?" `
    "The number of characters in prefix" `
    "True if there is any previously inserted word in the Trie that begins with the given prefix, false otherwise" `
    "A sorted list of all vowels" `
    "The length of the longest word" 1 `
    "startsWith traverses nodes matching the prefix characters. If all characters are found, it returns true (regardless of whether a word terminates at that point)."

Add-Q 25 16 "Hard" "What is a Treap data structure?" `
    "A tree with 3 children per node" `
    "A hybrid of a Binary Search Tree (BST) and a Heap: keys satisfy BST invariant, and randomly assigned priorities satisfy Heap invariant, ensuring expected O(log N) balanced height" `
    "A Trie that stores integers" `
    "A graph with no cycles" 1 `
    "A Treap (Tree + Heap) assigns each inserted key a random numeric priority. It maintains BST order on keys and Max-Heap order on priorities via tree rotations, guaranteeing probabilistic logarithmic balance."

Add-Q 25 17 "Medium" "What is the time complexity to find the representative root of a set in DSU with Path Compression?" `
    "O(N)" `
    "Amortized O(alpha(N)) which is virtually O(1)" `
    "O(N log N)" `
    "O(log^2 N)" 1 `
    "Path Compression points every node along the lookup traversal directly to the root, reducing subsequent queries in that branch to instantaneous O(1) hops."

Add-Q 25 18 "Hard" "What is Heavy-Light Decomposition (HLD) of a tree?" `
    "Dividing nodes by memory weight" `
    "Decomposing a tree into disjoint linear paths (Heavy paths and Light edges), allowing path queries between any two nodes to be evaluated using Segment Trees in O(log^2 N) time" `
    "Pruning heavy leaf nodes" `
    "Balancing tree height using AVL rotations" 1 `
    "HLD decomposes a tree such that any simple path from node u to v crosses at most O(log N) distinct heavy paths. Mapping these paths into a Segment Tree allows evaluating tree path queries in O(log^2 N)."

Add-Q 25 19 "Medium" "What happens during Trie node deletion when a word is removed?" `
    "All ancestor nodes are deleted unconditionally" `
    "Unmark isEndOfWord; if the node has no remaining children and is not end of another word, prune the node and recurse upward toward root" `
    "The entire Trie is rebuilt" `
    "Trie nodes cannot be deleted" 1 `
    "Deleting word 'apple' when 'app' also exists: simply set isEndOfWord = false on 'e'. Only prune nodes if they have no other children and do not mark another word."

Add-Q 25 20 "Hard" "What is an Aho-Corasick Automaton and what is it used for?" `
    "An image recognition neural network" `
    "A Trie augmented with failure transitions (suffix links), matching an arbitrary dictionary of multiple pattern keywords in an input text in linear time O(Text + Patterns + Matches)" `
    "A sorting algorithm for unicode characters" `
    "A network packet sniffer" 1 `
    "Aho-Corasick combines a Trie with KMP-style failure transitions. It scans input text in a single pass, simultaneously detecting all occurrences of all dictionary keywords in linear time."

Add-Q 25 21 "Medium" "How many total nodes are in a Fenwick Tree constructed for an array of size N?" `
    "4N" `
    "N + 1 (using 1-based indexing)" `
    "2^N" `
    "N^2" 1 `
    "Unlike Segment Trees which require 4N elements, a Fenwick Tree uses exactly N + 1 entries in an array, making it exceptionally cache-friendly and space-efficient."

Add-Q 25 22 "Hard" "What is a Suffix Automaton (SAM) and what is its size complexity for a string of length N?" `
    "A DFA that recognizes all prefixes" `
    "A Minimal Deterministic Finite Automaton that recognizes all suffixes of a string, having at most 2N - 1 states and 3N - 4 transitions, built in strictly O(N) time" `
    "A suffix array requiring O(N^2) space" `
    "An NFA with infinite states" 1 `
    "A Suffix Automaton represents all 2^(N(N+1)/2) substrings of a string in a directed acyclic word graph (DAWG) with linear size O(N) states and transitions, built in O(N) time."

Add-Q 25 23 "Medium" "In a 0-1 Trie used for bit manipulation, what is the maximum depth of the tree for standard 32-bit signed integers?" `
    "64" `
    "31 or 32" `
    "16" `
    "Unlimited" 1 `
    "Representing 32-bit integers requires bits 31 down to 0, which corresponds to a maximum tree depth of exactly 32."

Add-Q 25 24 "Hard" "In 'Design Search Autocomplete System' (returns top 3 historical sentences matching prefix), how do Trie nodes store suggestions?" `
    "Recalculate DFS over entire Trie on every keystroke" `
    "Maintain a Min-Heap or top-3 list of (hotness, sentence) directly inside each TrieNode, updated during word insertion/history increment" `
    "Store sentences in a flat text file on disk" `
    "Sort sentences by length" 1 `
    "Caching the top 3 sentences directly at each Trie prefix node makes autocomplete queries take O(1) time per keystroke rather than running expensive DFS tree sweeps on every typed character."

Add-Q 25 25 "Medium" "Which data structure is the optimal choice for dynamically maintaining the connected components of a graph as edges are added one by one?" `
    "Adjacency Matrix" `
    "Disjoint Set Union (Union-Find)" `
    "Binary Search Tree" `
    "Stack" 1 `
    "DSU is specifically designed for dynamic connectivity: union(u, v) merges components in O(alpha(N)) and find(u) == find(v) tests connectivity instantly."

Write-Output "Days 23, 24, 25 loaded."
