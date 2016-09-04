# messenger

This is a pretty simple command line based chat client that uses Redis Pub/Sub.  Messeges are never stored and SSL support will be coming soon.

# Compatability
Only works on Mac right now. 

# Installing

    1. git clone https://github.com/davissp14/messenger.git   # Clone the repo
    2. cd messenger                                           # Navigate to the messenger directory    
    3. ./bin/install                                          # Install Messenger dependencies


# Setup

    1. export REDIS_SERVER_URI=YourRedisConnectionString      # Your Remote Connection String.
    2. messenger --register                                   # Asks for First name / Last name.
    
# Usage
To start listening for voices:  `messenger --start`

To send messages run: `messenger --send "Your message"`
