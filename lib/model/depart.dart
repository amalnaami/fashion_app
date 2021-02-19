class Depart {
  String name;
  String description;
  String marketId;
  String imageUrl;
  String departId;
  Depart(
      {this.name,
      this.description,
      this.imageUrl,
      this.marketId,
      this.departId});
  Depart.fromMap(Map map) {
    this.name = map['departName'];
    this.description = map['departDescription'];
    this.imageUrl = map['imageUrl'];
    this.marketId = map['marketId'];
    this.departId = map['departId'];
  }


  toJson() {
    return {
      'departName': this.name,
      'departDescription': this.description,
      'imageUrl': this.imageUrl,
      'marketId': this.marketId,
      'departId': this.departId
    };
  }
}
