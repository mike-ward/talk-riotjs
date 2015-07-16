import riot from 'riot';
import Riotcontrol from 'riotcontrol';

riot.control = Riotcontrol;

// event names

riot.EVT = {
  loadItems : 'load_items',
  loadItemsSuccess : 'load_items_success',
  queryITunesStore : 'query-itunes-store',
  queryITunesStoreSuccess : 'query-itunes-store-success'  
}
