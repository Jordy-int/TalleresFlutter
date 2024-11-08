enum DeQuien { mio, ella } // Enumeración para saber de quién es el mensaje

class Mensaje {
  final String text; // Texto que me enviara
  final String? imageUrl; // Meme que enviara. Es opcional
  final DeQuien deQuien;

  Mensaje({
    required this.text,
    this.imageUrl,
    required this.deQuien,
  }); // Constructor
}
