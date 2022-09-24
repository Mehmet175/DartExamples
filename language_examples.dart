abstract class ILanguage {
  String get title;
  String get subTitle;
}

class Turkish extends ILanguage {
  @override
  String get title => "Türkçe Başlık";

  @override
  String get subTitle => "Türkçe Altbaşlık";
  
}

class English extends ILanguage {
  @override
  String get subTitle => "English Title";

  @override
  String get title => "English Subtitle";
}

class Language {
  // Eğer ingilizce olarak yayınlanacak ise sadece burada English classı verilir.
  static ILanguage get getLanguage => English();
}

void main() {
   print(Language.getLanguage.title);
   print(Language.getLanguage.subTitle);
}