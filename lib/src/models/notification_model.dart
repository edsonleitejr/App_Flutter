class NotificationModel {
  NotificationModel({
    this.id,
    this.user_id,
    this.data_publicacao,
    this.titulo,
    this.mensagem,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user_id = json['user_id'];
    data_publicacao = json['data_publicacao'];
    titulo = json['titulo'];
    mensagem = json['mensagem'];
  }

  int id;
  String user_id;
  String data_publicacao;
  String titulo;
  String mensagem;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = user_id;
    data['data_publicacao'] = data_publicacao;
    data['titulo'] = titulo;
    data['mensagem'] = mensagem;

    return data;
  }
}