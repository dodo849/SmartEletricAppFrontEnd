
class UserValidation {
  final String joinYn;
  final String infoYn;
  final String ExpAgreeDate;
  final String ProvideAgreeDate;

  UserValidation(this.joinYn, this.infoYn, this.ExpAgreeDate, this.ProvideAgreeDate);

  UserValidation.fromJson(Map<String, dynamic> json)
      : joinYn = json['joinYn'],
        infoYn = json['infoYn'],
        ExpAgreeDate = json['exp_agre_dd'],
        ProvideAgreeDate = json['prvd_agre_dd'];

  Map<String, dynamic> toJson() => {
        'name': joinYn,
        'email': infoYn,
        'exp_agre_dd': ExpAgreeDate,
        'prvd_agre_dd': ProvideAgreeDate,
      };
}
