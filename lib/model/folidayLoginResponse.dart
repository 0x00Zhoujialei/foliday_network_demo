class FolidayLoginResponse {
  final int errorMessage;
  final bool hasError;
  final String message;
  final bool received;
  final String responseCode;
  final String token;

  FolidayLoginResponse({
    this.errorMessage,
    this.hasError,
    this.message,
    this.received,
    this.responseCode,
    this.token
  });

  factory FolidayLoginResponse.fromJson(Map<String, dynamic> json) {
    return FolidayLoginResponse(
      errorMessage: json['errorMessage'],
      hasError: json['hasError'],
      message: json['message'],
      received: json['received'],
      responseCode: json['responseCode'],
      token: json['token']
    );
  }
}
