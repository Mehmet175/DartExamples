/*
<------------- Observer (Gözlemci) Design Pattern ------------>
-> Bir nesnenin durumu değiştiğinde, bütün bağımlılarına bildirilir.
-> Observer’lar (Gözlemciler), Subject (Özne)‘e bağımlıdır.
-> Subject’in durumu değiştiğinde gözlemcilere haber verilir.
-> Subject, object’in “durum bilgisini” tutar ve onu kontrol eder.
-> 1(One) Subject vardır. Observerlar “durum bilgisini” kullanırlar 
ama ona sahip değillerlerdir.
->1’den çok(Many) gözlemci vardır ve ”durum “ değiştiğinde Subject tarafından 
bilgilendirilirler.
 */

// Model sınıfımız
class Notification {
  late String message;
  late DateTime timestamp;
  Notification(this.message, this.timestamp);
  Notification.forNow(this.message) {
    timestamp = DateTime.now();
  }
}

// Gözelemci listesini tutar.
class Observable {
  final List<Observer> _observers = [];

  void registerObserver(Observer observer) {
    _observers.add(observer);
  }

  void notifyObservers(Notification notification) {
    for (var observer in _observers) {
      observer.notify(notification);
    }
  }
}

// Gözlemiclerin adını tutar.
class Observer {
  String name;
  
  Observer(this.name);

  void notify(Notification notification) {
    print("[${notification.timestamp.toIso8601String()}] Hey $name, ${notification.message}!");
  }
}

// Subject durum değiştiğinde Observer'lere (gözlemcilere) haber verir.
class CoffeeMaker extends Observable {
  
  // Demleme işlemi yapılıyor ve gözlemcilere bildirim gönderiliyor.
  void brew() {
    print("Brewing the coffee...");
    // Gözlemcilere bildirim gönderiliyor...
    notifyObservers(Notification.forNow("coffee's done"));
  }
}

void main() {
  // İki gözlemcimiz var.
  var me = Observer("Tyler");
  var myWife = Observer("Kate");
  
  // Kahve makinesine oluşturuuyor.
  var mrCoffee = CoffeeMaker();
  // Kahve nakinesine kate ve tyler dahil ediliyor.
  mrCoffee.registerObserver(me);
  mrCoffee.registerObserver(myWife);
  // Kahve demleme komutu gönderiliyor.
  mrCoffee.brew();
}