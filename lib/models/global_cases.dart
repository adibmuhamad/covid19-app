class GlobalCases {
  int id;
  String country;
  int confirmed;
  int deaths;
  int recovered;
  int active;

  GlobalCases(
    {
      this.id = 0,
      this.country = "",
      this.confirmed = 0,
      this.deaths = 0,
      this.recovered = 0,
      this.active = 0,
    }
  );

  GlobalCases.fromJson(Map<String, dynamic> json) :
        id =  json['OBJECTID'] == null ? 0 : json['OBJECTID'],
        country =  json['Country_Region'] == null ? '' : json['Country_Region'],
        confirmed =  json['Confirmed'] == null ? 0 : json['Confirmed'],
        deaths =  json['Deaths'] == null ? 0 : json['Deaths'],
        recovered =  json['Recovered'] == null ? 0 : json['Recovered'],
        active =  json['Active'] == null ? 0 : json['Active'];
}