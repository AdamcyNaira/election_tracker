import 'package:election_tracker/providers/event_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/incendent.dart';
import '../services/api_services.dart';

final appStateProvider = ChangeNotifierProvider((ref) => AppState());

final incidenceListState = FutureProvider.autoDispose<List<Incidence>>((ref) async {
  return await Services().getIncedence();
});
