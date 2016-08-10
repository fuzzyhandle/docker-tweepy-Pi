# Lock down the image to avoid surprises
FROM acencini/rpi-python-serial-wiringpi:v1

# Need to update pip so that new pip packages install successfully
RUN pip install --upgrade pip 
RUN pip install tweepy uptime pytz tzlocal

# Fix the issue described at https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings
# Install pre-requisites for building cryptography packages Refer https://urllib3.readthedocs.io/en/latest/advanced-usage.html#ssl-warnings
RUN apt-get -y update && apt-get -y install build-essential libssl-dev libffi-dev python-dev && apt-get -y clean && rm -rf /var/lib/apt/lists/*
RUN pip install urllib3[secure]

#Clean up cache just to be sure
RUN apt-get -y clean
