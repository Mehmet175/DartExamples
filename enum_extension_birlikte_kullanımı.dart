void main() {
  print(SalesType.STORE_STOCK.displaySalesType()); // Sonuç : Mağaza Stok
  print(SalesType.SUPPLIER_ORDER.name); // Sonuç : SUPPLIER_ORDER
}

enum SalesType { STORE_STOCK, SUPPLIER_ORDER, TRANSFER_SALE, OTHER_STORE_SALE }

// SalesType enumumuza özellik ekliyoruz.
extension SalesTypeExtension on SalesType {
  // Bu özellik ile enumun kendini yazdırıyoruz.
  // Eğer direkt toString yaparsak EnumSınıfınınAdı.SeçiliEnum şeklinde gelir.
  String get name => describeEnum(this);

  // Burda ise switch case'ler ile seçili enumun mesajını kontrol ediyoruz.
  // Burdaki this aslında bulunduğumuz enumu değikenini ifade ediyor. 
  String displaySalesType() {
    switch (this) {
      case SalesType.STORE_STOCK:
        return "Mağaza Stok";
      case SalesType.SUPPLIER_ORDER:
        return "Tedarikçi Siparişi";
      case SalesType.TRANSFER_SALE:
        return "Transferli Sipariş";
      case SalesType.OTHER_STORE_SALE:
        return "Diğer Mağaza Satışı";
      default:
        return "Bilinmiyor...";
    }
  }
}

// Burdaki amaç Enum adı ile Enum değişkeninin adını ayırmak.
String describeEnum(Object enumEntry) {
  final String description = enumEntry.toString();
  final int indexOfDot = description.indexOf('.');
  return description.substring(indexOfDot + 1);
}
