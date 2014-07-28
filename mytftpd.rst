=========
 MyTftpd
=========

Deadline: October 8th, 2014

Instructions
============

Implement a server program for the TFTP protocol (RFC 1350).

Your program must match the following documentation::

   Usage: mytftpd [ADDR] [PORT]

   Start serving the current directory over TFTP.

   If ADDR is specified, bind to that address only.
   If both ADDR and PORT are specified, bind to the specified port.

- Your server must reject requests for transfering files outside
  of the current directory.
- You may restrict your implementation to support only the “octet” transfer mode.
- You may use any standard C function (either from ISO C 1999/2011 or
  POSIX).
- You may not use ``system`` or any other mechanism that invokes an
  external program.

For extra credits you may implement RFC 2348 or 2349 to support file
sizes greater than 32MB.

Grading
=======

- 6 points if your program ``mytftpd`` works without arguments, and can
  answer simple ``get`` or ``put`` commands from a standard TFTP client.
- +1 point if your program can bind to the address and port number
  specified on the command line.
- +1 point if your program can transfer files larger than 32MB.
- +2 points if your program can support transfers from multiple clients
  simultaneously (identified by client address/port number).
