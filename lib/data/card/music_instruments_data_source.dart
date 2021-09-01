import '../../infrastructure/card/card_data_source.dart';
import '../../infrastructure/card/card_dto.dart';

class MusicInstrumentsDataSource implements CardDataSource {
  @override
  // ignore: long-method
  List<CardDto> create() {
    const imageBasePath = 'assets/images/music_instruments';

    return [
      CardDto(
        name: 'Violão',
        image: '$imageBasePath/acoustic-guitar.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Guitarra',
        image: '$imageBasePath/bass-guitar.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Bateria',
        image: '$imageBasePath/drums.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Flauta',
        image: '$imageBasePath/flute.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Teclado',
        image: '$imageBasePath/melodica.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Piano',
        image: '$imageBasePath/piano.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Saxofone',
        image: '$imageBasePath/saxophone.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Pandeiro',
        image: '$imageBasePath/tambourine.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Trompete',
        image: '$imageBasePath/trumpet.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Violino',
        image: '$imageBasePath/violin.png',
        selectedToGame: 0,
      ),
    ];
  }
}
