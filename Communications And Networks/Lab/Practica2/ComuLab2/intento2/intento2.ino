// LAN modul W5500 - web server

// připojení potřebných knihoven
#include <SPI.h>
#include <Ethernet2.h>
// nastavení MAC adresy
byte mac[] = {
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED
};
// nastavení IP adresy - musí být přidělitelná DHCP serverem,
// tedy ve správném rozsahu, případně přidělena routerem ručně
IPAddress ip(192, 168, 1, 50);
// inicializace serveru na portu 80
EthernetServer server(80);

void setup() {
  // inicializace komunikace po sériové lince rychlostí 9600 baud
  Serial.begin(9600);
  // zapnutí komunikace s Ethernet Shieldem
  Ethernet.begin(mac, ip);
  server.begin();
  // výpis informace o nastavené IP adrese
  Serial.print("Server je na IP adrese: ");
  Serial.println(Ethernet.localIP());
}

void loop() {
  // načtení připojených klientů
  EthernetClient klient = server.available();
  // pokud se připojí nějaký klient, provedeme následující
  if (klient) {
    Serial.println("Novy klient:");
    // http request končí prázdným řádkem
    boolean aktualniRadkaPrazdna = true;
    // pokud je klient připojen a k dispozici,
    // vytiskneme mu dostupná data
    while (klient.connected()) {
      if (klient.available()) {
        // načtení a vytištění informace o klientovi
        char c = klient.read();
        Serial.write(c);
        // pokud se dostaneme na konec řádku a následující je prázdný,
        // byl ukončen request a my můžeme poslat odezvu
        if (c == '\n' && aktualniRadkaPrazdna) {
          // nejprve pošleme standardní http odezvu
          klient.println("HTTP/1.1 200 OK");
          klient.println("Content-Type: text/html");
          klient.println("Connection: close");
          // nastavení automatické obnovy stránky po 5 vteřinách
          klient.println("Refresh: 5");
          klient.println();
          klient.println("");
          klient.println("");
          // místo pro tištění vlastních údajů
          klient.print("Cas od spusteni: ");
          klient.print(millis() / 1000);
          klient.print(" vterin.<br />");
          // ukázka výpisu dat ze všech analogových vstupů
          for (int analogPin = 0; analogPin < 6; analogPin++) {
            int analogData = analogRead(analogPin);
            klient.print("Analogovy vstup A");
            klient.print(analogPin);
            klient.print(": ");
            klient.print(analogData);
            // příkaz "<br />" funguje jako krok na další řádek
            klient.println("<br />");
          }
          klient.println("");
          break;
        }
        // začátek nové řádky
        if (c == '\n') {
          aktualniRadkaPrazdna = true;
          // detekce znaku na nové řádce
        } else if (c != '\r') {
          aktualniRadkaPrazdna = false;
        }
      }
    }
    // pauza pro prohlížeč, aby stihl zpracovat všechny data
    delay(1);
    // uzavření spojení
    klient.stop();
    Serial.println("Klient odpojen.");
    Serial.println("---------------------");
  }
}
