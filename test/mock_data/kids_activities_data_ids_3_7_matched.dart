import 'package:flutter_memory_game_app/domain/card/card.dart';
import 'package:kt_dart/collection.dart';

const imageBasePath = 'assets/images/kids_activities';

KtList<Card> mockKidsActivitiesIds3and7Matched() => [
      const Card(
        id: 1,
        name: 'Futebol',
        image: 'assets/images/kids_activities/soccer.png',
        isMatched: false,
      ),
      const Card(
        id: 2,
        name: 'Pipa',
        image: 'assets/images/kids_activities/kite.png',
        isMatched: false,
      ),
      const Card(
        id: 3,
        name: 'Livro',
        image: 'assets/images/kids_activities/learning.png',
        isMatched: true,
      ),
      const Card(
        id: 4,
        name: 'Pipa',
        image: 'assets/images/kids_activities/kite.png',
        isMatched: false,
      ),
      const Card(
        id: 5,
        name: 'Pintura',
        image: 'assets/images/kids_activities/painting.png',
        isMatched: false,
      ),
      const Card(
        id: 6,
        name: 'Ping-pong',
        image: 'assets/images/kids_activities/ping-pong.png',
        isMatched: false,
      ),
      const Card(
        id: 7,
        name: 'Livro',
        image: 'assets/images/kids_activities/learning.png',
        isMatched: true,
      ),
      const Card(
        id: 8,
        name: 'Balde de areia',
        image: 'assets/images/kids_activities/sand-bucket.png',
        isMatched: false,
      ),
      const Card(
        id: 9,
        name: 'Skate',
        image: 'assets/images/kids_activities/skateboarding.png',
        isMatched: false,
      ),
      const Card(
        id: 10,
        name: 'Balde de areia',
        image: 'assets/images/kids_activities/sand-bucket.png',
        isMatched: false,
      ),
      const Card(
        id: 11,
        name: 'Patins',
        image: 'assets/images/kids_activities/roller-skate.png',
        isMatched: false,
      ),
      const Card(
        id: 12,
        name: 'Basquete',
        image: 'assets/images/kids_activities/basketball.png',
        isMatched: false,
      ),
      const Card(
        id: 13,
        name: 'Ping-pong',
        image: 'assets/images/kids_activities/ping-pong.png',
        isMatched: false,
      ),
      const Card(
        id: 14,
        name: 'Skate',
        image: 'assets/images/kids_activities/skateboarding.png',
        isMatched: false,
      ),
      const Card(
        id: 15,
        name: 'Pintura',
        image: 'assets/images/kids_activities/painting.png',
        isMatched: false,
      ),
      const Card(
        id: 16,
        name: 'Patins',
        image: 'assets/images/kids_activities/roller-skate.png',
        isMatched: false,
      ),
      const Card(
        id: 17,
        name: 'Balança',
        image: 'assets/images/kids_activities/swing.png',
        isMatched: false,
      ),
      const Card(
        id: 18,
        name: 'Basquete',
        image: 'assets/images/kids_activities/basketball.png',
        isMatched: false,
      ),
      const Card(
        id: 19,
        name: 'Futebol',
        image: 'assets/images/kids_activities/soccer.png',
        isMatched: false,
      ),
      const Card(
        id: 20,
        name: 'Balança',
        image: 'assets/images/kids_activities/swing.png',
        isMatched: false,
      ),
    ].toImmutableList();
