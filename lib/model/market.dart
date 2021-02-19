class Market {
  String companyActivity;
  String email;
  String logoUrl;
  String mobileNumber;
  String userName;
  String marketId;
  Market(
      {this.companyActivity,
      this.email,
      this.logoUrl,
      this.marketId,
      this.mobileNumber,
      this.userName});
  Market.fromMap(Map map) {
    this.companyActivity = map['companyActivity'];
    this.email = map['email'];
    this.logoUrl = map['logoUrl'];
    this.mobileNumber = map['mobileNumber'];
    this.userName = map['userName'];
    this.marketId = map['marketId'];
  }
}
