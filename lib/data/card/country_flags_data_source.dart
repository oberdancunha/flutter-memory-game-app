import '../../infrastructure/card/card_data_source.dart';
import '../../infrastructure/card/card_dto.dart';

class CountryFlagsDataSource implements CardDataSource {
  @override
  // ignore: long-method
  List<CardDto> create() {
    const imageBasePath = 'assets/images/country_flags';

    return [
      CardDto(
        name: 'Brasil',
        image: '$imageBasePath/brazil.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Inglaterra',
        image: '$imageBasePath/england.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'France',
        image: '$imageBasePath/france.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Alemanha',
        image: '$imageBasePath/germany.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Itália',
        image: '$imageBasePath/italy.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Japão',
        image: '$imageBasePath/japan.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Holanda',
        image: '$imageBasePath/netherlands.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Espanha',
        image: '$imageBasePath/spain.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Suíça',
        image: '$imageBasePath/switzerland.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Estados Unidos',
        image: '$imageBasePath/united-states.png',
        selectedToGame: 0,
      ),
    ];
  }
}
