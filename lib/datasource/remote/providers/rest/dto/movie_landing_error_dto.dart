class MovieLandingErrorDto {
 late List<String>? errors;

  MovieLandingErrorDto({this.errors});

  MovieLandingErrorDto.fromJson(Map<String, dynamic> json) {
    List<dynamic> errorsList = json['errors'];
    this.errors = [];
    this.errors!.addAll(errorsList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors;
    return data;
  }
}
