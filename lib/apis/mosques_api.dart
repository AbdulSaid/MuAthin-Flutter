import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muathin/config/config.dart';
import 'package:muathin/models/mosque.dart';
import 'package:muathin/services/services.dart';

class MosquesAPI {
  final CollectionReference _mosquesCollection = Firestore.instance.collection(Config.mosques);

  CollectionReference get mosquesCollection => this._mosquesCollection;

  Future<Mosque> mosque({String mosqueID}) async {
    DocumentSnapshot ds = await this.mosquesCollection.document(mosqueID).get();
    return Mosque().transform(key: ds.documentID, map: ds.data);
  }

  observeMosques({GeoPoint geoPoint, double radius, int limitTo, Function onAdded(Mosque m),
    Function onModified(Mosque m), Function onRemoved(Mosque m), Function onEmpty,  Function onFailure(String e)}) {
    Services().crud.readRT(
        query: this.mosquesCollection
            .limit(limitTo)
            .snapshots(),
        onAdded: (ds) {
          onAdded(Mosque().transform(key: ds.documentID, map: ds.data));
        },
        onModified: (ds) {
          onModified(Mosque().transform(key: ds.documentID, map: ds.data));
        },
        onRemoved: (ds) {
          onRemoved(Mosque().transform(key: ds.documentID, map: ds.data));
        },
        onEmpty: () {
          onEmpty();
        },
        onFailure: (e) {
          onFailure(e);
        });
  }

}