class Cartcomponent {
  final String compname;
  final String skuid;
 int Quantity;
  

  Cartcomponent({required this.compname, required this.skuid,required this.Quantity});

 Map<String,dynamic> toJson(){

 return{

  'compname':compname,
  'skuid':skuid,
  'Quantity':Quantity

 };

 }


}