import 'dart:convert';

OtpSendApi otpSendApiFromJson(String str) => OtpSendApi.fromJson(json.decode(str));

String otpSendApiToJson(OtpSendApi data) => json.encode(data.toJson());

class OtpSendApi {
    String mobileNumber;
    String deviceId;

    OtpSendApi({
        required this.mobileNumber,
        required this.deviceId,
    });

    factory OtpSendApi.fromJson(Map<String, dynamic> json) => OtpSendApi(
        mobileNumber: json["mobileNumber"],
        deviceId: json["deviceId"],
    );

    Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNumber,
        "deviceId": deviceId,
    };
}
