class Country {
  String ulkeAdi;
  String ulkeAdiEn;
  String ulkeID;

  Country({this.ulkeAdi, this.ulkeAdiEn, this.ulkeID});

  Country.fromJson(Map<String, dynamic> json) {
    ulkeAdi = json['UlkeAdi'];
    ulkeAdiEn = json['UlkeAdiEn'];
    ulkeID = json['UlkeID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UlkeAdi'] = this.ulkeAdi;
    data['UlkeAdiEn'] = this.ulkeAdiEn;
    data['UlkeID'] = this.ulkeID;
    return data;
  }
}

class City {
  String sehirAdi;
  String sehirAdiEn;
  String sehirID;

  City({this.sehirAdi, this.sehirAdiEn, this.sehirID});

  City.fromJson(Map<String, dynamic> json) {
    sehirAdi = json['SehirAdi'];
    sehirAdiEn = json['SehirAdiEn'];
    sehirID = json['SehirID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SehirAdi'] = this.sehirAdi;
    data['SehirAdiEn'] = this.sehirAdiEn;
    data['SehirID'] = this.sehirID;
    return data;
  }
}

class County {
  String ilceAdi;
  String ilceAdiEn;
  String ilceID;

  County({this.ilceAdi, this.ilceAdiEn, this.ilceID});

  County.fromJson(Map<String, dynamic> json) {
    ilceAdi = json['IlceAdi'];
    ilceAdiEn = json['IlceAdiEn'];
    ilceID = json['IlceID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IlceAdi'] = this.ilceAdi;
    data['IlceAdiEn'] = this.ilceAdiEn;
    data['IlceID'] = this.ilceID;
    return data;
  }
}
