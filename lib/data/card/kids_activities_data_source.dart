import '../../infrastructure/card/card_data_source.dart';
import '../../infrastructure/card/card_dto.dart';

class KidsActivitiesDataSouce implements CardDataSource {
  @override
  // ignore: long-method
  List<CardDto> create() {
    const imageBasePath = 'assets/images/kids_activities';

    return [
      CardDto(
        name: 'Basquete',
        image: '$imageBasePath/basketball.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Pipa',
        image: '$imageBasePath/kite.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Livro',
        image: '$imageBasePath/learning.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Pintura',
        image: '$imageBasePath/painting.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Ping-pong',
        image: '$imageBasePath/ping-pong.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Patins',
        image: '$imageBasePath/roller-skate.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Balde de areia',
        image: '$imageBasePath/sand-bucket.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Skate',
        image: '$imageBasePath/skateboarding.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Futebol',
        image: '$imageBasePath/soccer.png',
        selectedToGame: 0,
      ),
      CardDto(
        name: 'Balança',
        image: '$imageBasePath/swing.png',
        selectedToGame: 0,
      ),
    ];
  }
}
