class LoginReqDto {
  String impKey = "3754115857271372";
  String impSecret = "0QUNitiStxPVOLsRZ3jofo9QkTUlVNPtquHz0C76KezJXxuAdV9SNGXrZjPGsM4zIR2pImu3FaMR6lSr";

  Map<String, dynamic> toJson() {
    return {
      "imp_key": impKey,
      "imp_secret": impSecret,
    };
  }
}
