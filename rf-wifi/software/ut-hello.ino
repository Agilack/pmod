#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include <ESP8266WiFiMulti.h>
#include <WiFiClient.h>
#include <Ticker.h>
#include <FS.h>

const char *base_ssid = "pmod_wifi";
const char *base_password = "azertyuiopqsdf";

ESP8266WiFiMulti WiFiMulti;
ESP8266WebServer webServer(80);
IPAddress IP;
Ticker ts;

void handleRoot() {
	webServer.send(200, "text/html", "<h1>Hello World</h1>");
}

void printInfo() {
	Serial.print("AP IP address: ");
	Serial.println(IP);
	Serial.printf("Connection status: %d\n", WiFi.status());
	WiFi.printDiag(Serial);
}

void setup() {
	Serial.begin(115200);
	Serial.setDebugOutput(true);

	delay(1000);

	Serial.println();
	Serial.println("PMOD Wifi - Hello world unit-test ...");

	IPAddress ip(192, 168, 49, 1);
	IPAddress gateway(192, 168, 49, 1);
	IPAddress subnet(255, 255, 255, 0);

	WiFi.mode(WIFI_AP);

	WiFi.softAPConfig(ip, gateway, subnet);
	WiFi.softAP(base_ssid, base_password);

	IP = WiFi.softAPIP();
	Serial.print("AP IP address: ");
	Serial.println(IP);

	webServer.on("/", handleRoot);

	webServer.begin();
	Serial.println("HTTP server started");

	/* Start periodic debug task */
	ts.attach(3, printInfo);
}

void loop() {
	webServer.handleClient();  
}
