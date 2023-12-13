class Usuario {
    late String _id;
    late String _firstname;
    late String _lastname;


    /// Getters
    String get id => _id;
    String get firstname => _firstname;
    String get lastname => _lastname;

    /// Setters
    set id(String value) {
      if(value.isNotEmpty){
        _id = value;
      }
    }
    set firstname(String value) {
      if(value.isNotEmpty) {
        _firstname = value;
      }
    }
    set lastname(String value) {
      if(value.isNotEmpty) {
        _lastname = value;
      }
    }

}