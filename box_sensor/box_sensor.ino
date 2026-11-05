// box_sensor.ino — tells the computer when the box lid is OPEN or CLOSED.
// Sensor: HC-SR04 on the floor of the box, pointing up at the lid.
// Wiring: Vcc -> 5V, Gnd -> GND, Trig -> pin 9, Echo -> pin 10.
// Serial (9600 baud) sends one word per line: OPEN or CLOSED
// (on every change, and repeated once a second so the player always knows).
// Calibrate: open Tools > Serial Monitor, look at the "cm" lines with the
// lid closed and open, then set OPEN_CM between the two numbers.

const int TRIG_PIN = 9;
const int ECHO_PIN = 10;

const float OPEN_CM = 15.0;     // farther than this = lid is open
const int   STEADY  = 4;        // readings in a row needed to change state
const bool  SHOW_CM = true;     // print distance lines for calibration

bool isOpen = false;
int  countOther = 0;
unsigned long lastSend = 0;

float readCm() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  unsigned long us = pulseIn(ECHO_PIN, HIGH, 30000UL);  // 30 ms = ~5 m
  if (us == 0) return 999.0;                             // no echo = far away = open
  return us / 58.0;
}

void sendState() {
  Serial.println(isOpen ? "OPEN" : "CLOSED");
  lastSend = millis();
}

void setup() {
  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  Serial.begin(9600);
  sendState();
}

void loop() {
  float cm = readCm();
  bool looksOpen = cm > OPEN_CM;

  if (looksOpen != isOpen) {
    countOther++;
    if (countOther >= STEADY) {   // ~200 ms of steady readings
      isOpen = looksOpen;
      countOther = 0;
      sendState();
    }
  } else {
    countOther = 0;
  }

  if (SHOW_CM) {
    Serial.print("cm ");
    Serial.println(cm, 1);
  }
  if (millis() - lastSend > 1000) sendState();
  delay(50);                      // 20 readings per second
}
