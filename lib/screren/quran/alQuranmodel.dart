
class AlQuranModel {
    int? id;
    String? name;
    String? transliteration;
    String? translation;
    String? type;
    int? totalVerses;
    List<Verses>? verses;

    AlQuranModel({this.id, this.name, this.transliteration, this.translation, this.type, this.totalVerses, this.verses});

    AlQuranModel.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        name = json["name"];
        transliteration = json["transliteration"];
        translation = json["translation"];
        type = json["type"];
        totalVerses = json["total_verses"];
        verses = json["verses"] == null ? null : (json["verses"] as List).map((e) => Verses.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["name"] = name;
        _data["transliteration"] = transliteration;
        _data["translation"] = translation;
        _data["type"] = type;
        _data["total_verses"] = totalVerses;
        if(verses != null) {
            _data["verses"] = verses?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Verses {
    int? id;
    String? text;
    String? translation;

    Verses({this.id, this.text, this.translation});

    Verses.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        text = json["text"];
        translation = json["translation"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["text"] = text;
        _data["translation"] = translation;
        return _data;
    }
}