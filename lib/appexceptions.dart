class Appexceptions implements Exception{
   final String message;
  final String prefix;
  final String url;

  Appexceptions(this.message, this.prefix, this.url);

}
class Badrequestexceptions extends Appexceptions{
  Badrequestexceptions(String message, String url) : super(message,'bad req', url);

}

class Fetchdataexceptions extends Appexceptions{
  Fetchdataexceptions(String message, String url) : super(message,'unable to process', url);

}

class Apinoresponseexceptions extends Appexceptions{
  Apinoresponseexceptions(String message, String url) : super(message,'Api not responding', url);

}


class unauthrisedexceptions extends Appexceptions{
  unauthrisedexceptions(String message, String url) : super(message,'unauthrised', url);

}