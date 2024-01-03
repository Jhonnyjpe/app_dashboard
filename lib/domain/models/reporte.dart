class Reporte {
  final String estado;
  final String tipoDeArchivo;
  final String titulo;
  final String descripcion;
  final String usuario;
  final String actualizacion;
  final String url;
  final String destinatario;

  Reporte({
    required this.url,
    required this.destinatario,
    required this.estado,
    required this.tipoDeArchivo,
    required this.titulo,
    required this.descripcion,
    required this.usuario,
    required this.actualizacion,
  });
}
