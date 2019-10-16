class LoginResponse {
  bool isProgress = false;
  bool isSuccess = false;
  String message = "success";
  String accessToken = "";
  String refreshToken = "";

  LoginResponse(this.isProgress, this.isSuccess, this.message, this.accessToken,
      this.refreshToken);

  @override
  String toString() {
    return message;
  }
}
