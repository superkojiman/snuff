snuff
=====

Man-in-the-middle (MITM) attacks are an effective way to capture data flowing between a target and the router. In a nutshell, the attacker places himself between the target and the router so that all data flows through the attacker’s machine. The target thinks he’s communicating with the router, and the router thinks it’s communicating with the target, when in reality, they are communicating with the attacker and the attacker just relays the information back and forth. It’s like a malicious mailman who reads your letters before sealing them and sending them off.

Using a combination of tools readily available online such as arpspoof, ettercap, and sslsniff, we can capture a user’s login credentials and trick them into thinking that they are logging in through an encrypted connection. 

For more details, see [http://blog.techorganic.com/2011/07/13/sniffing-website-login-credentials/](http://blog.techorganic.com/2011/07/13/sniffing-website-login-credentials/)
