class Country{


  String update_date_time;
  int local_total_cases;
  int local_deaths;
  int local_recovered;

  Country({required this.local_deaths,required this.local_recovered,required this.local_total_cases,required this.update_date_time});

factory Country.fromJson(Map<String,dynamic>json){
  return  Country(
      update_date_time: json['data']['update_date_time'] as String,
      local_recovered: json['data']['local_recovered'] as int,
      local_total_cases: json['data']['local_total_cases'] as int,
      local_deaths: json['data'][' local_deaths'] as int,);
}
}