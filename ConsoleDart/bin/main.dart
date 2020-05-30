import 'package:ConsoleDart/ConsoleDart.dart' as console_dart;

void main(List<String> arguments) {
  num a = 1.5;
  print(a);

  var name = 'Hudayfe';
  var surname = 'Yurt';
  var age = 9;

  print('Ad Soyad: $name $surname, Yaş: ${age * 2}');

  print('~~~~~~~~');
  print(3 + 2);
  print(3 - 2);
  print(3 * 2);
  print(3 / 2);
  print(3 % 2);
  print('~~~~~~~~');

  print('~~~~~~~~');
  print(3 == 5);
  print(3 != 5);
  print(3 < 5);
  print(3 <= 3);
  print(3 > 5);
  print(3 >= 5);
  print('~~~~~~~~');
  print(name is String);
  print(name is! int);
  print('~~~~~~~~');

  if (surname == 'Yurt') {
    print('Evet soyadım $surname.');
  } else {
    print('Hayır soyadım ' + surname + ' değil.');
  }

  print('~~~~~~~~');
  if (age >= 0 && age < 18) {
    print("Yaşın 18'den küçük! Karantinadan dolayı sokağa çıkamazsın.");
  } else if (age >= 18 && age <= 60) {
    print('Sokağa çıkabilirsin.');
  } else {
    print("Yaşın 60'dan büyük! Karantinadan dolayı sokağa çıkamazsın.");
  }

  print('~~~~~~~~');
  if (age < 18 || age > 60) {
    print('Yaşın $age! Karantinadan dolayı sokağa çıkamazsın.');
  } else {
    print('Yaşın $age. Sokağa çıkabilirsin.');
  }

  print('~~~~~~~~');
  for (var i = 0; i < 10; i++) {
    if (i % 3 == 0) {
      print('$i');
    }
  }

  var counter = 10;
  while (counter > -1) {
    print(counter);
    counter--;
    if (counter == 0) {
      break;
    }
  }

  do {
    if (counter == 5) {
      continue;
    }
    print(counter);
    counter++;
  } while (counter < 10);

  switch (counter) {
    case 0:
      print(counter);
      break;
    case 10:
      print(counter);
      break;
    default:
      print(counter);
      break;
  }

  print('~~~~~~~~');
  print(!true);
  print(!false);
  if (!(age < 18)) {
    print("Yaşın 18'den küçük değil!");
  }

  print('~~~~~~~~');
  print('Hello world: ${console_dart.calculate()}!');

  doSomething();

  var gender = getGender2();
  print(gender);

  print('~~~~~~~~');
  print(sayHello('Hudayfe', 'Yurt'));
  print(sayHello(name, surname, age));

  print('~~~~~~~~');
  print(globalDegisken);

  void icFonksiyon() {
    var mesaj = 'Özel fonksiyon';
    print(mesaj);

    String cokOzelFonksiyon() {
      return mesaj;
    }
  }

  icFonksiyon();
  //print(mesaj);
  //cokOzelFonksiyon();

  var uni = new Universite();
  uni.UniAdi = 'İTÜ';
  uni.Sehir = 'İstanbul';
  uni.FakulteSayisi = 10;
  print(uni.UniAdi);
  print(uni.Tanim());

  var uni2 = new Universite2('İTÜ', 'İstanbul', 10);
  print(uni2.Tanim());

  print('~~~~~~~~');
  var erkek = new Erkek();
  erkek.name = 'Hudayfe';
  erkek.SakalliMi = false;
  print(erkek.TrasOlmaliMi());

  var kadin = new Kadin();
  kadin.HamileMi = false;

  print('~~~~~~~~');
  var elLoc = new ElLoc(25.5, 58.7, 90);
  print('$elLoc.x $elLoc.y $elLoc.elLoc');
  print(elLoc.toString());

  print('~~~~~~~~');
  var hy = new Person('Hudayfe', 'TR');
  print(hy.toString());

  print('~~~~~~~~');
  var arr = [12, 9, 8, 0, 4, 7, 15];
  for (var i = 0; i < arr.length; i++) {
    if (arr[i] % 2 == 0) {
      print("$arr[i] 2'ye bölünebilir.");
    } else {
      print("$arr[i] 2'ye bölünemez.");
    }
  }

  print('~~~~~~~~');
  var list = List<String>();
  list.add('Hudayfe');
  list.add('Tomi');

  var p1 = new Person('Hudayfe', 'TR');
  var p2 = new Person('Tomi', 'DE');
  var p3 = new Person('Anna', 'GB');
  var personList = new List<Person>();
  personList.add(p1);
  personList.add(p2);
  personList.add(p3);
  for (var i = 0; i < personList.length; i++) {
    print(personList[i].uyruk);
  }

  print('~~~~~~~~');
  var kalemler = {
    'tükenmez': 'mavi',
    'dolma': 'siyah',
    'kurşun': 'siyah',
    'pilot': 'kırmızı'
  };
  var renkler = {
    1: 'siyah',
    2: 'mavi',
    3: 'kırmızı',
    4: 'sarı',
    5: 'turuncu',
    6: 'yeşil'
  };
  var tarimsalVerim = {'ilkbahar': 3, 'yaz': 1, 'sonbahar': 2, 'kış': 1};

  print(kalemler['tükenmez']);
  kalemler.forEach((key, value) => print(key));
  var keys = kalemler.keys;
  var values = kalemler.values;
  print(keys);
  print(values);
}

