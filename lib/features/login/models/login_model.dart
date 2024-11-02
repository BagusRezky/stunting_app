class LoginResponse {
  final String? status;
  final String? message;
  final String? token;
  final String? tokenType;
  final int? expiresIn;
  final Map<String, dynamic>? data;

  LoginResponse({
    this.status,
    this.message,
    this.token,
    this.tokenType,
    this.expiresIn,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      token: json['data']?['token'],
      tokenType: json['data']?['token_type'],
      expiresIn: json['data']?['expires_in'],
      data: json['data'] as Map<String, dynamic>?,
    );
  }
}
