class BoardCreationPayload {
  final String name;
  String idBoardSource;
  String idOrganization;

  BoardCreationPayload(this.idBoardSource, this.idOrganization, this.name);

  toJson() => {
    'name': name,
    'idBoardSource': idBoardSource,
    'idOrganization': idOrganization
  };
}