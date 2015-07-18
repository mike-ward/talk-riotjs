import riot from 'riot'
import jsonp from 'browser-jsonp'

class ITunesStore {
  constructor() {
    riot.observable(this);
    this.bindEvents();
  }

  bindEvents() {
    this.on(riot.EVT.queryITunesStore, (term, media) => {
      jsonp({
        url: 'https://itunes.apple.com/search',
        data: { term: term, media: media },
        success: data => this.trigger(riot.EVT.queryITunesStoreSuccess, data),
        error: err => alert(err)
      });
    });
  }
}

// add store to riot control
let iTunesStore = new ITunesStore();
riot.control.addStore(iTunesStore);

export default iTunesStore;