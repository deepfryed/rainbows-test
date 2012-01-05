# Simple unscientific benchmark of thin vs rainbows

Just a simple test of raw throughput


## Setup

* install apache bench (apache2-utils on debian distros)
* install required gems

```bash
bundle --path gems --binstubs

```

## Running

```bash
./test.sh
```

## Test environment

```
$ uname -a
Linux tardis 2.6.38-8-generic #42-Ubuntu SMP Mon Apr 11 03:31:24 UTC 2011 x86_64 x86_64 x86_64 GNU/Linux

$ ruby -v
ruby 1.9.2p0 (2010-08-18 revision 29036) [x86_64-linux]

$ cat /proc/cpuinfo  | grep "model name\|processor"
processor	: 0
model name	: Intel(R) Core(TM)2 Duo CPU     P8700  @ 2.53GHz
processor	: 1
model name	: Intel(R) Core(TM)2 Duo CPU     P8700  @ 2.53GHz

$ free -m
             total       used       free     shared    buffers     cached
Mem:          3685       3499        186          0        251       1446
-/+ buffers/cache:       1800       1884
Swap:            0          0          0

```

## Results

```
$ ./test.sh 
##########################################################################################
testing rainbows
##########################################################################################

This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.0.1 (be patient).....done


Server Software:        
Server Hostname:        127.0.0.1
Server Port:            4000

Document Path:          /
Document Length:        13 bytes

Concurrency Level:      10
Time taken for tests:   1.008 seconds
Complete requests:      2000
Failed requests:        0
Write errors:           0
Total transferred:      260000 bytes
HTML transferred:       26000 bytes
Requests per second:    1984.07 [#/sec] (mean)
Time per request:       5.040 [ms] (mean)
Time per request:       0.504 [ms] (mean, across all concurrent requests)
Transfer rate:          251.88 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    1   1.6      1       9
Processing:     1    4   3.2      2      31
Waiting:        0    3   3.2      2      30
Total:          1    5   3.4      4      31

Percentage of the requests served within a certain time (ms)
  50%      4
  66%      5
  75%      7
  80%      8
  90%     10
  95%     11
  98%     13
  99%     15
 100%     31 (longest request)
##########################################################################################
testing thin
##########################################################################################

This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 127.0.0.1 (be patient).....done


Server Software:        thin
Server Hostname:        127.0.0.1
Server Port:            4000

Document Path:          /
Document Length:        13 bytes

Concurrency Level:      10
Time taken for tests:   1.455 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Total transferred:      1220000 bytes
HTML transferred:       130000 bytes
Requests per second:    6873.58 [#/sec] (mean)
Time per request:       1.455 [ms] (mean)
Time per request:       0.145 [ms] (mean, across all concurrent requests)
Transfer rate:          818.92 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       2
Processing:     0    1   2.8      1      33
Waiting:        0    1   2.5      1      33
Total:          0    1   2.8      1      33

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      1
  75%      1
  80%      1
  90%      1
  95%      6
  98%     11
  99%     14
 100%     33 (longest request)
```
