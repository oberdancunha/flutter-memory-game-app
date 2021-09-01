import '../../infrastructure/card/card_data_source.dart';
import '../../infrastructure/card/card_dto.dart';

class AnimalsDataSource implements CardDataSource {
  @override
  // ignore: long-method
  List<CardDto> create() {
    const imageBasePath = 'assets/images/animals';

    return [
      CardDto(
        name: 'Borboleta',
        image: '$imageBasePath/butterfly.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Gato',
        image: '$imageBasePath/cat.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Elefante',
        image: '$imageBasePath/elephant.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Raposa',
        image: '$imageBasePath/fox.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Sapo',
        image: '$imageBasePath/frog.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Joaninha',
        image: '$imageBasePath/ladybug.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Coruja',
        image: '$imageBasePath/owl.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Porco',
        image: '$imageBasePath/pig.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Coelho',
        image: '$imageBasePath/rabbit.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Ovelha',
        image: '$imageBasePath/sheep.png',
        selectedToGame: 0,
      ),
    ];
  }
}
