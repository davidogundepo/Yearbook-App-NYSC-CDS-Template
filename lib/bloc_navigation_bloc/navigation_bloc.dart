
import 'package:bloc/bloc.dart';
import '../thrown_pages/batch_a_stream_one_thrown_page.dart';
import '../thrown_pages/batch_a_stream_two_thrown_page.dart';
import '../thrown_pages/batch_b_stream_one_thrown_page.dart';
import '../thrown_pages/batch_b_stream_two_thrown_page.dart';
import '../thrown_pages/batch_c_stream_one_thrown_page.dart';
import '../thrown_pages/batch_c_stream_two_thrown_page.dart';
import '../thrown_pages/executive_cds_coordinators_thrown_page.dart';
import '../thrown_pages/lg_officials_thrown_page.dart';

enum NavigationEvents {
  MyBatchAStreamOnePageClickedEvent,
  MyBatchAStreamTwoPageClickedEvent,
  MyBatchBStreamOnePageClickedEvent,
  MyBatchBStreamTwoPageClickedEvent,
  MyBatchCStreamOnePageClickedEvent,
  MyBatchCStreamTwoPageClickedEvent,
  MyExecutivePageClickedEvent,
  MyLGOfficialsPageClickedEvent,
}


abstract class NavigationStates {}


class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => MyBatchBStreamOnePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents events) async* {
    switch (events) {
      case NavigationEvents.MyBatchAStreamOnePageClickedEvent:
        yield MyBatchAStreamOnePage();
        break;
      case NavigationEvents.MyBatchAStreamTwoPageClickedEvent:
        yield MyBatchAStreamTwoPage();
        break;
      case NavigationEvents.MyBatchBStreamOnePageClickedEvent:
        yield MyBatchBStreamOnePage();
        break;
      case NavigationEvents.MyBatchBStreamTwoPageClickedEvent:
        yield MyBatchBStreamTwoPage();
        break;
      case NavigationEvents.MyBatchCStreamOnePageClickedEvent:
        yield MyBatchCStreamOnePage();
        break;
      case NavigationEvents.MyBatchCStreamTwoPageClickedEvent:
        yield MyBatchCStreamTwoPage();
        break;
      case NavigationEvents.MyExecutivePageClickedEvent:
        yield MyExecutiveCDSCoordinatorsPage();
        break;
      case NavigationEvents.MyLGOfficialsPageClickedEvent:
        yield MyLGOfficialsPage();
        break;
    }
  }


}