void doSomething() {
  print('doSomethin()');
  getGender();
}

void getGender() {
  var gender = 'E';
  if (gender == 'E') {
    print('Erkek');
  } else {
    print('Kadın');
  }
}

String getGender2() {
  return 'Erkek';
}

int getAge() {
  return 9;
}

int getAge2() => 9;

String sayHello(String name, String surname, [int age]) {
  if (age == null) {
    return 'Merhaba $name $surname';
  } else {
    return 'Merhaba $name $surname. Yaşın: $age';
  }
}

var globalDegisken = 10;

void test() {
  if (globalDegisken == 10) {
    print('OK!');
  } else {
    print('Wrong!');
  }
  //icFonksiyon();
}

class Universite {
  String UniAdi;
  String Sehir;
  int FakulteSayisi;

  String Tanim() {
    return 'Adı: $UniAdi Şehir: $Sehir';
  }
}

class Universite2 {
  String UniAdi;
  String Sehir;
  int FakulteSayisi;

  //Universite2(this.UniAdi, this.Sehir, this.FakulteSayisi);

  Universite2(String uniAdi, String sehir, int fakulteSayisi) {
    UniAdi = uniAdi;
    Sehir = sehir;
    FakulteSayisi = fakulteSayisi;
  }

  String get getUniAdi => UniAdi; // getter
  set setUniAdi(String val) => UniAdi = val; // setter

  String Tanim() {
    return 'Adı: $UniAdi Şehir: $Sehir';
  }
}

class Kisi {
  String name;
  String surname;
  String cinsiyet;

  String sayHello() {
    return name;
  }
}

class Erkek extends Kisi {
  bool SakalliMi;

  String TrasOlmaliMi() {
    if (SakalliMi) {
      return 'Evet';
    } else {
      return 'Hayır';
    }
  }
}

class Kadin extends Kisi {
  bool HamileMi;

  @override
  String sayHello() {
    return '$name Hanım';
  }
}

class Loc {
  num x, y;

  Loc(this.x, this.y);

  Loc.create(this.x, this.y); // named constructor
}

class ElLoc extends Loc {
  num elLoc;

  //ElLoc(num x, num y, this.elLoc) : super(x, y);
  ElLoc(num x, num y, this.elLoc) : super.create(x, y);

  @override
  String toString() {
    var result = '$x, $y, $elLoc';
    return result;
  }
}

abstract class Alive {
  void nefesAl();

  void gurultuYap() {
    print("Making noise");
  }
}

class Person implements Alive {
  String name, uyruk;

  Person(this.name, this.uyruk);

  @override
  void nefesAl() {
    print('Person nefesi');
  }

  @override
  void gurultuYap() {
    print('Person gürültüsü');
  }

  @override
  String toString() => '$name, $uyruk';
}

class Man extends Person implements Asian {
  Man(String name, String uyruk) : super(name, uyruk);

  @override
  bool WatchingAnime() {
    return false;
  }
}

abstract class Asian {
  bool WatchingAnime();
}
