class ProvinceCases {
  int id;
  int codeProv;
  String name;
  int positif;
  int sembuh;
  int meninggal;

  ProvinceCases(
      {
        this.id = 0,
        this.codeProv = 0,
        this.name = "",
        this.positif = 0,
        this.sembuh = 0,
        this.meninggal = 0,
      }
      );

  ProvinceCases.fromJson(Map<String, dynamic> json) :
        id =  json['FID'] == null ? 0 : json['FID'],
        codeProv =  json['Kode_Provi'] == null ? 0 : json['Kode_Provi'],
        name =  json['Provinsi'] == null ? 0 : json['Provinsi'],
        positif =  json['Kasus_Posi'] == null ? 0 : json['Kasus_Posi'],
        sembuh =  json['Kasus_Semb'] == null ? 0 : json['Kasus_Semb'],
        meninggal =  json['Kasus_Meni'] == null ? 0 : json['Kasus_Meni'];
}