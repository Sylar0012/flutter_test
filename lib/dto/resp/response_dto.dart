class ResponseDto {
  final int? code;
  final String? message;
  dynamic response; // JsonArray [], JsonObject {}

  ResponseDto({
    this.code,
    this.message,
    this.response,
  });

  ResponseDto.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        message = json["message"],
        response = json["response"];
}
