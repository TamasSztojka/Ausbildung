import time
import RPi.GPIO as GPIO

TRIG_PIN = 23
ECHO_PIN = 24

GPIO.setmode(GPIO.BCM)
GPIO.setup(TRIG_PIN, GPIO.OUT)
GPIO.setup(ECHO_PIN, GPIO.IN)

def read_distance_cm():
    GPIO.output(TRIG_PIN, False)
    time.sleep(0.05)

    GPIO.output(TRIG_PIN, True)
    time.sleep(0.00001)
    GPIO.output(TRIG_PIN, False)

    pulse_start = 0
    pulse_end = 0

    timeout_start = time.time()
    while GPIO.input(ECHO_PIN) == 0:
        pulse_start = time.time()
        if pulse_start - timeout_start > 0.05:
            return 999.0

    timeout_end = time.time()
    while GPIO.input(ECHO_PIN) == 1:
        pulse_end = time.time()
        if pulse_end - timeout_end > 0.05:
            return 999.0

    pulse_duration = pulse_end - pulse_start
    distance = pulse_duration * 17150
    return round(distance, 2)

def cleanup():
    GPIO.cleanup()

TILT_PIN = 17
GPIO.setup(TILT_PIN, GPIO.IN)

def is_tilted():
    return GPIO.input(TILT_PIN) == GPIO.HIGH