class Singleton {
  // Eğer daha önceden bu classtan nesne üretildiyse zaten static 
  // olduğu için eski referansı tutacaktır. Eğer ilk defa üretiyor
  // ise private constructor'a gidecek ve referans atayacaktır.
  static final Singleton _singleton = Singleton._internal();

  // Factory constructor yaparak daha önceki nesne referansımız yönlendiriyoruz.
  factory Singleton() {
    return _singleton;
  }

  // Eğer daha önceden referans atanmadıysa class'ı new'leyecek private constructor
  Singleton._internal() {
    print('_internal');
  }
}

void main() {
  var s1 = Singleton();
  var s2 = Singleton();
  print(identical(s1, s2));  // true
  print(s1 == s2);   
}