part of ticket_client;

@Component(
  selector: 'picker',
  properties: const ['emitter']
)
@View(
  styleUrls: const ["package:tickets/client/components/picker/picker.css"],
  templateUrl: "package:tickets/client/components/picker/picker.html",
  directives: const [CORE_DIRECTIVES, FORM_DIRECTIVES, routerDirectives]
)
class Picker extends Object {
  Router _router;
  NgForm flightForm;
  FlightPostParamsDTO info = new FlightPostParamsDTO();
  List<CityDTO> cities;
  FlightQueryService queryService;
  String depart_city;

  EventEmitter external_emitter;

  void set emitter(val) {
    external_emitter = val;
  }

  EventEmitter get zebra{
    return external_emitter;
  }

  Picker(Router this._router, FlightQueryService this.queryService) {
    populateCitites();
    populateState();
  }

  void onFind(city) {
    onSubmit();
  }

  void populateCitites() {
    queryService.fetchCities().then( (List<CityDTO> dtos) {
      cities = dtos;

    });
  }

  void populateState() {
//    info = info.setup(_routeProvider.parameters, info);
  }

  onSubmit()
  {
    external_emitter.add({'val': 'Success!!'});

//    Instruction _navigationInstruction = this._router.generate(['/picker', info.toPostable() ]);
//    this._router.navigateInstruction(_navigationInstruction);
  }
}