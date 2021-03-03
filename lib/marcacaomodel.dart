class Consultorio {
  int idConsultorio;
  String nomeConsultorio;

  Consultorio({this.idConsultorio, this.nomeConsultorio});

  Consultorio.fromJson(Map<String, dynamic> json) {
    idConsultorio = json['idConsultorio'];
    nomeConsultorio = json['NomeConsultorio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idConsultorio'] = this.idConsultorio;
    data['NomeConsultorio'] = this.nomeConsultorio;
    return data;
  }
}

class ConsultorioList {
  final List<Consultorio> consultoriolist;

  ConsultorioList({
    this.consultoriolist,
  });

  factory ConsultorioList.fromJson(List<dynamic> parsedJson) {
    List<Consultorio> med = new List<Consultorio>();
    med = parsedJson.map((i) => Consultorio.fromJson(i)).toList();

    return new ConsultorioList(consultoriolist: med);
  }
}

class Especialidades {
  int idEspecialidade;
  String nomeEspecialidade;

  Especialidades({this.idEspecialidade, this.nomeEspecialidade});

  Especialidades.fromJson(Map<String, dynamic> json) {
    idEspecialidade = json['idEspecialidade'];
    nomeEspecialidade = json['NomeEspecialidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idEspecialidade'] = this.idEspecialidade;
    data['NomeEspecialidade'] = this.nomeEspecialidade;
    return data;
  }
}

class EspecialidadesList {
  final List<Especialidades> especialidadeslist;

  EspecialidadesList({
    this.especialidadeslist,
  });

  factory EspecialidadesList.fromJson(List<dynamic> parsedJson) {
    List<Especialidades> med = new List<Especialidades>();
    med = parsedJson.map((i) => Especialidades.fromJson(i)).toList();

    return new EspecialidadesList(especialidadeslist: med);
  }
}
