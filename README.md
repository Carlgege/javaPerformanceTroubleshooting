.mymono {
font-family:mono-spaced;
}
# perfSandbox
Live Demonstrations of Java Performance Problems

# Install Instructions

## Step 0: Supported Platforms
These Performance examples should run on any platform.  Only MacOs has been tested at this time.

## Step 1: Install Prerequisites
1. Install JDK 1.8 or greater.
2. Maven (http://maven.apache.org).  Make sure 'mvn' is in the PATH.
3. JMeter, 2.13 greater (http://jmeter.apache.org)

## Step 2: Install and Build War File
1. Clone or download the repo from github.com:  https://github.com/eostermueller/perfSandbox
2. Build the war file

  ```bash
  cd warProject
  mvn clean package
  ```
  ...and be sure to look for the "[INFO] BUILD SUCCESS" message and look for the output war file:
  ```
  warProject/target/perfSandbox.war
  ```

## Step 3: Configure Environment / Install and Load Database.
1. Edit the "bin/setenv.sh".  Make sure the environment variables in the file are set for all command prompts/shells you work with.
2. Download the latest H2 .zip file (http://www.h2database.com/h2-2016-05-26.zip) to the db folder.
3. cd to the db folder and unzip the file.
4. Start the database:  ./startDb.sh
5. While still in the 'db' folder, run "./loadDb.sh" to populate the H2 database. This script will take a few minutes to run, depending on your hardware.

## Step 4: Run the performance tests

Running tests requires three different command prompts.  For *nix systems, I suggest using tmux (https://tmux.github.io/) to manage these windows.  You will need one window for each of the following.
1. Running H2 database ('db/startDb.sh').
2. Running war file (look for startPsWar-??.sh scripts)
3. Applying load (with JMeter) to stress the war.
...and I recommend opening a fourth window for troubleshooting.

Notes about running the tests
1. Each numbered folder (00, 01, 02, etc...) contains a few tests.  Look for the 'readme-??.txt' files that ask a few questions about the performance problems.
2. What to start/restart and when:
  1. once you start the H2 db with 'db/startDb.sh', just leave it running.
  2. 'cd' to a numbered folder, say 02, and start the .war file with ./startPsWar-02.sh.  Wait for the startup to complete:
  <span class='mymono'>
  2016-06-06 02:34:55.128  INFO 97318 --- [           main] c.g.e.perfSandbox.PerformanceSandboxApp  : Started PerformanceSandboxApp in 9.013 seconds (JVM running for 9.576)
  </span>
  3. In a separate window, cd to the exact same folder as above, 02, and execute the './load-02a.sh' script.
  <span style="font-family: 'mono-spaced';">
  Eriks-MBP:02 erikostermueller$ ./load-02a.sh 
Creating summariser <summary>
Created the tree successfully using x02a.jmx
Starting the test @ Mon Jun 06 02:37:23 CDT 2016 (1465198643015)
Waiting for possible shutdown message on port 4445
summary +      1 in     1s =    1.1/s Avg:   631 Min:   631 Max:   631 Err:     0 (0.00%) Active: 1 Started: 1 Finished: 0
summary +      5 in   7.1s =    0.7/s Avg:  3322 Min:  2485 Max:  4035 Err:     0 (0.00%) Active: 3 Started: 3 Finished: 0
summary =      6 in     8s =    0.8/s Avg:  2873 Min:   631 Max:  4035 Err:     0 (0.00%)
summary +      8 in     9s =    0.9/s Avg:  3396 Min:  3236 Max:  3504 Err:     0 (0.00%) Active: 3 Started: 3 Finished: 0
</span>
